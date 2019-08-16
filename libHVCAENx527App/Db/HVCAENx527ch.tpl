#
# Copyright Canadian Light Source, Inc.  All rights reserved.
#    - see licence.txt and licence_CAEN.txt for limitations on use.
#

#
# define ai before ao as the ao init record reads a default value
# and this will fail if "epics_enabled" is not set, which is done
# by the ai init
#

#
# The following are for monitoring channel parameters (e.g. feedback)
# in user space
#
record( stringin, "$(PSNAME):$(CHANNUM):name:fbk")
{
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) ChName")
	field( SCAN, "Event")
	field( PINI, "1")
	field( VAL, "$(PSNAME):$(CHANNUM)")
}
record( ai, "$(PSNAME):$(CHANNUM):v0set:fbk")
{
	field( DESC, "Primary voltage setting")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) V0Set")
	field( SCAN, "Event")
	field( PREC, "2")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):v0set:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
}
record( ai, "$(PSNAME):$(CHANNUM):v1set:fbk")
{
	field( DESC, "Secondary voltage setting")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) V1Set")
	field( SCAN, "Event")
	field( PREC, "2")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):v1set:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
}
record( ai, "$(PSNAME):$(CHANNUM):i0set:fbk")
{
	field( DESC, "Primary current limit")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) I0Set")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):i0set:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "A")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
}
record( ai, "$(PSNAME):$(CHANNUM):i1set:fbk")
{
	field( DESC, "Secondary current limit")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) I1Set")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):i1set:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "A")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
}
record( ai, "$(PSNAME):$(CHANNUM):rampup:fbk")
{
	field( DESC, "Voltage ramp-up rate")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) RUp")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):rampup:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V/s")
}
record( ai, "$(PSNAME):$(CHANNUM):rampdn:fbk")
{
	field( DESC, "Voltage ramp-down rate")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) RDWn")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):rampdn:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V/s")
}
record( ai, "$(PSNAME):$(CHANNUM):trip:fbk")
{
	field( DESC, "Trip timeout")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) Trip")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):trip:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "s")
}
record( ai, "$(PSNAME):$(CHANNUM):svmax:fbk")
{
	field( DESC, "Software voltage limit")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) SVMax")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):svmax:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
}
record( ai, "$(PSNAME):$(CHANNUM):vmon")
{
	field( DESC, "Measured voltage")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) VMon")
	field( SCAN, "Event")
	field( PREC, "2")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):vmon")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
}
record( ai, "$(PSNAME):$(CHANNUM):imon")
{
	field( DESC, "Measured current")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) IMon")
	field( SCAN, "Event")
	field( HIGH, "90")
	field( HIHI, "100")
	field( HSV, "MINOR")
	field( HHSV, "MAJOR")
	field( PREC, "2")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):imon")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "A")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
}

# The following are for setting channel parameters
# in user space
#
record( stringout, "$(PSNAME):$(CHANNUM):name")
{
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) ChName")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):name")
	field(SDIS, "$(PSNAME):DISABLE")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):v0set")
{
	field( DESC, "Primary voltage setting")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) V0Set")
	field( PREC, "2")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):v0set")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
    info(INTEREST, "HIGH")
    info(archive, "VAL")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):v1set")
{
	field( DESC, "Secondary voltage setting")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) V1Set")
	field( PREC, "2")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):v1set")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):i0set")
{
	field( DESC, "Primary current limit")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) I0Set")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):i0set")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "A")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):i1set")
{
	field( DESC, "Secondary current limit")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) I1Set")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):i1set")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "A")
    info(archive, "VAL")
    info(INTEREST, "HIGH")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):rampup")
{
	field( DESC, "Voltage ramp-up rate")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) RUp")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):rampup")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V/s")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):rampdn")
{
	field( DESC, "Voltage ramp-down rate")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) RDWn")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):rampdn")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V/s")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):trip")
{
	field( DESC, "Trip timeout")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) Trip")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):trip")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "s")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):svmax")
{
	field( DESC, "Software voltage limit")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) SVMax")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):svmax")
	field(SDIS, "$(PSNAME):DISABLE")
	field(EGU, "V")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):$(CHANNUM):pwonoff")
{
	field( DESC, "Power on/off")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) Pw")
	field( ZNAM, "Off")
	field( ONAM, "On")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):pwonoff")
	field(SDIS, "$(PSNAME):DISABLE")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):$(CHANNUM):pwupmode")
{
	field( DESC, "Power-up mode")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) POn")
	field( ZNAM, "Disable")
	field( ONAM, "Enable")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):pwupmode")
	field(SDIS, "$(PSNAME):DISABLE")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):$(CHANNUM):pwdnmode")
{
	field( DESC, "Power-down mode")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) PDwn")
	field( ZNAM, "KILL")
	field( ONAM, "Ramp")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):pwdnmode")
	field(SDIS, "$(PSNAME):DISABLE")
	field(ASG, "$(ASG=DEFAULT)")
}
record( longout, "$(PSNAME):$(CHANNUM):tripint")
{
	field( DESC, "Internal trip connections")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) TripInt")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):tripint")
	field(SDIS, "$(PSNAME):DISABLE")
	field(ASG, "$(ASG=DEFAULT)")
}
record( longout, "$(PSNAME):$(CHANNUM):tripext")
{
	field( DESC, "External trip connections")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( OUT, "@$(CHADDR) TripExt")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):tripext")
	field(SDIS, "$(PSNAME):DISABLE")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):imon:warn")
{
	field( DTYP, "Raw Soft Channel")
	field( OMSL, "closed_loop")
	field( DOL, "$(PSNAME):$(CHANNUM):i0set:fbk CP")
	field( LINR, "LINEAR")
	field( ASLO, "0.90")
	field( PREC, "2")
	field( EGU, "uA")
	field( OUT, "$(PSNAME):$(CHANNUM):imon.HIGH PP")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):imon:alarm")
{
	field( DTYP, "Raw Soft Channel")
	field( OMSL, "closed_loop")
	field( DOL, "$(PSNAME):$(CHANNUM):i0set:fbk CP")
	field( LINR, "LINEAR")
	field( ASLO, "1")
	field( PREC, "2")
	field( EGU, "uA")
	field( OUT, "$(PSNAME):$(CHANNUM):imon.HIHI PP")
	field(ASG, "$(ASG=DEFAULT)")
}
record( mbbi, "$(PSNAME):$(CHANNUM):status")
{
	field( DESC, "Status")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) Status")
	field( SCAN, "Event")
	field( ZRVL, "0")	field( ZRST, "Off")
	field( ONVL, "1")	field( ONST, "On")
	field( TWVL, "2")	field( TWST, "Ramping Up")
	field( THVL, "3")	field( THST, "Ramping Down")
	field( FRVL, "4")	field( FRST, "Over-Current")
	field( FVVL, "5")	field( FVST, "Over-Voltage")
	field( SXVL, "6")	field( SXST, "Under-Voltage")
	field( SVVL, "7")	field( SVST, "External Trip")
	field( EIVL, "8")	field( EIST, "Max V")
	field( NIVL, "9")	field( NIST, "Ext. Disable")
	field( TEVL, "10")	field( TEST, "Internal Trip")
	field( ELVL, "11")	field( ELST, "Calib. Error")
	field( TVVL, "12")	field( TVST, "Unplugged")
	field( ZRSV, "NO_ALARM")
	field( ONSV, "$(ALARM_WHEN_ON=NO_ALARM)")
	field( TWSV, "$(ALARM_WHEN_RAMPING=NO_ALARM)")
	field( THSV, "$(ALARM_WHEN_RAMPING=NO_ALARM)")
	field( FRSV, "MAJOR")
	field( FVSV, "MAJOR")
	field( SXSV, "MAJOR")
	field( SVSV, "MAJOR")
	field( EISV, "MAJOR")
	field( NISV, "MAJOR")
	field( TESV, "MAJOR")
	field( ELSV, "MAJOR")
	field( TVSV, "MAJOR")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):status")
	field(SDIS, "$(PSNAME):DISABLE")
    info(INTEREST, "HIGH")
}
record( bi, "$(PSNAME):$(CHANNUM):pwonoff:fbk")
{
	field( DESC, "Power on/off")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) Pw")
	field( SCAN, "Event")
	field( ZNAM, "Off")
	field( ONAM, "On")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):pwonoff:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
}
record( bi, "$(PSNAME):$(CHANNUM):pwupmode:fbk")
{
	field( DESC, "Power-up mode")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) POn")
	field( SCAN, "Event")
	field( ZNAM, "Disabled")
	field( ONAM, "Enabled")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):pwupmode:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
}
record( bi, "$(PSNAME):$(CHANNUM):pwdnmode:fbk")
{
	field( DESC, "Power-down mode")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) PDwn")
	field( SCAN, "Event")
	field( ZNAM, "KILL")
	field( ONAM, "Ramp")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):pwdnmode:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
}
record( longin, "$(PSNAME):$(CHANNUM):tripint:fbk")
{
	field( DESC, "Internal trip connections")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) TripInt")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):tripint:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
}
record( longin, "$(PSNAME):$(CHANNUM):tripext:fbk")
{
	field( DESC, "External trip connections")
	field( DTYP, "CAEN x527 generic HV Channel")
	field( INP, "@$(CHADDR) TripExt")
	field( SCAN, "Event")
	field(SIML, "$(PSNAME):SIM")
	field(SIOL, "$(PSNAME):SIM:$(CHANNUM):tripext:fbk")
	field(SDIS, "$(PSNAME):DISABLE")
}
#
# The following are for higher level operations on channel parameters
#
# RU! at initialization, the calc record sends a zero to the v0set
# Initialize all setpoints to the crate values to fix this

## ISIS: comment out PINI in next two records as do not want to change voltage on startup
record( bo, "$(PSNAME):$(CHANNUM):v0set:up")
{
	field( OUT, "$(PSNAME):$(CHANNUM):v0set:calc PP")
#	field( PINI, "1")
	field( VAL, "0")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):$(CHANNUM):v0set:dn")
{
	field( OUT, "$(PSNAME):$(CHANNUM):v0set:calc PP")
#	field( PINI, "1")
	field( VAL, "0")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):$(CHANNUM):v0set:deltav")
{
	field( PINI, "1")
	field( VAL, "5")
	field( PREC, "2")
	field( EGU, "V")
	field(ASG, "$(ASG=DEFAULT)")
}
#record( calc, "$(PSNAME):$(CHANNUM):v0set:calc")
#{
#	field( INPA, "$(PSNAME):$(CHANNUM):v0set")
#	field( INPB, "$(PSNAME):$(CHANNUM):v0set:up")
#	field( INPC, "$(PSNAME):$(CHANNUM):v0set:dn")
#	field( INPD, "$(PSNAME):$(CHANNUM):v0set:deltav")
#	field( CALC, "A+D*(B-C)")
#	field( FLNK, "$(PSNAME):$(CHANNUM):v0set:fwd")
#}
#record( ao, "$(PSNAME):$(CHANNUM):v0set:fwd")
#{
#	field( OMSL, "closed_loop")
#	field( DOL, "$(PSNAME):$(CHANNUM):v0set:calc")
#	field( OUT, "$(PSNAME):$(CHANNUM):v0set PP")
#}
record( calcout, "$(PSNAME):$(CHANNUM):v0set:calc")
{
	#field( OOPT, "On Change")
	field( INPA, "$(PSNAME):$(CHANNUM):v0set")
	field( INPB, "$(PSNAME):$(CHANNUM):v0set:up")
	field( INPC, "$(PSNAME):$(CHANNUM):v0set:dn")
	field( INPD, "$(PSNAME):$(CHANNUM):v0set:deltav")
	field( CALC, "A+D*(B-C)")
	field( OUT, "$(PSNAME):$(CHANNUM):v0set PP")
	field( PREC, "2")
	field(ASG, "$(ASG=DEFAULT)")
}

record( stringout, "$(PSNAME):SIM:$(CHANNUM):name")
{
	field( DESC, "Simulated Channel Name Output")
	field( PINI, "1")
	field( VAL, "$(PSNAME):$(SLOT):$(CHANNUM)")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):v0set")
{
	field( DESC, "Simulated Primary voltage setting")
	field(EGU, "V")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):v1set")
{
	field( DESC, "Simulated Secondary voltage setting")
	field(EGU, "V")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):i0set")
{
	field( DESC, "Simulated Primary current limit")
	field(EGU, "A")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):i1set")
{
	field( DESC, "Simulated Secondary current limit")
	field(EGU, "A")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):rampup")
{
	field( DESC, "Simulated Voltage ramp-up rate")
	field(EGU, "V/s")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):rampdn")
{
	field( DESC, "Simulated Voltage ramp-down rate")
	field(EGU, "V/s")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):trip")
{
	field( DESC, "Simulated Trip timeout")
	field(EGU, "s")
	field(ASG, "$(ASG=DEFAULT)")
}
record( ao, "$(PSNAME):SIM:$(CHANNUM):svmax")
{
	field( DESC, "Simulated Software voltage limit")
	field(EGU, "V")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):SIM:$(CHANNUM):pwonoff")
{
	field( DESC, "Simulated Power on/off")
	field( ZNAM, "Off")
	field( ONAM, "On")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):SIM:$(CHANNUM):pwupmode")
{
	field( DESC, "Simulated Power-up mode")
	field( ZNAM, "Disable")
	field( ONAM, "Enable")
	field(ASG, "$(ASG=DEFAULT)")
}
record( bo, "$(PSNAME):SIM:$(CHANNUM):pwdnmode")
{
	field( DESC, "Simulated Power-down mode")
	field( ZNAM, "KILL")
	field( ONAM, "Ramp")
	field(ASG, "$(ASG=DEFAULT)")
}
record( longout, "$(PSNAME):SIM:$(CHANNUM):tripint")
{
	field( DESC, "Simulated Internal trip connections")
	field(ASG, "$(ASG=DEFAULT)")
}
record( longout, "$(PSNAME):SIM:$(CHANNUM):tripext")
{
	field( DESC, "Simulated External trip connections")
	field(ASG, "$(ASG=DEFAULT)")
}
record( mbbi, "$(PSNAME):SIM:$(CHANNUM):status")
{
	field( DESC, "Simulated Status")
	field( VAL, "0")
	field( ZRVL, "0")	field( ZRST, "Off")
	field( ONVL, "1")	field( ONST, "On")
	field( TWVL, "2")	field( TWST, "Ramping Up")
	field( THVL, "3")	field( THST, "Ramping Down")
	field( FRVL, "4")	field( FRST, "Over-Current")
	field( FVVL, "5")	field( FVST, "Over-Voltage")
	field( SXVL, "6")	field( SXST, "Under-Voltage")
	field( SVVL, "7")	field( SVST, "External Trip")
	field( EIVL, "8")	field( EIST, "Max V")
	field( NIVL, "9")	field( NIST, "Ext. Disable")
	field( TEVL, "10")	field( TEST, "Internal Trip")
	field( ELVL, "11")	field( ELST, "Calib. Error")
	field( TVVL, "12")	field( TVST, "Unplugged")
}

record(bo, "$(PSNAME):SIM") 
{
    field(SCAN, "Passive")
    field(DTYP, "Soft Channel")
    field(ZNAM, "NO")
    field(ONAM, "YES")
	field(ASG, "$(ASG=DEFAULT)")
}

record(bo, "$(PSNAME):DISABLE") 
{
  field(DESC, "Disable comms")
  field(PINI, "YES")
  field(VAL, "0")
  field(OMSL, "supervisory")
  field(ZNAM, "Comms Enabled")
  field(ONAM, "Comms Disabled")
	field(ASG, "$(ASG=DEFAULT)")
}

alias("$(PSNAME):SIM:$(CHANNUM):name","$(PSNAME):SIM:$(CHANNUM):name:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):v0set","$(PSNAME):SIM:$(CHANNUM):vmon")
alias("$(PSNAME):SIM:$(CHANNUM):v0set","$(PSNAME):SIM:$(CHANNUM):v0set:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):v1set","$(PSNAME):SIM:$(CHANNUM):v1set:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):i0set","$(PSNAME):SIM:$(CHANNUM):imon")
alias("$(PSNAME):SIM:$(CHANNUM):i0set","$(PSNAME):SIM:$(CHANNUM):i0set:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):i1set","$(PSNAME):SIM:$(CHANNUM):i1set:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):rampup","$(PSNAME):SIM:$(CHANNUM):rampup:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):rampdn","$(PSNAME):SIM:$(CHANNUM):rampdn:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):trip","$(PSNAME):SIM:$(CHANNUM):trip:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):svmax","$(PSNAME):SIM:$(CHANNUM):svmax:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):pwonoff","$(PSNAME):SIM:$(CHANNUM):pwonoff:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):pwupmode","$(PSNAME):SIM:$(CHANNUM):pwupmode:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):pwdnmode","$(PSNAME):SIM:$(CHANNUM):pwdnmode:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):tripint","$(PSNAME):SIM:$(CHANNUM):tripint:fbk")
alias("$(PSNAME):SIM:$(CHANNUM):tripext","$(PSNAME):SIM:$(CHANNUM):tripext:fbk")

