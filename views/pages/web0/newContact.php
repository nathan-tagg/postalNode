<?php
//TODO: if added functionality of logging in, change the whodunit to the current user. that is all.
$name_first = htmlspecialchars($_POST["firstName"]);
$name_middle = htmlspecialchars($_POST["middleName"]);
$name_last = htmlspecialchars($_POST["lastName"]);
switch (htmlspecialchars($_POST["relationship"])) {
    case 'friend':
        $relationship = 1003;
        break;
    case 'co-worker':
        $relationship = 1004;
        break;
    case 'family':
        $relationship = 1002;
        break;
    case 'spouse':
        $relationship = 1001;
        break;
    default:
        $relationship = null;
}
$birthday = htmlspecialchars($_POST["birthday"]);
$picture = htmlspecialchars($_POST["image"]);

$numberOfPhoneNumbers = (int)htmlspecialchars($_POST['numberOfPhoneNumbers']);
$numberOfAddresses = (int)htmlspecialchars($_POST['numberOfAddresses']);
$numberOfEmails = (int)htmlspecialchars($_POST['numberOfEmails']);

$host = 'ec2-54-235-73-241.compute-1.amazonaws.com';
$dbname = 'ddgliuko4bnn30';
$username = 'lrjdfhijghkjgr';
$password = '022793f308a02ea702614c5a2d20ac4d2ab20840c3c722847c870416949c3e2f';
try
{
  $db = new PDO("pgsql:host=$host;port=5432;dbname=$dbname", $username, $password);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $ex)
{
  echo 'Error!: ' . $ex->getMessage();
  die();
}


// Insert the peoples
$query = 'INSERT INTO PERSON(SELECT nextval(\'person_s1\'), :relationship, :name_first, :name_middle, :name_last, :birthday, :picture, (SELECT system_user_id FROM system_user WHERE system_user_name = \'Nathan\'))';

  $statement = $db->prepare($query);

  $statement->bindValue(':relationship', $relationship);
  $statement->bindValue(':name_first', $name_first);
  $statement->bindValue(':name_middle', $name_middle);
  $statement->bindValue(':name_last', $name_last);
  $statement->bindValue(':birthday', $birthday);
  $statement->bindValue(':picture', $picture);
  $statement->execute();

// Insert the telephones
for ($i=1; $i <= $numberOfPhoneNumbers; $i++) {
  switch (htmlspecialchars($_POST['telephone_type' . $i])) {
      case 'home':
          $telephone_type = 1006;
          break;
      case 'work':
          $telephone_type = 1008;
          break;
      case 'cell':
          $telephone_type = 1007;
          break;
      default:
          $telephone_type = null;
  }

  $country_code = (int)htmlspecialchars($_POST['countryCode' . $i]);
  $area_code = (int)htmlspecialchars($_POST['areaCode' . $i]);
  $telephone_number = (int)htmlspecialchars($_POST['phoneNumber' . $i]);
  $query = 'INSERT INTO TELEPHONE(SELECT nextval(\'telephone_s1\'), :telephone_type, (SELECT currval(\'person_s1\')), :country_code, :area_code, :telephone_number, (SELECT system_user_id FROM system_user WHERE system_user_name = \'Nathan\'))';
    $statement = $db->prepare($query);
    $statement->bindValue(':telephone_type', $telephone_type);
    $statement->bindValue(':country_code', $country_code);
    $statement->bindValue(':area_code', $area_code);
    $statement->bindValue(':telephone_number', $telephone_number);
    $statement->execute();
}

// Insert the addresses
for ($i=1; $i <= $numberOfAddresses; $i++) {
  switch (htmlspecialchars($_POST['address_type' . $i])) {
      case 'home':
          $address_type = 1009;
          break;
      case 'work':
          $address_type = 1010;
          break;
      default:
          $address_type = null;
  }

  $country = htmlspecialchars($_POST['country' . $i]);
  $state = htmlspecialchars($_POST['state' . $i]);
  $postal_code = htmlspecialchars($_POST['postalCode' . $i]);
  $street_address = htmlspecialchars($_POST['streetAddress' . $i]);
  $apartment = htmlspecialchars($_POST['apartment' . $i]);
  $query = "INSERT INTO ADDRESS
            ( SELECT nextval('address_s1')
            , :address_type
            , (SELECT currval('person_s1'))
            , :country
            , :state
            , :postal_code
            , :street_address
            , :apartment
            , (SELECT system_user_id
               FROM system_user
               WHERE system_user_name = 'Nathan'))";
    $statement = $db->prepare($query);
    $statement->bindValue(':address_type', $address_type);
    $statement->bindValue(':country', $country);
    $statement->bindValue(':state', $state);
    $statement->bindValue(':postal_code', $postal_code);
    $statement->bindValue(':street_address', $street_address);
    $statement->bindValue(':apartment', $apartment);
    $statement->execute();
}

for ($i=1; $i <= $numberOfEmails; $i++) {
  switch (htmlspecialchars($_POST['email_type' . $i])) {
      case 'work':
          $email_type = 1012;
          break;
      case 'personal':
          $email_type = 1011;
          break;
      default:
          $email_type = null;
  }

  $email = htmlspecialchars($_POST['email' . $i]);
  $query = "INSERT INTO EMAIL
            ( SELECT nextval('email_s1')
            , :email_type
            , (SELECT currval('person_s1'))
            , :email
            , (SELECT system_user_id
               FROM system_user
               WHERE system_user_name = 'Nathan'))";
    $statement = $db->prepare($query);
    $statement->bindValue(':email_type', $email_type);
    $statement->bindValue(':email', $email);
    $statement->execute();
}

 ?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Contact Created! :)</title>
    <link rel="stylesheet" href="./addressBook.css">
  </head>
  <body>
    <h1>Contact added</h1>

    <blockquote style="text-align:center">
        <i><a href="./addressBook.php" style="text-align: center;">View Contacts</a></i>
    </blockquote>

  </body>
</html>
