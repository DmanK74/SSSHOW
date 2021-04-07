<?php

require_once __DIR__ . "/../connect.php";

$qSwows = mysqli_query($connection, "SELECT * FROM $db_3 ORDER BY $db_3.`showName` ASC");

$result = [];
while($row = mysqli_fetch_assoc($qSwows))
{
  $result[] = [
    'showName' => $row["showName"], 
    'genre' => $row["genre"], 
    'actors' => $row["actors"],
    'director' => $row["director"],
    'id' => $row["id"],
    'scoreShow' => $row["scoreShow"],
    'poster' => $row["poster"],
    'showCost' => $row["showCost"],
    'showInfo' => $row["showInfo"]
  ];
}

// результат
echo json_encode(
  $result
);
?>