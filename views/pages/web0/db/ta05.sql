CREATE TABLE SCRIPTURE
( scripture_id INT
, book          TEXT
, chapter       INT
, verse         INT
, content       TEXT
, CONSTRAINT pk_scriptures_1 PRIMARY KEY (scriptures_id));
CREATE SEQUENCE scriptures_s1 START WITH 1001;

INSERT INTO SCRIPTURES
( scriptures_s1.nextval() -- scripture id
, 'John'-- book
, 1     -- chapter
, 5     -- verse
, 'And the light shineth in darkness; and the darkness comprehended it not.' -- content
);

INSERT INTO SCRIPTURES
( scriptures_s1.nextval() -- scripture id
, 'Doctrine and Covenants'-- book
, 88 -- chapter
, 49 -- verse
, 'The light shineth in darkness, and the darkness comprehendeth it not; nevertheless, the day shall come when you shall comprehend even God, being quickened in him and by him.'-- content
);

INSERT INTO SCRIPTURES
( scriptures_s1.nextval() -- scripture id
, 'Doctrine and Covenants'-- book
, 93-- chapter
, 28-- verse
, 'He that keepeth his commandments receiveth truth and light, until he is glorified in truth and knoweth all things.'-- content
);

INSERT INTO SCRIPTURES
( scriptures_s1.nextval()-- scripture id
, 'Mosiah'-- book
, 16-- chapter
, 9-- verse
, 'He is the light and the life of the world; yea, a light that is endless, that can never be darkened; yea, and also a life which is endless, that there can be no more death.'-- content
);
