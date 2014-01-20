TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# build an ioc application

ifneq ($(findstring win32-x86,$(EPICS_HOST_ARCH)),) 
#FILE_TYPE += pdb
#INSTALL_pdb = $(INSTALL_BIN)
#USR_CXXFLAGS += /Zi
#USR_CFLAGS += /Zi
#USR_LDFLAGS += /DEBUG
#pdb += HVCAENx527Support.pdb HVCAENx527.pdb
else
USR_LDFLAGS += -L$(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH)
endif

BIN_INSTALLS_Linux += $(wildcard $(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH)/*.so.*)
BIN_INSTALLS_WIN32 += $(wildcard $(CAENHVWRAPPER)/dll/win32/*.dll)

LIBRARY_IOC =  CAENHVWrapperSim HVCAENx527SimSupport

HVCAEN_BUILD_SHARED_YES = HVCAENx527Sim 
PROD_IOC +=  $(HVCAEN_BUILD_SHARED_$(SHARED_LIBRARIES)) 
ifneq ($(findstring win32-x86,$(EPICS_HOST_ARCH)),)
PROD_IOC +=  HVCAENx527
LIBRARY_IOC += HVCAENx527Support
endif
ifneq ($(findstring linux,$(EPICS_HOST_ARCH)),) 
PROD_IOC +=  HVCAENx527
LIBRARY_IOC += HVCAENx527Support
endif
 
# <name>.dbd will be created from <name>Include.dbd
DBD += HVCAENx527.dbd

CAENHVWRAPPER=../CAENHVWrapper

USR_INCLUDES += -I$(CAENHVWRAPPER)/include

caenhvwrapper_DIR = $(CAENHVWRAPPER)/lib/win32
hscaenetlib_DIR = $(CAENHVWRAPPER)/lib/win32

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
HVCAENx527_SRCS_DEFAULT += HVCAENx527Main.cpp HVCAENx527_registerRecordDeviceDriver.cpp
HVCAENx527_SRCS_vxWorks += -nil-

HVCAENx527Support_SRCS += HVCAENx527.c
HVCAENx527Support_SRCS += HVCAENx527chAio.c HVCAENx527chBio.c HVCAENx527chLongio.c HVCAENx527chMBBio.c 
HVCAENx527Support_SRCS += HVCAENx527chStringio.c HVCAENx527Stringio.c HVCAENx527MBBi.c

HVCAENx527SimSupport_SRCS += $(HVCAENx527Support_SRCS)

CAENHVWrapperSim_SRCS += CAENHVWrapper_sim.cpp

HVCAENx527Sim_SRCS_DEFAULT += $(HVCAENx527_SRCS_DEFAULT)

#The following adds support from base/src/vxWorks
HVCAENx527_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

#add a definition for each support application used by this application
#HVCAENx527_LIBS += xxx
#HVCAENx527_LDFLAGS_Linux += -L$(EPICS_LOCAL)/lib/linux-x86 -lhscaenet -lcaenhvwrapper

#INCLUDES += -g -I$(EPICS_LOCAL)/include/CAENHVwrapper
# the following line does not work
#HVCAENx527_INCLUDES_linux-x86 += -I$(EPICS_LOCAL)/include/CAENHVwrapper
# nor
#HVCAENx527_INCLUDES += -I$(EPICS_LOCAL)/include/CAENHVwrapper

#NOTES:
#      1)It is not possible to build sncExample both as a component of HVCAENx527
#        and standalone. You must choose only one.
#      2)To build sncExample SNCSEQ must be defined in <top>/configure/RELEASE

#The following builds sncExample as a component of HVCAENx527
#HVCAENx527_SRCS += sncExample.stt
#HVCAENx527_LIBS += seq pv

CAENHVWrapperSim_LIBS += $(EPICS_BASE_IOC_LIBS)
CAENHVWrapperSim_SYS_LIBS_WIN32 += ws2_32

HVCAENx527Support_LIBS += $(EPICS_BASE_IOC_LIBS)
HVCAENx527Support_LIBS_WIN32 += caenhvwrapper # hscaenetlib 
HVCAENx527Support_SYS_LIBS_WIN32 += ws2_32

HVCAENx527SimSupport_LIBS += CAENHVWrapperSim $(EPICS_BASE_IOC_LIBS)
HVCAENx527SimSupport_SYS_LIBS_WIN32 += ws2_32

HVCAENx527_LIBS += HVCAENx527Support $(EPICS_BASE_IOC_LIBS)
HVCAENx527_LIBS_WIN32 += caenhvwrapper # hscaenetlib
HVCAENx527_SYS_LIBS_Linux += caenhvwrapper hscaenetlib

#Addition of a sequence for summary information
ifneq ($(SNCSEQ),)
    sncSummary_SNCFLAGS += +r
    HVCAENx527_DBD += sncSummary.dbd
	ifeq ($(findsting yes,$(SHARED_LIBRARIES)),)
		HVCAENx527Sim_SRCS += sncSummary.stt
		HVCAENx527Sim_LIBS += seq pv
	else
		HVCAENx527_SRCS += sncSummary.stt
	endif
	HVCAENx527_LIBS +=  seq pv


    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

HVCAENx527Sim_LIBS += HVCAENx527SimSupport CAENHVWrapperSim $(EPICS_BASE_IOC_LIBS)


#The following builds sncExample as a standalone application
#PROD_HOST += sncExample
#sncExample_SNCFLAGS += +m
#sncExample_SRCS += sncExample.stt
#sncExample_LIBS += seq pv
#sncExample_LIBS += $(EPICS_BASE_HOST_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

sncProgram$(OBJ) : sncSummary.stt
