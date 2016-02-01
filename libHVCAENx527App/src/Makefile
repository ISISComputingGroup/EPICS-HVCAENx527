TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
VERSION_STRING=-r $(VERSION).$(REVISION)
VERSION_NUM=$(shell sh ../../version.sh $(VERSION_STRING) -n )
VERSION_DOT=$(shell sh ../../version.sh $(VERSION_STRING) -d )

#=============================
#SHRLIB_LDFLAGS += -Wl,-soname=lib$(LIBRARY_DEFAULT).so.$(VERSION) -Wl,--no-undefined
SHRLIB_LDFLAGS += -Wl,--no-undefined

# Build libHVCAENx527 as a library for an IOC:
LIBRARY_DEFAULT += HVCAENx527
SHRLIB_VERSION = $(VERSION_DOT)

USR_CFLAGS += -DCAENHVWrapperVERSION=$(CAENHVWrapperVERSION)
USR_INCLUDES += -I$(CAENHVWRAPPER)/include

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

# Library Source files
HVCAENx527_SRCS += HVCAENx527.c
HVCAENx527_SRCS += HVCAENx527chAio.c HVCAENx527chBio.c HVCAENx527chLongio.c HVCAENx527chMBBio.c
HVCAENx527_SRCS += HVCAENx527chStringio.c
HVCAENx527_SRCS += HVCAENx527iocsh.c

# Install .dbd files
DBD += HVCAENx527Support.dbd

# Link with base and other libraries
HVCAENx527_LIBS += $(EPICS_BASE_IOC_LIBS)
HVCAENx527_LIBS_WIN32 += caenhvwrapper # hscaenetlib
HVCAENx527_SYS_LIBS_Linux += caenhvwrapper # hscaenetlib

LIBRARY_DEFAULT += CAENHVWrapperSim
CAENHVWrapperSim_SRCS += CAENHVWrapper_sim.cpp
CAENHVWrapperSim_LIBS += $(EPICS_BASE_IOC_LIBS)
CAENHVWrapperSim_SYS_LIBS_WIN32 += ws2_32

LIBRARY_DEFAULT += HVCAENx527Sim
HVCAENx527Sim_SRCS += $(HVCAENx527_SRCS)
HVCAENx527Sim_LIBS += CAENHVWrapperSim
HVCAENx527Sim_LIBS += $(EPICS_BASE_IOC_LIBS)

#NOTES:
#      1)It is not possible to build sncExample both as a component of libHVCAENx527
#        and standalone. You must choose only one.
#      2)To build sncExample SNCSEQ must be defined in <top>/configure/RELEASE

#The following builds sncExample as a component of libHVCAENx527
#HVCAENx527_SRCS += sncExample.stt
#HVCAENx527_LIBS += seq pv


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


