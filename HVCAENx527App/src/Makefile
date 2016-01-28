TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build an ioc application

PROD_IOC = HVCAENx527

USR_CFLAGS += -DCAENHVWrapperVERSION=$(CAENHVWrapperVERSION)
#USR_CFLAGS_Linux += -std=gnu99		# for RH7 compatibility only
#USR_LDFLAGS_Linux += -ldl		# for RH7 compatibility only

# <name>.dbd will be created from <name>Include.dbd
DBD += HVCAENx527.dbd

# Alternatively, include dbd files from all support applications:
#HVCAENx527_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#HVCAENx527_LIBS += xxx
HVCAENx527_LIBS += caenhvwrapper
HVCAENx527_LIBS += hscaenet
HVCAENx527_LIBS += HVCAENx527

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
HVCAENx527_SRCS += HVCAENx527_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
HVCAENx527_SRCS_DEFAULT += HVCAENx527Main.cpp
HVCAENx527_SRCS_vxWorks += -nil-

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
HVCAENx527_LIBS += $(EPICS_BASE_IOC_LIBS)

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

