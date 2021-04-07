<?php

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

 $showCost = $_GET['showCost'];
 $visitor_id = $_GET['Visitor_id'];
 $showId = $_GET['ShowId'];


$qvisitors = mysqli_query($connection, 
"INSERT INTO `ticket` (`TiketId`, `showCost`, `Visitor_id`, `ShowId`) VALUES (NULL, $showCost, $visitor_id, $showId)");
$qvisitors = mysqli_query($connection,
"SELECT * FROM ticket WHERE Visitor_id ORDER BY TiketId DESC LIMIT 1");


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