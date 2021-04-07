<?php
// аргумента запроса

$id = $_GET['id'];
$genre = $_GET['genre'];


 $qGenre = mysqli_query($connection, "SELECT * FROM $db_6 ORDER BY $db_6.`genre` ASC ");
 

// результат
echo json_encode([
  "id" => $id,
  "genre" => $genre

]);