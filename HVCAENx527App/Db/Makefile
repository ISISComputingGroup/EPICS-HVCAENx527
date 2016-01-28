TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#"P=CAEN" "HVCAENx527.db"

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
#DB += HVCAENx527ch.db
#DB += HVCAENx527chItLk.db
#DB += HVCAENx527cr.db
#DB += HVCAENx527.db

TARGETS += ExpDb

.PHONY: ExpDb MkDbDir

MY_DB = HVCAENx527.db HVCAENx527ch.db HVCAENx527chItLk.db HVCAENx527cr.db

ExpDb : MkDbDir $(addsuffix _p,$(MY_DB))

MkDbDir :
	$(if $(wildcard $(TOP)/db),,$(MKDIR) $(TOP)/db)

define myinst_template
.PHONY: $(1)_p
$(1)_p : $(1)
	$(RM) $(TOP)/db/$(1)
	$(MSI) -I. -I.. -o $(TOP)/db/$(1) -M "P=$$$$\(P\)CAEN" $$<
endef

$(foreach f,$(MY_DB),$(eval $(call myinst_template,$(f))))


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
