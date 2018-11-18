-- In the beginning, there was nothing... Then, there was.. --
INSERT INTO SYSTEM_USER
( SELECT nextval('system_user_s1')
, 'Nathan');

-- Create the generic 'UNDEFINED' defining row in common_lookup --
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'ALL'
, 'UNDEFINED'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Create the types of person(s) in common_lookup --

-- Spouse
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'PERSON'
, 'spouse'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Family
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'PERSON'
, 'family'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Friend
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'PERSON'
, 'friend'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Co-worker
  INSERT INTO COMMON_LOOKUP
  ( SELECT nextval('common_lookup_s1')
  , 'PERSON'
  , 'co-worker'
  , (SELECT system_user_id
     FROM system_user
     WHERE system_user_name = 'Nathan'));

-- Create the types of telephone(s) in common_lookup --

-- Home
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'TELEPHONE'
, 'home'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Cell
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'TELEPHONE'
, 'cell'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Work
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'TELEPHONE'
, 'work'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Create the types of address(es) in common_lookup --

-- Home
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'ADDRESS'
, 'home'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Work
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'ADDRESS'
, 'work'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

--  Create the types of email(s) in common_lookup --

-- Personal
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'EMAIL'
, 'personal'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Work
INSERT INTO COMMON_LOOKUP
( SELECT nextval('common_lookup_s1')
, 'EMAIL'
, 'work'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- Insert some test data --

-- Jose Aldo Junior
INSERT INTO PERSON
( SELECT nextval('person_s1')
, (SELECT common_lookup_id
   FROM common_lookup
   WHERE common_lookup_table = 'PERSON' AND common_lookup_type = 'friend')
, 'Jose'
, 'Junior'
, 'Aldo'
, DATE '09/09/1986'
, 'http://www.gstatic.com/tv/thumb/persons/796595/796595_v9_ba.jpg'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- His phone number
INSERT INTO TELEPHONE
( SELECT nextval('telephone_s1')
, (SELECT common_lookup_id
   FROM common_lookup
   WHERE common_lookup_table = 'TELEPHONE' AND common_lookup_type = 'cell')
, (SELECT currval('person_s1'))
, 1
, 111
, 1111111
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- His address
INSERT INTO ADDRESS
( SELECT nextval('address_s1')
, (SELECT common_lookup_id
   FROM common_lookup
   WHERE common_lookup_table = 'ADDRESS' AND common_lookup_type = 'home')
, (SELECT currval('person_s1'))
, 'Brazil'
, 'Manaus'
, '69045-240'
, 'Estrada dos Passaros'
, ''
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

-- His email
INSERT INTO EMAIL
( SELECT nextval('email_s1')
, (SELECT common_lookup_id
   FROM common_lookup
   WHERE common_lookup_table = 'EMAIL' AND common_lookup_type = 'personal')
, currval('person_s1')
, 'josejunior@gmail.com'
, (SELECT system_user_id
   FROM system_user
   WHERE system_user_name = 'Nathan'));

   -- Kabib Nurmagomedov
   INSERT INTO PERSON
   ( SELECT nextval('person_s1')
   , (SELECT common_lookup_id
      FROM common_lookup
      WHERE common_lookup_table = 'PERSON' AND common_lookup_type = 'friend')
   , 'Khabib'
   , ''
   , 'Nurmagomedov'
   , DATE '09/09/1986'
   , 'https://www.thefamouspeople.com/profiles/images/khabib-nurmagomedov-6.jpg'
   , (SELECT system_user_id
      FROM system_user
      WHERE system_user_name = 'Nathan'));

   -- His phone number
   INSERT INTO TELEPHONE
   ( SELECT nextval('telephone_s1')
   , (SELECT common_lookup_id
      FROM common_lookup
      WHERE common_lookup_table = 'TELEPHONE' AND common_lookup_type = 'cell')
   , (SELECT currval('person_s1'))
   , 2
   , 222
   , 2222222
   , (SELECT system_user_id
      FROM system_user
      WHERE system_user_name = 'Nathan'));

   -- His address
   INSERT INTO ADDRESS
   ( SELECT nextval('address_s1')
   , (SELECT common_lookup_id
      FROM common_lookup
      WHERE common_lookup_table = 'ADDRESS' AND common_lookup_type = 'home')
   , (SELECT currval('person_s1'))
   , 'Russia'
   , 'Dagastan'
   , '85309-332'
   , '85 Blyat DR'
   , ''
   , (SELECT system_user_id
      FROM system_user
      WHERE system_user_name = 'Nathan'));

   -- His email
   INSERT INTO EMAIL
   ( SELECT nextval('email_s1')
   , (SELECT common_lookup_id
      FROM common_lookup
      WHERE common_lookup_table = 'EMAIL' AND common_lookup_type = 'personal')
   , currval('person_s1')
   , 'nurmagomedov@gmail.com'
   , (SELECT system_user_id
      FROM system_user
      WHERE system_user_name = 'Nathan'));

      -- Zabit Magomedshapirov
      INSERT INTO PERSON
      ( SELECT nextval('person_s1')
      , (SELECT common_lookup_id
         FROM common_lookup
         WHERE common_lookup_table = 'PERSON' AND common_lookup_type = 'co-worker')
      , 'Zabit'
      , ''
      , 'Magomedshapirov'
      , DATE '03/01/1991'
      , 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Zabit_magomedsharipov.jpg/220px-Zabit_magomedsharipov.jpg'
      , (SELECT system_user_id
         FROM system_user
         WHERE system_user_name = 'Nathan'));

      -- His phone number
      INSERT INTO TELEPHONE
      ( SELECT nextval('telephone_s1')
      , (SELECT common_lookup_id
         FROM common_lookup
         WHERE common_lookup_table = 'TELEPHONE' AND common_lookup_type = 'work')
      , (SELECT currval('person_s1'))
      , 3
      , 333
      , 3333333
      , (SELECT system_user_id
         FROM system_user
         WHERE system_user_name = 'Nathan'));

      -- His address
      INSERT INTO ADDRESS
      ( SELECT nextval('address_s1')
      , (SELECT common_lookup_id
         FROM common_lookup
         WHERE common_lookup_table = 'ADDRESS' AND common_lookup_type = 'home')
      , (SELECT currval('person_s1'))
      , 'Russia'
      , 'Dagastan'
      , '85309-332'
      , '86 Blyat DR'
      , ''
      , (SELECT system_user_id
         FROM system_user
         WHERE system_user_name = 'Nathan'));

      -- His email
      INSERT INTO EMAIL
      ( SELECT nextval('email_s1')
      , (SELECT common_lookup_id
         FROM common_lookup
         WHERE common_lookup_table = 'EMAIL' AND common_lookup_type = 'work')
      , currval('person_s1')
      , 'magomedshapirov@gmail.com'
      , (SELECT system_user_id
         FROM system_user
         WHERE system_user_name = 'Nathan'));
