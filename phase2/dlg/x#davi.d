BEGIN X#DAVI

IF ~Global("X#XanQuest1","GLOBAL",1)~ THEN BEGIN DavidIntro
SAY @0
IF ~~ THEN EXTERN ~X#CHOP~ CHOP1
END

IF ~~ THEN BEGIN DAVI1
SAY @1
= @2
IF ~~ THEN EXTERN ~X#CHOP~ CHOP1.1
END

IF ~~ THEN BEGIN DAVI2
SAY @3
= @4
= @5
IF ~~ THEN DO ~EscapeArea() ReputationInc(1) AddexperienceParty(200)~ EXTERN ~X#CHOP~ CHOP4
END

IF ~~ THEN BEGIN DAVI3
SAY @6
= @7
IF ~~ THEN DO ~EscapeArea()~ EXTERN ~X#CHOP~ CHOP4
END

IF ~~ THEN BEGIN DAVIXAN3
SAY @8
IF ~~ THEN REPLY @9 EXTERN ~X#CHOP~ CHOPXAN5
IF ~~ THEN REPLY @10 GOTO DAVI3
IF ~~ THEN REPLY @11 EXTERN ~X#CHOP~ CHOP3
IF ~Race(Player1,HALFORC)~ THEN REPLY @12 EXTERN ~X#CHOP~ CHOP2ORC
IF ~!Race(Player1,HALFORC)~ THEN REPLY @12 EXTERN ~X#CHOP~ CHOP2NORC
END

IF ~Global("X#XanQuest1","GLOBAL",7)~ THEN BEGIN DAVINOXAN6
SAY @13
IF ~~ THEN DO ~TakePartyItem("P#BAG01")TakePartyItem("P#BAG02")~ EXTERN ~X#CHOP~ CHOPXAN6
END

IF ~Global("X#XanQuest1","GLOBAL",8) OR(3) !InParty("xan") !InMyArea("xan") StateCheck("xan",CD_STATE_NOTVALID)~ THEN BEGIN DAVINOXAN
SAY @14
IF ~~ THEN DO ~EscapeArea() ReputationInc(1) AddexperienceParty(200)~ EXTERN ~X#CHOP~ CHOP4
END

IF ~Global("X#XanQuest1","GLOBAL",8) InParty("xan") InMyArea("xan") !StateCheck("xan",CD_STATE_NOTVALID)~ THEN BEGIN DAVIXANTrick
SAY @15
IF ~~ THEN EXTERN ~%XAN_JOINED%~ TrickChain
END

IF ~Global("X#XanQuest1","GLOBAL",11)~ THEN BEGIN DAVI5.1
SAY @16
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~Global("X#XanQuest1","GLOBAL",11)~ THEN BEGIN DAVI5.2
SAY @17
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

