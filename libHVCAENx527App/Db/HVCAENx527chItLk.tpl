#
# Copyright Canadian Light Source, Inc.  All rights reserved.
#    - see licence.txt and licence_CAEN.txt for limitations on use.
#
# Interlock Records for channel $(CHANNUM) of a
# CAEN HVx527 HV controller
#
record( ai, "$(PSNAME):$(CHANNUM):ilock:in")
{
	field( INP, "$(INPPV) CPP")
	field( FLNK, "$(PSNAME):$(CHANNUM):ilock:test")
}
record( mbbo, "$(PSNAME):$(CHANNUM):ilock:cond")
{
	field( VAL, "$(COND)")
	field( ZRVL, "0")	field( ZRST, ">")
	field( ONVL, "1")	field( ONST, "=")
	field( TWVL, "2")	field( TWST, "<")
	field( THVL, "3")	field( THST, "!=")
	field( PINI, "1")
}
record( ao, "$(PSNAME):$(CHANNUM):ilock:thresh")
{
	field( VAL, "$(THRESH)")
	field( PINI, "1")
}
# The calc record only determines if conditions have been met.
# The fanout actually determines if a signal should be sent.
record( calc, "$(PSNAME):$(CHANNUM):ilock:test")
{
	field( INPA, "$(PSNAME):$(CHANNUM):ilock:in")
	field( INPB, "$(PSNAME):$(CHANNUM):ilock:thresh")
	field( INPJ, "$(PSNAME):$(CHANNUM):ilock:cond")
	field( CALC, "J=1&&A=B||J=2&&A<B||J=0&&A>B||J=3&&A#B")
	field( FLNK, "$(PSNAME):$(CHANNUM):ilock:act")
}
record( seq, "$(PSNAME):$(CHANNUM):ilock:act")
{
	field( SELL, "$(PSNAME):$(CHANNUM):ilock:test")
	field( SELM, "Specified")
	field( DOL1, "$(OUTVAL)")
	field( LNK1, "$(PSNAME):$(CHANNUM):pwonoff PP")
}
