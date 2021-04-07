<?php
// аргумента запроса
$showName = $_GET['showName'];
$genre = $_GET['genre'];
$actors = $_GET['actors'];
$director = $_GET['director'];
$id = $_GET['id'];
$scoreShow = $_GET['scoreShow']; 
$poster = $_GET['poster'];
$showCost = $_GET['showCost'];
$showInfo = $_GET['showInfo'];

 //$servants = mysqli_query($connection, "SELECT * FROM $db_3 ORDER BY $db_3.`showName` ASC ");
 

// результат
echo json_encode([
  "showName" => $showName,
  "genre" => $genre,
  "actors" => $actors,
  "director" => $director,
  "id" => $id,
  "scoreShow" => $scoreShow,
  "poster" => $poster,
  "showCost"=> $showCost,
  "showInfo" => $showInfo,
]);
?>