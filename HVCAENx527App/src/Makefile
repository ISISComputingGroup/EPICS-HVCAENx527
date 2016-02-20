TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build an ioc application

PROD_IOC = HVCAENx527
HVCAEN_BUILD_SHARED_YES = HVCAENx527Sim
PROD_IOC += $(HVCAEN_BUILD_SHARED_$(SHARED_LIBRARIES))

USR_CFLAGS += -DCAENHVWrapperVERSION=$(CAENHVWrapperVERSION)
ifneq ($(findstring linux,$(EPICS_HOST_ARCH)),) 
USR_LDFLAGS += -L$(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH)
endif

ifneq ($(findstring win32-x86,$(EPICS_HOST_ARCH)),)
CAEN_ARCH=win32
endif

ifneq ($(findstring windows-x64,$(EPICS_HOST_ARCH)),)
CAEN_ARCH=win64
endif

BIN_INSTALLS_Linux += $(wildcard $(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH)/*.so.*)
LIB_INSTALLS_Linux += $(wildcard $(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH)/*.so)

BIN_INSTALLS_WIN32 += $(wildcard $(CAENHVWRAPPER)/dll/$(CAEN_ARCH)/*.dll)
LIB_INSTALLS_WIN32 += $(wildcard $(CAENHVWRAPPER)/lib/$(CAEN_ARCH)/*.lib)

caenhvwrapper_DIR = $(CAENHVWRAPPER)/lib/$(CAEN_ARCH)
hscaenetlib_DIR = $(CAENHVWRAPPER)/lib/$(CAEN_ARCH)

#USR_CFLAGS_Linux += -std=gnu99		# for RH7 compatibility only
#USR_LDFLAGS_Linux += -ldl		# for RH7 compatibility only

# <name>.dbd will be created from <name>Include.dbd
DBD += HVCAENx527.dbd

# Alternatively, include dbd files from all support applications:
#HVCAENx527_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#HVCAENx527_LIBS += xxx
HVCAENx527_LIBS += HVCAENx527
HVCAENx527_LIBS_WIN32 += caenhvwrapper
HVCAENx527_SYS_LIBS_Linux += caenhvwrapper hscaenetlib

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
HVCAENx527_SRCS += HVCAENx527_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
HVCAENx527_SRCS_DEFAULT += HVCAENx527Main.cpp
HVCAENx527_SRCS_vxWorks += -nil-

HVCAENx527Sim_LIBS += HVCAENx527Sim

# Add support from base/src/vxWorks if needed
HVCAENx527_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

#NOTES:
#      1)It is not possible to build sncExample both as a component of HVCAENx527
#        and standalone. You must choose only one.
#      2)To build sncExample SNCSEQ must be defined in <top>/configure/RELEASE

#The following builds sncExample as a component of HVCAENx527
#HVCAENx527_SRCS += sncExample.stt
#HVCAENx527_LIBS += seq pv

# Finally link to the EPICS Base libraries
HVCAENx527_LIBS += asubFunctions
HVCAENx527Sim_LIBS += asubFunctions

CAENHVWrapperSim_LIBS += $(EPICS_BASE_IOC_LIBS)
CAENHVWrapperSim_SYS_LIBS_WIN32 += ws2_32

#The following builds sncExample as a standalone application
#PROD_HOST += sncExample
#sncExample_SNCFLAGS += +m
#sncExample_SRCS += sncExample.stt
#sncExample_LIBS += seq pv
#sncExample_LIBS += $(EPICS_BASE_HOST_LIBS)

#===========================
#Addition of a sequence for summary information
ifneq ($(SNCSEQ),)
    LIBRARY_IOC += HVCAENx527Summary
#	DBD += sncSummary.dbd

    sncSummary_SNCFLAGS += +r
    HVCAENx527Summary_SRCS += sncSummary.stt
    HVCAENx527Summary_DBD += sncSummary.dbd
    HVCAENx527Summary_LIBS += seq pv

    HVCAENx527_LIBS += HVCAENx527Summary
    HVCAENx527Sim_LIBS += HVCAENx527Summary

    HVCAENx527Sim_LIBS += CAENHVWrapperSim
    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

#HVCAENx527Sim_SRCS += $(HVCAENx527_SRCS)
HVCAENx527Sim_SRCS_DEFAULT += $(HVCAENx527_SRCS_DEFAULT)

HVCAENx527Sim_LIBS += CAENHVWrapperSim
HVCAENx527Sim_LIBS += seq pv
HVCAENx527Sim_LIBS += $(EPICS_BASE_IOC_LIBS)

HVCAENx527_LIBS += seq pv
HVCAENx527_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

sncProgram.c : sncSummary.stt
