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
	$(MSI) -I. -I.. -o $(TOP)/db/$(1) -M "P=$(MYPVPREFIX)CAEN" $$<
endef

$(foreach f,$(MY_DB),$(eval $(call myinst_template,$(f))))


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

##HVCAENx527.tpl:

##HVCAENx527ch.tpl:

### Gee, I think I need to start using sub files
##../O.Common/PS1014001.db: ../HVCAENx527.tpl ../HVCAENx527ch.tpl ../HVCAENx527ch.sub ../HVCAENx527chItLk.tpl ##../HVCAENx527chItLk.sub
##	msi -I.. -M "PSNAME=PS1014001,CHADDR=0.00.000" HVCAENx527.tpl > ../O.Common/PS1014001.db
##	msi -I.. -S ../HVCAENx527ch.sub > ../O.Common/PS1014001ch.db
##	msi -I.. -S ../HVCAENx527chItLk.sub >> ../O.Common/PS1014001ch.db
##$(MSI) -M "P=$(MYPVPREFIX)CAEN:" -o $@ $<
