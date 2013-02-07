/* Replacement Kagain's Quest */
/* cleaning out old quest */
REPLACE_STATE_TRIGGER ~%KAGAIN_JOINED%~ 0 ~False()~

ADD_TRANS_ACTION ~%tutu_var%KAGAIN~ BEGIN 0 END BEGIN END ~SetGlobal("KagainCaravan","GLOBAL",20)~

ADD_TRANS_ACTION  ~%tutu_var%KAGAIN~ BEGIN 7 END BEGIN END ~SetGlobal("KagainCaravan","GLOBAL",20) SetGlobal("X#KagainCaravan","GLOBAL",1)~

/* making sure the quest can't happen if Eddard is already dead */
EXTEND_BOTTOM ~%tutu_var%KAGAIN~ 2
IF ~Global("X#CaravanBanditEncounter","GLOBAL",2)~ THEN REPLY @0 GOTO X#KagQuestDerail1
END

EXTEND_BOTTOM ~%tutu_var%KAGAIN~ 7
IF ~Global("X#CaravanBanditEncounter","GLOBAL",2)~ THEN GOTO X#KagQuestDerail2
END

BEGIN ~X#KABAND~

CHAIN IF WEIGHT #-2 ~%BGT_VAR% Global("X#CaravanBanditEncounter","GLOBAL",1)~ THEN ~X#KABAND~ X#KABANDstart
@1
== ~%KAGAIN_JOINED%~ IF ~InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN @2
== ~%KIVAN_JOINED%~ IF ~InParty("kivan") InMyArea("kivan") !StateCheck("kivan",CD_STATE_NOTVALID)~ THEN @3
== ~%JAHEIRA_JOINED%~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4
== ~%SHARTEEL_JOINED%~ IF ~InParty("sharteel") InMyArea("sharteel") !StateCheck("sharteel",CD_STATE_NOTVALID)~ THEN @5
== ~X#KABAND~ @6
DO ~SetGlobal("X#CaravanBanditEncounter","GLOBAL",2)
SetGlobal("X#KagainCaravan","GLOBAL",3)
ActionOverride("X#BANDK1",ChangeEnemyAlly("X#BANDK1",ENEMY))
ActionOverride("X#BANDK2",ChangeEnemyAlly("X#BANDK2",ENEMY))
ActionOverride("X#BANDK3",ChangeEnemyAlly("X#BANDK3",ENEMY))
Enemy()~ EXIT

EXTEND_BOTTOM ~%tutu_var%BRILLA~ 0
IF ~OR(2) Global("X#KagainCaravan","GLOBAL",5) PartyHasItem("X#SILSH")~ THEN REPLY @7 GOTO X#BrillaEddardDeath
END

CHAIN ~%tutu_var%BRILLA~ X#BrillaEddardDeath
@8
== ~%SKIE_BANTER%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @9
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @10
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @11
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @12
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @13
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @14
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @15
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @16
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @17
= @18
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID) InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN @19
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @20
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID) InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN @21
== ~%ELDOTH_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID) InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN @22
== ~%tutu_var%BRILLA~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID) InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN @23
END
IF ~~ THEN DO ~SetGlobal("X#KagainCaravan","GLOBAL",6) TakePartyItem("X#SILSH") DestroyItem("X#SILSH") AddexperienceParty(3000) ActionOverride("brilla",EscapeArea())~ EXIT


APPEND ~%tutu_var%KAGAIN~

IF ~~ THEN BEGIN X#KagQuestDerail1
SAY @24
++ @25 GOTO X#KagBandResolvAlone
++ @26 GOTO X#KagBandResolvAlone
++ @27 GOTO X#KagBandResolvAlone
END

IF ~~ THEN BEGIN X#KagQuestDerail2
SAY @28
++ @29 GOTO X#KagBandResolvAlone
++ @26 GOTO X#KagBandResolvAlone
++ @30 GOTO X#KagBandResolvAlone
END

IF ~~ THEN BEGIN X#KagBandResolvAlone
SAY @31
IF ~~ THEN REPLY @32 DO ~EraseJournalEntry(@35) EraseJournalEntry(@44) SetGlobal("X#KagainCaravan","GLOBAL",5)~ JOURNAL @33  GOTO X#KAQUDISMISS
IF ~~ THEN REPLY @34 DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) SetGlobal("X#KagainCaravan","GLOBAL",5)~ JOURNAL @35  GOTO X#KAQUREWARDALONE
END

IF ~~ THEN BEGIN X#KAQUREWARDALONE
SAY @36
IF ~~ THEN DO ~GiveGoldForce(50) SetGlobal("X#KagainCaravan","GLOBAL",5) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN X#KAQUDISMISS
SAY @37
IF ~~ THEN DO ~SetGlobal("X#KagainCaravan","GLOBAL",5) EscapeArea()~ EXIT
END

END

APPEND ~%KAGAIN_JOINED%~

/* Kagain Quest */
IF WEIGHT #-2 ~%BGT_VAR% Global("X#KagainCaravan","GLOBAL",2)~ THEN BEGIN X#KagainQuestMoveAlong
SAY @38
= @39
IF ~~ THEN DO ~SetGlobal("X#KagainCaravan","GLOBAL",3)~ EXIT
END

IF WEIGHT #-2 ~%BGT_VAR% Global("X#KagainCaravan","GLOBAL",4)~ THEN BEGIN X#KagainQuestResolved
SAY @40
IF ~~ THEN REPLY @41 DO ~SetGlobal("X#KagainCaravan","GLOBAL",5)~ GOTO X#KAQUDISMISSParty
IF ~~ THEN REPLY @42 DO ~SetGlobal("X#KagainCaravan","GLOBAL",5)~ GOTO X#KAQUREWARDParty
END

IF ~~ THEN BEGIN X#KAQUDISMISSParty
SAY @43
IF ~~ THEN DO ~LeaveParty() ChangeAIScript("",DEFAULT) SetGlobal("%KICKED_OUT%","LOCALS",1) SetLeavePartyDialogFile() EraseJournalEntry(@33) EraseJournalEntry(@35)~ JOURNAL @44 EXIT
END

IF ~~ THEN BEGIN X#KAQUREWARDParty
  SAY @45
  IF ~NumInParty(6)~ THEN DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) GiveGoldForce(75) JoinParty()~ JOURNAL @35 EXIT
  IF ~NumInParty(5)~ THEN DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) GiveGoldForce(60) JoinParty()~ JOURNAL @35 EXIT
  IF ~NumInParty(4)~ THEN DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) GiveGoldForce(45) JoinParty()~ JOURNAL @35 EXIT
  IF ~NumInParty(3)~ THEN DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) GiveGoldForce(30) JoinParty()~ JOURNAL @35 EXIT
  IF ~NumInParty(2)~ THEN DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) GiveGoldForce(15) JoinParty()~ JOURNAL @35 EXIT
  IF ~NumInParty(1)~ THEN DO ~EraseJournalEntry(@33) EraseJournalEntry(@44) GiveGoldForce(15) JoinParty()~ JOURNAL @35 EXIT
END

END

EXTEND_BOTTOM ~%tutu_var%HOUSG3~ 0
IF ~OR(2) Global("X#KagainCaravan","GLOBAL",5) PartyHasItem("X#SILSH")~ THEN REPLY @46 GOTO X#SilverGuardPass
END

APPEND ~%tutu_var%HOUSG3~
IF ~~ THEN BEGIN X#SilverGuardPass
SAY @47 
IF ~~ THEN EXIT
END
END
