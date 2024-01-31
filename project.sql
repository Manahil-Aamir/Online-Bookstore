
   CREATE SEQUENCE  "C##INTERIMPROJECT"."ADDRESSID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;


   CREATE SEQUENCE  "C##INTERIMPROJECT"."AUTHORID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9136 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



   CREATE SEQUENCE  "C##INTERIMPROJECT"."BOOKID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11187 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;


   CREATE SEQUENCE  "C##INTERIMPROJECT"."BOOKREVIEW_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



   CREATE SEQUENCE  "C##INTERIMPROJECT"."CSEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



   CREATE SEQUENCE  "C##INTERIMPROJECT"."ORDERID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;


   CREATE SEQUENCE  "C##INTERIMPROJECT"."PUBLISHERID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2305 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



   CREATE SEQUENCE  "C##INTERIMPROJECT"."QUERYID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



   CREATE SEQUENCE  "C##INTERIMPROJECT"."REVIEW_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



   CREATE SEQUENCE  "C##INTERIMPROJECT"."REVIEWID_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;



  CREATE TABLE "C##INTERIMPROJECT"."QUERY" 
   (	"QUERY_ID" NUMBER(*,0), 
	"FIRST_NAME" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"MESSAGE" VARCHAR2(1000 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
ALTER TABLE "C##INTERIMPROJECT"."QUERY" ADD PRIMARY KEY ("QUERY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."QUERYIDINSERT" BEFORE INSERT ON QUERY
FOR EACH ROW
BEGIN
SELECT QUERYID_SEQUENCE.NEXTVAL INTO :NEW.QUERY_ID
FROM DUAL;
END;


/
ALTER TRIGGER "C##INTERIMPROJECT"."QUERYIDINSERT" ENABLE;

/



  CREATE TABLE "C##INTERIMPROJECT"."PUBLISHER" 
   (	"PUBLISHER_ID" NUMBER, 
	"PUBLISHER_NAME" VARCHAR2(400 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "PK_PUBLISHER" PRIMARY KEY ("PUBLISHER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."PUBIDINSERT" BEFORE INSERT ON PUBLISHER
FOR EACH ROW
BEGIN 
SELECT PUBLISHERID_SEQUENCE.NEXTVAL INTO :NEW.PUBLISHER_ID
FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."PUBIDINSERT" ENABLE;

/

  CREATE TABLE "C##INTERIMPROJECT"."AUTHOR" 
   (	"AUTHOR_ID" NUMBER, 
	"AUTHOR_NAME" VARCHAR2(400 BYTE), 
	 CONSTRAINT "PK_AUTHOR" PRIMARY KEY ("AUTHOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."AUTHORIDINSERT" before insert on AUTHOR
for each row
begin 
select AUTHORID_SEQUENCE.NEXTVAL INTO :NEW.AUTHOR_ID
FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."AUTHORIDINSERT" ENABLE;

/

  CREATE TABLE "C##INTERIMPROJECT"."FINAL_TABLE" 
   (	"BOOK_ID" NUMBER, 
	"TITLE" VARCHAR2(400 BYTE) NOT NULL ENABLE, 
	"ISBN13" VARCHAR2(13 BYTE) NOT NULL ENABLE, 
	"NUM_PAGES" NUMBER NOT NULL ENABLE, 
	"PUBLICATION_DATE" DATE NOT NULL ENABLE, 
	"PUBLISHER_ID" NUMBER, 
	"FORMAT" VARCHAR2(22 BYTE), 
	"CATEGORY" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"IMAGE_URL" VARCHAR2(225 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"QUANTITY" NUMBER(*,0), 
	"PRICE" NUMBER DEFAULT 1000 NOT NULL ENABLE, 
	 CONSTRAINT "PKEY" PRIMARY KEY ("BOOK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "CHECK_QUANTITY_POSITIVE" CHECK (quantity >= 0) ENABLE, 
	 CONSTRAINT "CHECK_PRICE_POSITIVE" CHECK (price >= 0) ENABLE, 
	 CONSTRAINT "FK_PUBLISHER_ID" FOREIGN KEY ("PUBLISHER_ID")
	  REFERENCES "C##INTERIMPROJECT"."PUBLISHER" ("PUBLISHER_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."BOOKIDINSERT" before insert on FINAL_TABLE
for each row
begin 
select BOOKID_SEQUENCE.NEXTVAL INTO :NEW.BOOK_ID
FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."BOOKIDINSERT" ENABLE;

/

  CREATE TABLE "C##INTERIMPROJECT"."BOOK_AUTHOR" 
   (	"BOOK_ID" NUMBER, 
	"AUTHOR_ID" NUMBER, 
	 CONSTRAINT "PK_BOOKAUTHOR" PRIMARY KEY ("BOOK_ID", "AUTHOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/


  CREATE TABLE "C##INTERIMPROJECT"."REVIEW" 
   (	"REVIEW_ID" NUMBER, 
	"CUSTOMERREVIEW" VARCHAR2(255 BYTE), 
	 PRIMARY KEY ("REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."REVIEWIDINSERT" BEFORE INSERT ON review
FOR EACH ROW
BEGIN
  SELECT review_SEQUENCE.NEXTVAL INTO :NEW.review_ID FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."REVIEWIDINSERT" ENABLE;

/

  CREATE TABLE "C##INTERIMPROJECT"."BOOK_REVIEWS" 
   (	"BOOK_ID" NUMBER NOT NULL ENABLE, 
	"REVIEW_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "UNIQUENESS" UNIQUE ("BOOK_ID", "REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FKEY" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "C##INTERIMPROJECT"."FINAL_TABLE" ("BOOK_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."REVIEWIDINTABLE" BEFORE INSERT ON book_reviews
FOR EACH ROW
BEGIN
  SELECT bookreview_SEQUENCE.NEXTVAL INTO :NEW.review_ID FROM DUAL;
END;
/
ALTER TRIGGER "C##INTERIMPROJECT"."REVIEWIDINTABLE" ENABLE;

/


  CREATE TABLE "C##INTERIMPROJECT"."CITY" 
   (	"CITY_ID" NUMBER, 
	"CITY_NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "PK_COUNTRY" PRIMARY KEY ("CITY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/

  CREATE TABLE "C##INTERIMPROJECT"."ORDER_STATUS" 
   (	"STATUS_ID" NUMBER, 
	"STATUS_VALUE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "PK_ORDERSTATUS" PRIMARY KEY ("STATUS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/

  CREATE TABLE "C##INTERIMPROJECT"."ADDRESS" 
   (	"ADDRESS_ID" NUMBER, 
	"STREET_NUMBER" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"STREET_NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CITY_ID" NUMBER NOT NULL ENABLE, 
	"ZIPCODE" NUMBER(5,0) NOT NULL ENABLE, 
	 CONSTRAINT "PK_ADDRESS" PRIMARY KEY ("ADDRESS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."ADDRESSIDINSERT" before insert on ADDRESS
for each row
begin 
select ADDRESSID_SEQUENCE.NEXTVAL INTO :NEW.ADDRESS_ID
FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."ADDRESSIDINSERT" ENABLE;

/


  CREATE TABLE "C##INTERIMPROJECT"."CUSTOMER" 
   (	"CUSTOMER_ID" NUMBER, 
	"FIRST_NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(350 BYTE) NOT NULL ENABLE, 
	"MOBILE_NUMBER" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_CUSTOMER" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."CUSTOMERIDINSERT" before insert on CUSTOMER
for each row
begin 
select CSEQUENCE.NEXTVAL INTO :NEW.CUSTOMER_ID
FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."CUSTOMERIDINSERT" ENABLE;

/

  CREATE TABLE "C##INTERIMPROJECT"."CUSTOMER_ADDRESS" 
   (	"CUSTOMER_ID" NUMBER, 
	"ADDRESS_ID" NUMBER, 
	 CONSTRAINT "PK_CUSTADDR" PRIMARY KEY ("CUSTOMER_ID", "ADDRESS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CA_CUST" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "C##INTERIMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE, 
	 CONSTRAINT "FK_CA_ADDR" FOREIGN KEY ("ADDRESS_ID")
	  REFERENCES "C##INTERIMPROJECT"."ADDRESS" ("ADDRESS_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/


  CREATE TABLE "C##INTERIMPROJECT"."CUST_ORDER" 
   (	"ORDER_ID" NUMBER, 
	"ORDER_DATE" DATE NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER NOT NULL ENABLE, 
	"DEST_ADDRESS_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_CUSTORDER" PRIMARY KEY ("ORDER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "CUST_ORDER_UK1" UNIQUE ("CUSTOMER_ID", "ORDER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_ORDER_CUST" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "C##INTERIMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE, 
	 CONSTRAINT "FK_ORDER_ADDR" FOREIGN KEY ("DEST_ADDRESS_ID")
	  REFERENCES "C##INTERIMPROJECT"."ADDRESS" ("ADDRESS_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##INTERIMPROJECT"."ORDERIDINSERT" BEFORE INSERT ON CUST_ORDER
FOR EACH ROW
BEGIN
SELECT ORDERID_SEQUENCE.NEXTVAL INTO :NEW.ORDER_ID
FROM DUAL;
END;

/
ALTER TRIGGER "C##INTERIMPROJECT"."ORDERIDINSERT" ENABLE;

/

  CREATE TABLE "C##INTERIMPROJECT"."RECEIPT" 
   (	"ORDER_ID" NUMBER NOT NULL ENABLE, 
	"BOOK_ID" NUMBER NOT NULL ENABLE, 
	"UNITPICE" NUMBER(*,2), 
	"QUANTITY" NUMBER, 
	"TOTAL" NUMBER, 
	 CONSTRAINT "RECEIPT_PK" PRIMARY KEY ("ORDER_ID", "BOOK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_OL_ORDER" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "C##INTERIMPROJECT"."CUST_ORDER" ("ORDER_ID") ENABLE, 
	 CONSTRAINT "F_KEYR" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "C##INTERIMPROJECT"."FINAL_TABLE" ("BOOK_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/

  CREATE TABLE "C##INTERIMPROJECT"."TOTAL" 
   (	"ORDER_ID" NUMBER NOT NULL ENABLE, 
	"ORDER_TOTAL" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "TOTAL_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/

  CREATE TABLE "C##INTERIMPROJECT"."ORDER_HISTORY" 
   (	"ORDER_ID" NUMBER NOT NULL ENABLE, 
	"STATUS_ID" NUMBER NOT NULL ENABLE, 
	"STATUS_DATE" DATE, 
	 CONSTRAINT "ORDER_HISTORY_PK" PRIMARY KEY ("ORDER_ID", "STATUS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_OH_ORDER" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "C##INTERIMPROJECT"."CUST_ORDER" ("ORDER_ID") ENABLE, 
	 CONSTRAINT "FK_OH_STATUS" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "C##INTERIMPROJECT"."ORDER_STATUS" ("STATUS_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

/