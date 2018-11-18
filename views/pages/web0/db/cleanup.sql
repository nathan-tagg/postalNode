-- cleanup.sql --
-- Author: Nathan Tagg
-- cleans up the database

-- drop all tables
DROP TABLE SYSTEM_USER;
DROP TABLE COMMON_LOOKUP;
DROP TABLE PERSON;
DROP TABLE TELEPHONE;
DROP TABLE ADDRESS;
DROP TABLE EMAIL;

-- drop all sequences
DROP SEQUENCE system_user_s1;
DROP SEQUENCE common_lookup_s1;
DROP SEQUENCE person_s1;
DROP SEQUENCE telephone_s1;
DROP SEQUENCE address_s1;
DROP SEQUENCE email_s1;
