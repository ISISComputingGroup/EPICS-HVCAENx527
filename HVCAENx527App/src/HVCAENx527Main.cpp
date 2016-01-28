/* $Header: HVCAENx527/HVCAENx527App/src/HVCAENx527Main.cpp 1.6.1.1 2014/04/30 17:46:55CST Ru Igarashi (igarasr) Exp  $
 * 
 * Copyright Canadian Light Source, Inc.  All rights reserved.
 *    - see licence.txt and licence_CAEN.txt for limitations on use.
 *
 * Author:  Ru Igarasr Date:    2006-04-07 
 *
 */

#include <stddef.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "epicsThread.h"
#include "iocsh.h"

extern "C" int ConnectCrate( char *name, char *linkaddr);
extern "C" void ParseCrateAddr( char (*straddr)[255], short naddr);
extern "C" void Shutdown();
extern "C" void SetSigShutdownHandler();

int main(int argc,char *argv[])
{
	int i, j;
	extern short DEBUG;
	short daemon;
	char stcmd[256];
	short naddr;
	char straddr[32][255];	/* MAX_BOARDS = 32 */
	/* Need to catch hangup signal to make sure semaphores are
	   cleaned up properly */
	SetSigShutdownHandler();

	daemon = 0;
	if(argc>=1) {    
		snprintf( stcmd, 255, "%s", argv[1]);
		/* parse command line args for crate and IP */
		j = 0;
		for( i = 2; i < argc; i++)
		{
			if( strcmp( argv[i], "-c") == 0)
			{
				i++;
				snprintf( straddr[j], 255, "%s", argv[i]);
				j++;
			}
			else if( strcmp( argv[i], "-D") == 0)
			{
				i++;
				DEBUG = atoi( argv[i]);
			}
			else if( strcmp( argv[i], "-d") == 0)
			{
				daemon = 1;
			}
		}
		naddr = j;
		if( naddr > 0)
			ParseCrateAddr( straddr, naddr);
	}
	else
	{
		printf( "Syntax: hvcontrol <st.cmd> [-d] [-D <debuglevel>]\n");
		printf( "              -d = run in daemon mode\n");
		printf( "              <debuglevel> = 0 no messages\n");
		printf( "              <debuglevel> = 10 all available messages\n");
		printf( "\nor, the old Syntax, which will eventually be deprecated:\n");
		printf( "        hvcontrol <st.cmd> [-c <name>@<hostname>] [-d] [-D <debuglevel>]\n");
	}

	if(stcmd)
		iocsh(stcmd);

	if( daemon)
	{
		for(;;)
			epicsThreadSleep(1.0);
	}
	else
		iocsh(NULL);

	Shutdown();

	return(0);
}

/* 
 *  $Log: HVCAENx527/HVCAENx527App/src/HVCAENx527Main.cpp  $
 *  Revision 1.6.1.1 2014/04/30 17:46:55CST Ru Igarashi (igarasr) 
 *  - new iocsh command eliminates need for command line connection information
 *  - removed dead code
 *  Revision 1.6 2007/06/01 13:32:58CST Ru Igarashi (igarasr) 
 *  Member moved from EPICS/HVCAENx527App/src/HVCAENx527Main.cpp in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj to HVCAENx527/HVCAENx527App/src/HVCAENx527Main.cpp in project e:/MKS_Home/archive/cs/epics_local/drivers/CAENx527HV/project.pj.
 */

