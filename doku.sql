--------------------------------------------------------
--  DDL for Table MAP
--------------------------------------------------------

  CREATE TABLE "MAP" 
   (	"ID" NUMBER(8,0), 
	"NAME" VARCHAR2(1000), 
	"ADDR" VARCHAR2(1000), 
	"LAT" FLOAT(126), 
	"LNG" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table CALENDAR
--------------------------------------------------------

  CREATE TABLE "CALENDAR" 
   (	"ID" VARCHAR2(100), 
	"TITLE" VARCHAR2(500), 
	"STARTDATE" DATE, 
	"ENDDATE" DATE, 
	"NICKNAME" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"ID" NUMBER(8,0), 
	"HEADER" VARCHAR2(18), 
	"TITLE" VARCHAR2(150), 
	"CONTENT" VARCHAR2(3000), 
	"WRITEDATE" DATE, 
	"NICKNAME" VARCHAR2(20), 
	"CNT" NUMBER(8,0), 
	"SRC" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table PETMEMBER
--------------------------------------------------------

  CREATE TABLE "PETMEMBER" 
   (	"ID" VARCHAR2(20), 
	"EMAIL" VARCHAR2(100), 
	"PWD" VARCHAR2(30), 
	"PWDCHK" VARCHAR2(30), 
	"NAME" VARCHAR2(15), 
	"NICKNAME" VARCHAR2(30), 
	"ADDRESS" VARCHAR2(300), 
	"PET" VARCHAR2(30), 
	"POSTCNT" NUMBER(8,0), 
	"COMCNT" NUMBER(8,0)
   )
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "COMMENTS" 
   (	"NICKNAME" VARCHAR2(20), 
	"WRITEDATE" DATE, 
	"CONTENT" VARCHAR2(3000), 
	"ID" NUMBER(8,0), 
	"CNUM" NUMBER(8,0)
   )