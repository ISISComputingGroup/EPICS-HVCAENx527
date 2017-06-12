/* $Header: HVCAENx527/libHVCAENx527App/src/HVCAENx527chMBBio.c 1.16.1.1 2014/04/30 15:37:14CST Ru Igarashi (igarasr) Exp  $ 
 *
 * Copyright Canadian Light Source, Inc.  All rights reserved.
 *    - see licence.txt and licence_CAEN.txt for limitations on use.
 */
/*
 * HVCAENx527chMBBio.c:
 * MultiBit Binary input record and output record device support routines.
 */

#include <mbbiRecord.h>
#include <mbboRecord.h>

#include <epicsExport.h>
#include "HVCAENx527.h"
/*
 * devCAENx527chMBBi
 */

static long
init_record_mbbi( mbbiRecord *pior)
{
	struct instio *pinstio;
	PARPROP *pp = NULL;

	if( pior->inp.type != INST_IO)
	{
		errlogPrintf( "%s: mbbi INP field type should be INST_IO\n", pior->name);
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
		pior->evnt[0] = pp->evntno;
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
read_mbbi( mbbiRecord *pior)
{
#if SCAN_SERVER == 0
	void *pval;
#endif
	PARPROP *pp = NULL;

	pp = (PARPROP *)pior->dpvt;
	if( pp == NULL || pp->hvchan->epicsenabled == 0 || pp->hvchan->hvcrate->connected == 0)
		return( 3);

#if SCAN_SERVER == 0
	pval = CAENx527GetChParVal( pp);
	if( pval == NULL)
		return( 3);
#endif

	pior->val = CAENx527mbbi2state( pp);
	pior->udf = FALSE;
PDEBUG(5) printf( "DEBUG: get %s = %o %hd\n", pp->pname, (short)(pp->pval.l), pior->val);

	return( 2);
}

struct
{
        long number;
        DEVSUPFUN       report;
        DEVSUPFUN       init;
        DEVSUPFUN       init_record;
        DEVSUPFUN       get_ioint_info;
        DEVSUPFUN       read_mbbi;
} devCAENx527chMBBi = 
        {
                5,
                NULL,
                NULL,
                init_record_mbbi,
                NULL,
                read_mbbi
        };

/*
 * devCAENx527chMBBo
 */

static long
init_record_mbbo( mbboRecord *pior)
{
	struct instio *pinstio;
	PARPROP *pp = NULL;
	void *pval;

	if( pior->out.type != INST_IO)
	{
		errlogPrintf( "%s: mbbo INP field type should be INST_IO\n", pior->name);
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

	/* Initialize the value from value in the crate */
	pval = CAENx527GetChParVal( pp);
	if( pval == NULL)
		return( 3);
	pior->val = CAENx527mbbi2state( pp);
	pior->rval = CAENx527mbbi2state( pp);

	pp->hvchan->epicsenabled = 1;

	return( 0);
}

static long
write_mbbo( mbboRecord *pior)
{
	PARPROP *pp;

	pp = (PARPROP *)(pior->dpvt);
	if( pp == NULL || pp->hvchan->epicsenabled == 0)
		return(3);
	pp->pvalset.l = (int)(pior->val);
PDEBUG(4) printf( "DEBUG: put %s = %d\n", pp->pname, (int)(pior->val));
	if( CAENx527SetChParVal( pp) != 0)
		return( 3);

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
        DEVSUPFUN       write_mbbo;
} devCAENx527chMBBo =
        {
                5,
                NULL,
                NULL,
                init_record_mbbo,
                NULL,
                write_mbbo
        };
epicsExportAddress(dset,devCAENx527chMBBi);
epicsExportAddress(dset,devCAENx527chMBBo);

/*
 *  $Log: HVCAENx527/libHVCAENx527App/src/HVCAENx527chMBBio.c  $
 *  Revision 1.16.1.1 2014/04/30 15:37:14CST Ru Igarashi (igarasr) 
 *  fixed type error
 *  Revision 1.16 2014/04/29 23:04:40CST Ru Igarashi (igarasr) 
 *  Member moved from HVCAENx527/HVCAENx527App/src/HVCAENx527chMBBio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/libHVCAENx527App/src/HVCAENx527chMBBio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 *  Revision 1.15 2014/04/28 20:05:42CST Ru Igarashi (igarasr) 
 *  harmonized debug level usage (as per HVCAENx527.h)
 *  Revision 1.14 2007/06/01 13:32:58CST Ru Igarashi (igarasr) 
 *  Member moved from EPICS/HVCAENx527App/src/HVCAENx527chMBBio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/HVCAENx527App/src/HVCAENx527chMBBio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 */
