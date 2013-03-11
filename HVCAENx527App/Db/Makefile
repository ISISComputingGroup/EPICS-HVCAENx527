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

HVCAENx527.tpl:

HVCAENx527ch.tpl:

# Gee, I think I need to start using sub files
../O.Common/PS1014001.db: ../HVCAENx527.tpl ../HVCAENx527ch.tpl ../HVCAENx527ch.sub ../HVCAENx527chItLk.tpl ../HVCAENx527chItLk.sub
	cd ..; msi -M "PSNAME=PS1014001,CHADDR=0.00.000" HVCAENx527.tpl > O.Common/PS1014001.db
	cd ..; msi -S HVCAENx527ch.sub > O.Common/PS1014001ch.db
	cd ..; msi -S HVCAENx527chItLk.sub >> O.Common/PS1014001ch.db
