#!../../bin/linux-x86/HVCAENx527
#
# Copyright Canadian Light Source, Inc.  All rights reserved.
#    - see licence.txt and licence_CAEN.txt for limitations on use.
#

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/HVCAENx527.dbd",0,0)
HVCAENx527_registerRecordDeviceDriver(pdbbase)

HVCAENx527Connect( "SY1527", "10.51.10.11")

## Load record instances
dbLoadRecords("db/PS1014001.db")
dbLoadRecords("db/PS1014001ch.db")

cd ${TOP}/iocBoot/${IOC}
iocInit()

## Start any sequence programs
#seq sncxxx,"PSNAME=PS1014001"
