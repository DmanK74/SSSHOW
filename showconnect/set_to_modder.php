<?php

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

 $visitor_id = $_GET['Visitor_id'];


$qvisitors = mysqli_query($connection, 
"UPDATE visitors SET Permision = '2' WHERE visitors.id = '$visitor_id'");



$result;
while($row = mysqli_fetch_assoc($qvisitors))
{
$result = [
  'TiketId' => $row["TiketId"],
  'showCost' => $row["showCost"],
  'Visitor_id' => $row["Visitor_id"],
  'ShowId' => $row["ShowId"]
];
}

// результат
echo json_encode(
$result
);
?>