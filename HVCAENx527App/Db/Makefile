TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
DB += PS1014001.db PS1014001ch.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

../O.Common/PS1014001.db: $(TOP)/templates/HVCAENx527.tpl $(TOP)/templates/PS1014001.sub
	msi -I $(TOP)/templates -M "PSNAME=PS1014001,CHADDR=0.00.000" $(TOP)/templates/HVCAENx527.tpl > ../O.Common/PS1014001.db

../O.Common/PS1014001ch.db: $(TOP)/templates/HVCAENx527ch.tpl $(TOP)/templates/HVCAENx527chItLk.tpl ../PS1014001ch.sub ../PS1014001chItLk.sub
	msi -I $(TOP)/templates -S ../PS1014001ch.sub > ../O.Common/PS1014001ch.db
	msi -I $(TOP)/templates -S ../PS1014001chItLk.sub >> ../O.Common/PS1014001ch.db
