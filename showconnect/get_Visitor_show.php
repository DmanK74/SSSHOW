<?php

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

 $visitor_id = $_GET['visitor_id'];


$qvisitors = mysqli_query($connection, 
"SELECT showName, ticket.showCost, TiketId, ticket.ShowId FROM shows, ticket WHERE ticket.ShowId = shows.id AND ticket.Visitor_id = '$visitor_id'");

$result = array();
while($row = mysqli_fetch_assoc($qvisitors))
{
$result[] = [
  'TiketId' => $row["TiketId"],
  'showName' => $row["showName"],
  'showCost' => $row["showCost"],
  'ShowId' => $row["ShowId"]
];
}

// результат
echo json_encode(
$result
);
?>