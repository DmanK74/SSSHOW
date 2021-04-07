<?php
// аргумента запроса
$NickName = $_GET['NickName'];
$Pass = $_GET['Pass'];


 $qvisitors = mysqli_query($connection, 
"SELECT * FROM $db_5 ORDER BY $db_5.`NickName` ASC ");
 

// результат
echo json_encode([
  "NickName" => $NickName,
  "Pass" => $Pass,
]);