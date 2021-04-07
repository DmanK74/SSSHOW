<?php
require_once __DIR__ . "/../connect.php";

$id = $_GET['id'];

$qvisitors = mysqli_query($connection, "SELECT NickName FROM visitors WHERE id = '$id'");

$result;
while($row = mysqli_fetch_assoc($qvisitors))
{
$result = [
'id' => $row["id"],
'NickName' => $row["NickName"],
'Pass' => $row["Pass"],
'Permision' => $row["Permision"]
];
}

// результат
echo json_encode(
$result
);
?>