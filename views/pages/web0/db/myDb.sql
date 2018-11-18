-- myDb.SQL --
-- Author: Nathan Tagg
-- This document contains all sql code for setting up a database for an address book.

-- Create tables and sequences --
CREATE TABLE SYSTEM_USER
( system_user_id   BIGINT
, system_user_name TEXT CONSTRAINT nn_system_user_1 NOT NULL
, CONSTRAINT pk_system_user_1 PRIMARY KEY (system_user_id)
, CONSTRAINT uk_system_user_1 UNIQUE (system_user_name));
CREATE SEQUENCE system_user_s1 START WITH 1001;

CREATE TABLE COMMON_LOOKUP
( common_lookup_id    BIGINT
, common_lookup_table TEXT CONSTRAINT nn_common_lookup_1 NOT NULL
, common_lookup_type  TEXT CONSTRAINT nn_common_lookup_2 NOT NULL
, created_by          BIGINT
, CONSTRAINT pk_common_lookup_1 PRIMARY KEY (common_lookup_id)
, CONSTRAINT fk_common_lookup_1 FOREIGN KEY (created_by) REFERENCES system_user(system_user_id)
, CONSTRAINT uk_common_lookup_1 UNIQUE (common_lookup_table, common_lookup_type));
CREATE SEQUENCE common_lookup_s1 START WITH 1001;

CREATE TABLE PERSON
( person_id    BIGINT
, person_type  BIGINT
, name_first   TEXT
, name_middle  TEXT
, name_last    TEXT
, brithday     DATE
, picture_url  TEXT
, created_by   BIGINT CONSTRAINT nn_person_1 NOT NULL
, CONSTRAINT pk_person_1 PRIMARY KEY (person_id)
, CONSTRAINT fk_person_1 FOREIGN KEY (created_by)  REFERENCES system_user (system_user_id)
, CONSTRAINT fk_person_2 FOREIGN KEY (person_type) REFERENCES common_lookup (common_lookup_id)
, CONSTRAINT ck_person_1 CHECK (name_first IS NOT NULL or name_last IS NOT NULL));
CREATE SEQUENCE person_s1 START WITH 1001;

CREATE TABLE TELEPHONE
( telephone_id     BIGINT
, telephone_type   BIGINT
, person_id        BIGINT
, country_code     BIGINT
, area_code        BIGINT CONSTRAINT nn_telephone_1 NOT NULL
, telephone_number BIGINT CONSTRAINT nn_telephone_2 NOT NULL
, created_by       BIGINT
, CONSTRAINT pk_telephone_1 PRIMARY KEY (telephone_id)
, CONSTRAINT fk_telephone_1 FOREIGN KEY (person_id)      REFERENCES person (person_id)
, CONSTRAINT fk_telephone_2 FOREIGN KEY (created_by)     REFERENCES system_user (system_user_id)
, CONSTRAINT fk_telephone_3 FOREIGN KEY (telephone_type) REFERENCES common_lookup (common_lookup_id));
CREATE SEQUENCE telephone_s1 START WITH 1001;

CREATE TABLE ADDRESS
( address_id     BIGINT
, address_type   BIGINT
, person_id      BIGINT
, country        TEXT
, state          TEXT
, postal_code    TEXT
, street_address TEXT
, apartment      TEXT
, created_by     BIGINT
, CONSTRAINT pk_address_1 PRIMARY KEY (address_id)
, CONSTRAINT fk_address_1 FOREIGN KEY (person_id)    REFERENCES person (person_id)
, CONSTRAINT fk_address_2 FOREIGN KEY (created_by)   REFERENCES system_user (system_user_id)
, CONSTRAINT fk_address_3 FOREIGN KEY (address_type) REFERENCES common_lookup (common_lookup_id));
CREATE SEQUENCE address_s1 START WITH 1001;

CREATE TABLE EMAIL
( email_id   BIGINT
, email_type BIGINT
, person_id  BIGINT
, email      TEXT
, created_by BIGINT
, CONSTRAINT pk_email_1 PRIMARY KEY (email_id)
, CONSTRAINT fk_email_1 FOREIGN KEY (person_id)  REFERENCES person (person_id)
, CONSTRAINT fk_email_2 FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_email_3 FOREIGN KEY (email_type) REFERENCES common_lookup (common_lookup_id));
CREATE SEQUENCE email_s1 START WITH 1001;
