BEGIN X#CRU11

IF ~Global("X#XanQuest1","GLOBAL",1)~ THEN BEGIN CRUIntro
SAY @0
IF ~InParty("xan") InMyArea("xan") !StateCheck("xan",CD_STATE_NOTVALID)~ THEN EXTERN ~X#CHOP~ CHOPXAN1
IF ~OR(3) !InParty("xan") !InMyArea("xan") StateCheck("xan",CD_STATE_NOTVALID)~ THEN EXTERN ~X#DAVI~ DAVI1
END

IF ~~ THEN BEGIN CRU1
SAY @0
IF ~InParty("xan") InMyArea("xan") !StateCheck("xan",CD_STATE_NOTVALID)~ THEN EXTERN ~X#CHOP~ CHOPXAN1
IF ~OR(3) !InParty("xan") !InMyArea("xan") StateCheck("xan",CD_STATE_NOTVALID)~ THEN EXTERN ~X#DAVI~ DAVI1
END

IF ~~ THEN BEGIN CRU2
SAY @1
IF ~Race(Player1,HALFORC)~ THEN REPLY @2 EXTERN ~X#CHOP~ CHOP2ORC
IF ~!Race(Player1,HALFORC)~ THEN REPLY @2 EXTERN ~X#CHOP~ CHOP2NORC
IF ~~ THEN REPLY @3 EXTERN ~X#DAVI~ DAVI2
IF ~~ THEN REPLY @4 EXTERN ~X#CHOP~ CHOP3
IF ~~ THEN REPLY @5 EXTERN ~X#DAVI~ DAVI3
END

IF ~~ THEN BEGIN CRUXAN1
SAY @6
IF ~~ THEN DO ~SetGlobal("X#XanQuest1","GLOBAL",8) EscapeArea() ActionOverride("X#CHOP", EscapeArea()) ReputationInc(1) AddexperienceParty(200)~
EXIT
END


