/* $Header: HVCAENx527/libHVCAENx527App/src/HVCAENx527iocsh.c 1.1.1.1 2014/04/30 19:51:41CST Ru Igarashi (igarasr) Exp  $
 *
 * Copyright Canadian Light Source, Inc.  All rights reserved.
 *    - see licence.txt and licence_CAEN.txt for limitations on use.
 */
/*
 * HVCAENx527iocsh.c:
 * iocsh interfaces to provide runtime configuration and diagnostics
 */
#include <iocsh.h>
#include <epicsStdio.h>
#include <epicsString.h>
#include <epicsExport.h>
#include "HVCAENx527.h"

static const iocshArg HVCAENx527Connect0 = { "system", iocshArgString};
static const iocshArg HVCAENx527Connect1 = { "host", iocshArgString};
static const iocshArg *HVCAENx527ConnectArgs[2] = { &HVCAENx527Connect0, &HVCAENx527Connect1};

static const iocshFuncDef HVCAENx527ConnectFuncDef = { "HVCAENx527Connect", 2, HVCAENx527ConnectArgs};

void
HVCAENx527ConnectCallFunc( const iocshArgBuf *args)
{
	char straddr[1][256];

	if( args[1].sval)
	{
		epicsSnprintf( straddr[0], 256, "%s@%s", args[0].sval, args[1].sval);
	}
	else
	{
		printf( "Usage: HVCAENx527Connect system host\n");
		printf( "   where:\n");
#if CAENHVWrapperVERSION == 2
		printf( "   system = unique (user-defined) name of crate\n");
#else
		printf( "   system = system type of crate\n");
#endif	/* CAENHVWrapperVERSION */
		printf( "   host   = hostname or IP address of crate\n");
		printf( " e.g.: HVCAENx527Connect SY1527 IOC0001-001\n");
		printf( " e.g.: HVCAENx527Connect SY1527 192.168.0.2\n");
		return;
	}

	ParseCrateAddr( straddr, 1);
}

static const iocshArg HVCAENx527Debug0 = { "debuglevel", iocshArgInt};
static const iocshArg *HVCAENx527DebugArgs[1] = { &HVCAENx527Debug0};

static const iocshFuncDef HVCAENx527DebugFuncDef = { "HVCAENx527Debug", 1, HVCAENx527DebugArgs};

void
HVCAENx527DebugCallFunc( const iocshArgBuf *args)
{
	if( args[0].sval)
	{
		DEBUG = args[0].ival;
	}
	else
	{
		printf( "Usage: HVCAENx527Debug debugLevel\n");
		printf( " e.g.: HVCAENx527Debug 4\n");
		printf( "debugLevel of 0 turns off debugging.\n");
	}
}

void
HVCAENx527IocshRegistrar(void)
{
	iocshRegister( &HVCAENx527ConnectFuncDef, HVCAENx527ConnectCallFunc);
	iocshRegister( &HVCAENx527DebugFuncDef, HVCAENx527DebugCallFunc);
}
epicsExportRegistrar( HVCAENx527IocshRegistrar);

/*
 * $Log: HVCAENx527/libHVCAENx527App/src/HVCAENx527iocsh.c  $
 * Revision 1.1.1.1 2014/04/30 19:51:41CST Ru Igarashi (igarasr) 
 * added headers and footers
 */
