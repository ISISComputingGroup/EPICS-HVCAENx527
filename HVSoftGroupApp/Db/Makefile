TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
VERSION_STRING=-r $(VERSION).$(REVISION)
VERSION_NUM=$(shell sh ../../version.sh $(VERSION_STRING) -n )
VERSION_DOT=$(shell sh ../../version.sh $(VERSION_STRING) -d )

#----------------------------------------------------
# List of Library Templates
TEMPLATES += HVSoftGroup.template
TEMPLATES += HVSoftGroupCh.template
TEMPLATES += HVSoftGroupRamp.template
TEMPLATES += HVSoftGroupChRamp.template

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

