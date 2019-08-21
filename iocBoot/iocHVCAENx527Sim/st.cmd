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

##ISIS## Run IOC initialisation 
< $(IOCSTARTUP)/init.cmd

$(IFREADONLY=#) epicsEnvSet "CAN_WRITE" "#"

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

##ISIS## Load common DB records 
< $(IOCSTARTUP)/dbload.cmd

$(CAN_WRITE= ) CAENx527DbLoadRecords("P=$(MYPVPREFIX)CAEN, ASG=DEFAULT")
$(IFREADONLY=#) CAENx527DbLoadRecords("P=$(MYPVPREFIX)CAEN, ASG=READONLY")


## Set this to see messages from mySub
#var mySubDebug 1


##ISIS## Stuff that needs to be done after all records are loaded but before iocInit is called 
< $(IOCSTARTUP)/preiocinit.cmd

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

##ISIS## Stuff that needs to be done after iocInit is called e.g. sequence programs 
< $(IOCSTARTUP)/postiocinit.cmd

## Start any sequence programs
#seq sncExample, "user=nersesHost"
seq sncSummary, "P=$(MYPVPREFIX)CAEN"
