TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# build an ioc application

ifneq ($(findstring win32-x86,$(EPICS_HOST_ARCH)),) 
FILE_TYPE += pdb
INSTALL_pdb = $(INSTALL_BIN)
USR_CXXFLAGS += /Zi
USR_CFLAGS += /Zi
USR_LDFLAGS += /DEBUG
pdb += HVCAENx527Support.pdb HVCAENx527.pdb
else
USR_LDFLAGS += -L$(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH) -lhscaenetlib -lcaenhvwrapper
endif

BIN_INSTALLS_Linux += $(wildcard $(CAENHVWRAPPER)/lib/$(EPICS_HOST_ARCH)/*.so.*)
BIN_INSTALLS_WIN32 += $(wildcard $(CAENHVWRAPPER)/dll/win32/*.dll)

LIBRARY_IOC = HVCAENx527Support

PROD_IOC = HVCAENx527
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
HVCAENx527Support_SRCS += HVCAENx527chStringio.c

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

HVCAENx527Support_LIBS += $(EPICS_BASE_IOC_LIBS)
HVCAENx527Support_LIBS_WIN32 += hscaenetlib caenhvwrapper
HVCAENx527Support_SYS_LIBS_WIN32 += ws2_32

HVCAENx527_LIBS += HVCAENx527Support $(EPICS_BASE_IOC_LIBS)
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

