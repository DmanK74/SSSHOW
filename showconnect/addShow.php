<?php

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

 $sname = $_GET['showName'];
 $genre = $_GET['genre'];
 $actors = $_GET['actors'];
 $director = $_GET['director'];
 $scoreShow = $_GET['scoreShow'];
 $poster = $_GET['poster'];
 $showCost = $_GET['showCost'];
 $showInfo = $_GET['showInfo'];

$qshow = mysqli_query($connection, 
"INSERT INTO shows (showName, genre, actors, director, id, scoreShow, poster, showCost, showInfo) VALUES ('$sname', '$genre', '$actors', '$director', NULL, '$scoreShow', '$poster', '$showCost', '$showInfo')");

// $qgenres = mysqli_query($connection,
// "SELECT * FROM shows WHERE id ORDER BY id DESC LIMIT 1");

$result = array();
while($row = mysqli_fetch_assoc($qshow))
{
$result = [
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