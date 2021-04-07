<?php

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

 $genre = $_GET['genre'];

$qgenres = mysqli_query($connection, 
"INSERT INTO genres (id, genre) VALUES (NULL, '$genre')");
$qgenres = mysqli_query($connection,
"SELECT * FROM genres WHERE id ORDER BY id DESC LIMIT 1");

$result;
while($row = mysqli_fetch_assoc($qgenres))
{
$result = [
  'id' => $row["id"],
  'genre' => $row["genre"]
];
}

// результат
echo json_encode(
$result
);
?>