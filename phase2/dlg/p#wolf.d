BEGIN ~P#WOLF~

APPEND ~P#WOLF~

IF ~Global("P#EMMAFight","GLOBAL",0) InParty("kivan")~ THEN BEGIN WOLF_ANGRY
SAY @0
IF ~~ THEN EXIT
END

IF ~Global("P#EMMAFight","GLOBAL",0) !InParty("kivan")~ THEN BEGIN WOLF_CAREFREE
SAY @1
IF ~~ THEN EXIT
END

IF ~GlobalGT("P#EMMAFight","GLOBAL",0) Dead("kivan")~ THEN BEGIN WOLF_GLAD
SAY @2
IF ~~ THEN EXIT
END

END
