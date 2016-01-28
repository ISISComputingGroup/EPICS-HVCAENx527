TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
VERSION_STRING=-r $(VERSION).$(REVISION)
VERSION_NUM=$(shell sh ../../version.sh $(VERSION_STRING) -n )
VERSION_DOT=$(shell sh ../../version.sh $(VERSION_STRING) -d )

#----------------------------------------
# List of edl files
OPI_FILES += HVCAENx527.edl HVCAENx527config.edl HVCAENx527simple.edl
OPI_FILES += runCAENHV.example

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

