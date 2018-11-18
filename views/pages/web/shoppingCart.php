<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Shopping cart</title>

    <script type="text/javascript">
    function deleteItem(name) { document.cookie = name + "=" + 0 + "; expires=2147483647"; }
    </script>

  </head>
  <body>

    <?php
    $itemOne   = htmlspecialchars($_POST["numberOfItemOne"]);
    $itemTwo   = htmlspecialchars($_POST["numberOfItemTwo"]);
    $itemThree = htmlspecialchars($_POST["numberOfItemThree"]);
    $itemFour  = htmlspecialchars($_POST["numberOfItemFour"]);
    $itemFive  = htmlspecialchars($_POST["numberOfItemFive"]);
    $itemSix   = htmlspecialchars($_POST["numberOfItemSix"]);

    if (isset($_COOKIE['one']))   { setcookie(one, $_COOKIE['one'] + $itemOne, time() + 2147483647); $itemOne += $_COOKIE['one']; }
    else { setcookie(one, $itemOne, time() + 2147483647); $itemOne += $_COOKIE['one']; }
    if (isset($_COOKIE['two']))   { setcookie(two, $_COOKIE['two'] + $itemTwo, time() + 2147483647); $itemTwo += $_COOKIE['two']; }
    else { setcookie(two, $itemTwo, time() + 2147483647); $itemTwo += $_COOKIE['two']; }
    if (isset($_COOKIE['three'])) { setcookie(three, $_COOKIE['three'] + $itemThree, time() + 2147483647); $itemThree += $_COOKIE['three']; }
    else { setcookie(three, $itemThree, time() + 2147483647); $itemThree += $_COOKIE['three']; }
    if (isset($_COOKIE['four']))  { setcookie(four, $_COOKIE['four'] + $itemFour, time() + 2147483647); $itemFour += $_COOKIE['four']; }
    else { setcookie(four, $itemFour, time() + 2147483647); $itemFour += $_COOKIE['four']; }
    if (isset($_COOKIE['five']))  { setcookie(five, $_COOKIE['five'] + $itemFive, time() + 2147483647); $itemFive += $_COOKIE['five']; }
    else { setcookie(five, $itemFive, time() + 2147483647); $itemFive += $_COOKIE['five']; }
    if (isset($_COOKIE['six']))   { setcookie(six, $_COOKIE['six'] + $itemSix, time() + 2147483647); $itemSix += $_COOKIE['six']; }
    else { setcookie(six, $itemSix, time() + 2147483647); $itemSix += $_COOKIE['six']; }
    ?>

    <?if ($itemOne) echo $itemOne . " * one";?>
    <input type="button" name="deleteOne" onclick="deleteItem('one'); location.reload(true);" value="Delete this item">
    <br>
    <?if ($itemTwo) echo $itemTwo . " * two";?>
    <input type="button" name="deleteTwo" onclick="deleteItem('two'); location.reload(true);" value="Delete this item">
    <br>
    <?if ($itemThree) echo $itemThree . " * three";?>
    <input type="button" name="deleteThree" onclick="deleteItem('three'); location.reload(true);" value="Delete this item">
    <br>
    <?if ($itemFour) echo $itemFour . " * four";?>
    <input type="button" name="deleteFour" onclick="deleteItem('four'); location.reload(true);" value="Delete this item">
    <br>
    <?if ($itemFive) echo $itemFive . " * five";?>
    <input type="button" name="deleteFive" onclick="deleteItem('five'); location.reload(true);" value="Delete this item">
    <br>
    <?if ($itemSix) echo $itemSix . " * six";?>
    <input type="button" name="deleteSix" onclick="deleteItem('six'); location.reload(true);" value="Delete this item">

  </body>
</html>
