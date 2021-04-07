<?php

require_once __DIR__ . "/../connect.php";

$qGenre = mysqli_query($connection, "SELECT * FROM $db_6 ORDER BY $db_6.`genre` ASC");

$result = [];
while($row = mysqli_fetch_assoc($qGenre))
{
  $result[] = [
    'id' => $row["id"],
    'genre' => $row["genre"]
  ];
}

// результат
echo json_encode(
  $result
);