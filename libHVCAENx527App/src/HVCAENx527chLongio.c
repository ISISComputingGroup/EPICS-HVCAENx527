/* $Header: HVCAENx527/libHVCAENx527App/src/HVCAENx527chLongio.c 1.15 2014/04/29 23:04:40CST Ru Igarashi (igarasr) Exp  $
 * 
 * Copyright Canadian Light Source, Inc.  All rights reserved.
 *    - see licence.txt and licence_CAEN.txt for limitations on use.
 */
/*
 * HVCAENx527chLongio.c:
 * Long input record and long output record device support routines.
 */

#ifdef _WIN32
#include <windows.h> /* we need to make sure EPICS callback.h is loaded after windows.h */
#endif
#include <longinRecord.h>
#include <longoutRecord.h>
#include <epicsStdio.h>
#include <recGbl.h>
#include <alarm.h>

#include <epicsExport.h>
#include "HVCAENx527.h"
/*
 * devCAENx527chLongin
 */

static long
init_record_longin( longinRecord *pior)
{
	struct instio *pinstio;
	PARPROP *pp = NULL;

	if( pior->inp.type != INST_IO)
	{
		errlogPrintf( "%s: longin INP field type should be INST_IO\n", pior->name);
		return( S_db_badField);
	}

	/* parse device dependent option string and set data pointer */
	pinstio = &(pior->inp.value.instio);
	if( ( pp = CAENx527ParseDevArgs( pinstio->string)) == NULL)
	{
		errlogPrintf( "%s: Invalid device parameters: \"%s\"\n", pior->name, pinstio->string);
		return(2);
	}

	if( pp->evntno > 0)
        {
/* evnt changed in 3.15 */
#if defined(VERSION_INT)
		epicsSnprintf(pior->evnt, sizeof(pior->evnt), "%d", pp->evntno);
#else
		pior->evnt = pp->evntno;
#endif
        }

	pior->dpvt = pp;
	strcpy( pp->PVname, pior->name);
	pp->hvchan->epicsenabled = 1;

	return( 0);
}

static long
read_longin( longinRecord *pior)
{
#if SCAN_SERVER == 0
	void *pval;
#endif
	PARPROP *pp;

	pp = (PARPROP *)pior->dpvt;
	if( pp == NULL || pp->hvchan->epicsenabled == 0 || pp->hvchan->hvcrate->connected == 0)
    {
        recGblSetSevr(pior, READ_ALARM, INVALID_ALARM);
		return( 3);
    }

#if SCAN_SERVER == 0
	pval = CAENx527GetChParVal( pp);
	if( pval == NULL)
		return( 3);
#endif

	pior->val = (long)(pp->pval.l);
	pior->udf = FALSE;
PDEBUG(5) printf( "DEBUG: get %s = %ld\n", pp->pname, (long)(pior->val));

	return( 0);
}

struct
{
        long number;
        DEVSUPFUN       report;
        DEVSUPFUN       init;
        DEVSUPFUN       init_record;
        DEVSUPFUN       get_ioint_info;
        DEVSUPFUN       read_longin;
} devCAENx527chLongin = 
        {
                5,
                NULL,
                NULL,
                init_record_longin,
                NULL,
                read_longin
        };

/*
 * devCAENx527chLongout
 */

static long
init_record_longout( longoutRecord *pior)
{
	struct instio *pinstio;
	PARPROP *pp = NULL;
	void *pval;

	if( pior->out.type != INST_IO)
	{
		errlogPrintf( "%s: longout INP field type should be INST_IO\n", pior->name);
		return( S_db_badField);
	}

	/* parse device dependent option string and set data pointer */
	pinstio = &(pior->out.value.instio);
	if( ( pp = CAENx527ParseDevArgs( pinstio->string)) == NULL)
	{
		errlogPrintf( "%s: Invalid device parameters: \"%s\"\n", pior->name, pinstio->string);
		return(2);
	}

	pior->dpvt = pp;
	strcpy( pp->PVname, pior->name);

	pp->hvchan->epicsenabled = 1;

	/* Initialize the value from value in the crate */
	pval = CAENx527GetChParVal( pp);
	if( pval == NULL)
		return( 3);
	pior->val = (long)(pp->pval.l);
    pior->udf = FALSE;

	return( 0);
}

static long
write_longout( longoutRecord *pior)
{
	PARPROP *pp;

	pp = (PARPROP *)(pior->dpvt);
	if( pp == NULL || pp->hvchan->epicsenabled == 0 || pp->hvchan->hvcrate->connected == 0)
    {
        recGblSetSevr(pior, WRITE_ALARM, INVALID_ALARM);
		return( 3);
    }
	pp->pvalset.l = (long)(pior->val);
PDEBUG(4) printf( "DEBUG: put %s = %ld\n", pp->pname, (long)(pior->val));
	if( CAENx527SetChParVal( pp) != 0)
    {
        recGblSetSevr(pior, WRITE_ALARM, INVALID_ALARM);
		return( 3);
    }

	pior->udf = FALSE;

	return( 0);
}

struct
{
        long number;
        DEVSUPFUN       report;
        DEVSUPFUN       init;
        DEVSUPFUN       init_record;
        DEVSUPFUN       get_ioint_info;
        DEVSUPFUN       write_longout;
} devCAENx527chLongout =
        {
                5,
                NULL,
                NULL,
                init_record_longout,
                NULL,
                write_longout
        };
epicsExportAddress(dset,devCAENx527chLongin);
epicsExportAddress(dset,devCAENx527chLongout);

/* 
 * $Log: HVCAENx527/libHVCAENx527App/src/HVCAENx527chLongio.c  $
 * Revision 1.15 2014/04/29 23:04:40CST Ru Igarashi (igarasr) 
 * Member moved from HVCAENx527/HVCAENx527App/src/HVCAENx527chLongio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/libHVCAENx527App/src/HVCAENx527chLongio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 * Revision 1.14 2014/04/28 20:05:42CST Ru Igarashi (igarasr) 
 * harmonized debug level usage (as per HVCAENx527.h)
 * Revision 1.13 2007/06/01 13:32:58CST Ru Igarashi (igarasr) 
 * Member moved from EPICS/HVCAENx527App/src/HVCAENx527chLongio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/HVCAENx527App/src/HVCAENx527chLongio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 */
