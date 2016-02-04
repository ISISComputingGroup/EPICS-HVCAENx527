#!../../bin/linux-x86/HVCAENx527Sim

## You may have to change HVCAENx527 to something else
## everywhere it appears in this file

< envPaths

# Error Log To Console 0 or 1
eltc 1

cd ${TOP}

## Register all support components 
dbLoadDatabase "dbd/HVCAENx527.dbd"
HVCAENx527_registerRecordDeviceDriver pdbbase

# use -D argument to turn on debugging

## arguments to CAENx527ConfigureCreate are: name, ip_address, username, password
## username, password are optional and the crate factory default is used if these are not specified
#CAENx527ConfigureCreate "hv0", "130.246.39.47"
#CAENx527ConfigureCreate "hv1", "halldcaenhv1"


CAENx527ConfigureCreate "hv0", "127.0.0.1"
#HVCAENx527Connect( "SY1527", "127.0.0.1")

## Load record instances
#dbLoadTemplate "db/userHost.substitutions"
#dbLoadRecords "db/dbSubExample.db", "user=nersesHost"

CAENx527DbLoadRecords("P=$(MYPVPREFIX)CAEN")


## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=nersesHost"
seq sncSummary, "P=$(MYPVPREFIX)CAEN"
