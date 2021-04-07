<?php
error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

$id = $_GET['id'];
$nickName = $_GET['NickName'];
$pass = $_GET['Pass'];
$permision = $_GET['Permision'];


echo json_encode([
  "id" => $id,
  "NickName" => $nickName,
  "Pass" => $pass,
  "Permision" => $permision
]);
?>