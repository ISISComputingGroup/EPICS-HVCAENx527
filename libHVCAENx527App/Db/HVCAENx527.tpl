#
# Copyright Canadian Light Source, Inc.  All rights reserved.
#    - see licence.txt and licence_CAEN.txt for limitations on use.
#
# scan crate
#
# reactivate "poll" if the channels scan is put back into device support
# (from driver support)
#record( sub, "$(PSNAME):poll")
#{
#	field( DESC, "Base poll period")
#	field( SCAN, ".2 second")
#	field( INAM, "InitScanChannels")
#	field( SNAM, "ScanChannels")
#}
record( ao, "$(PSNAME):scanPeriod")
{
	field( DESC, "Base scan period")
#	field( DTYP, "CAEN x527 HV Crate")
#	field( OUT, "@$(CHADDR) scanPeriod")
	field( VAL, "0.2")
	field( PINI, "1")
}
record( ai, "$(PSNAME):connected")
{
	field( DESC, "Crate connection status")
#	field( DTYP, "CAEN x527 HV Crate")
#	field( INP, "@$(CHADDR) connected")
#	field( SCAN, "10 second")
}
#record( ao, "$(PSNAME):v0set")
#{
#	field( DESC, "V setting, all Ch.")
#}
#record( ao, "$(PSNAME):i0set")
#{
#	field( DESC, "I setting, all Ch.")
#}
#record( ao, "$(PSNAME):rampup")
#{
#	field( DESC, "ramp-up rate, all Ch.")
#}
#record( ao, "$(PSNAME):rampdn")
#{
#	field( DESC, "ramp-down rate, all Ch.")
#}
#record( ao, "$(PSNAME):svmax")
#{
#	field( DESC, "soft V limit, all Ch.")
#}
record( bo, "$(PSNAME):pwonoff")
{
        field( DESC, "Power on/off, all Ch.")
}
