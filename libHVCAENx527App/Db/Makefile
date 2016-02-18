TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
VERSION_STRING=-r $(VERSION).$(REVISION)
VERSION_NUM=$(shell sh ../../version.sh $(VERSION_STRING) -n )
VERSION_DOT=$(shell sh ../../version.sh $(VERSION_STRING) -d )

#----------------------------------------------------
# List of Library Templates
TEMPLATES += HVCAENx527.tpl HVCAENx527ch.tpl HVCAENx527chItLk.tpl
TEMPLATES += HVCAENx527chItLk.sub HVCAENx527ch.sub

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

