/* $Header: HVCAENx527/libHVCAENx527App/src/HVCAENx527chStringio.c 1.10 2014/04/29 23:04:40CST Ru Igarashi (igarasr) Exp  $
 *
 * Copyright Canadian Light Source, Inc.  All rights reserved.
 *    - see licence.txt and licence_CAEN.txt for limitations on use.
 *
 *
 * HVCAENx527chStringio.c:
 * String input record and output record device support routines.
 */


#ifdef _WIN32
#include <windows.h> /* we need to make sure EPICS callback.h is loaded after windows.h */
#endif
#include <stringinRecord.h>
#include <stringoutRecord.h>
#include <epicsStdio.h>
#include <recGbl.h>
#include <alarm.h>

#include <epicsExport.h>
#include "HVCAENx527.h"

/*
 * devCAENx527chStringin
 */

static long
init_record_stringin( stringinRecord *pior)
{
	char str[256];
	struct instio *pinstio;
	HVCHAN *hvch = NULL;

	if( pior->inp.type != INST_IO)
	{
		printf( "%s: stringin INP field type should be INST_IO\n", pior->name);
		return( S_db_badField);
	}

	/* parse device dependent option string and set data pointer */
	pinstio = &(pior->inp.value.instio);
	if( ( hvch = CAENx527ParseDevArgs( pinstio->string)) == NULL)
	{
		printf( "%s: Invalid device parameters: \"%s\"\n", pior->name, pinstio->string);
		return(2);
	}

	if( (hvch->chname_evntno > 0) && ( sscanf( pinstio->string, "%*s %s", str) == 1) && ( strncmp( str, "ChName", 255) == 0))
        {
/* evnt changed in 3.15 */
#if defined(VERSION_INT)
		epicsSnprintf(pior->evnt, sizeof(pior->evnt), "%d", hvch->chname_evntno);
#else
		pior->evnt = hvch->chname_evntno;
#endif
        }

	pior->dpvt = hvch;
	hvch->epicsenabled = 1;

	return( 0);
}

static long
read_stringin( stringinRecord *pior)
{
#if SCAN_SERVER == 0
	void *pval;
#endif
	HVCHAN *hvch = NULL;

	hvch = (HVCHAN *)pior->dpvt;
	if( hvch == NULL || hvch->epicsenabled == 0 || hvch->hvcrate->connected == 0)
    {
        recGblSetSevr(pior, READ_ALARM, INVALID_ALARM);
		return( 3);
    }

#if SCAN_SERVER == 0
	pval = CAENx527GetChName( hvch);
	if( pval == NULL)
		return( 3);
#endif

	strcpy( pior->val, hvch->chname);
	pior->udf = FALSE;
PDEBUG(5) printf( "DEBUG: get name = %s\n", pior->val);

	return( 2);
}

struct
{
	long number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	read_stringin;
	DEVSUPFUN	special_linconv;
} devCAENx527chStringin =
	{
		6,
		NULL,
		NULL,
		init_record_stringin,
		NULL,
		read_stringin,
		NULL
	};

/*
 * devCAENx527chStringout
 */

static long
init_record_stringout( stringoutRecord *pior)
{
	struct instio *pinstio;
	HVCHAN *hvch = NULL;
	void *pval;

	if( pior->out.type != INST_IO)
	{
		printf( "%s: stringout OUT field type should be INST_IO\n", pior->name);
		return( S_db_badField);
	}

	/* parse device dependent option string and set data pointer */
	pinstio = &(pior->out.value.instio);
	if( ( hvch = CAENx527ParseDevArgs( pinstio->string)) == NULL)
	{
		printf( "%s: Invalid device parameters: \"%s\"\n", pior->name, pinstio->string);
		return( S_db_badField);
	}

	pior->dpvt = hvch;

	hvch->epicsenabled = 1;

	/* Initialize the value from value in the crate */
	pval = CAENx527GetChName( hvch);
	if( pval == NULL)
		return( 3);
	strcpy( pior->val, hvch->chname);
    pior->udf = FALSE;

PDEBUG(4) printf( "DEBUG: init stringout %s -> %s\n", pinstio->string, hvch->chname);


	return( 0);
}

static long
write_stringout( stringoutRecord *pior)
{
	HVCHAN *hvch;

	hvch = (HVCHAN *)(pior->dpvt);
	if( hvch == NULL || hvch->epicsenabled == 0 || hvch->hvcrate->connected == 0)
    {
        recGblSetSevr(pior, WRITE_ALARM, INVALID_ALARM);
		return( 3);
    }
	epicsSnprintf( hvch->chname, 12, "%s", pior->val);
PDEBUG(4) printf( "DEBUG: put name = %s\n", pior->val);
	if( CAENx527SetChName( hvch, pior->val) != 0)
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
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	write_stringout;
	DEVSUPFUN	special_linconv;
} devCAENx527chStringout =
	{
		6,
		NULL,
		NULL,
		init_record_stringout,
		NULL,
		write_stringout,
		NULL
	};
epicsExportAddress(dset,devCAENx527chStringin);
epicsExportAddress(dset,devCAENx527chStringout);

/*
 * $Log: HVCAENx527/libHVCAENx527App/src/HVCAENx527chStringio.c  $
 * Revision 1.10 2014/04/29 23:04:40CST Ru Igarashi (igarasr) 
 * Member moved from HVCAENx527/HVCAENx527App/src/HVCAENx527chStringio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/libHVCAENx527App/src/HVCAENx527chStringio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 * Revision 1.9 2014/04/28 20:05:42CST Ru Igarashi (igarasr) 
 * harmonized debug level usage (as per HVCAENx527.h)
 * Revision 1.8 2007/06/01 13:32:58CST Ru Igarashi (igarasr) 
 * Member moved from EPICS/HVCAENx527App/src/HVCAENx527chStringio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/HVCAENx527App/src/HVCAENx527chStringio.c in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 */
