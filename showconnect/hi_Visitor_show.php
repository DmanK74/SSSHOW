<?php
error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

$tiketId = $_GET['TiketId'];
$showName = $_GET['showName'];
$showCost = $_GET['ShowCost'];

echo json_encode([
  "TiketId" => $tiketId,
  "showName" => $showName,
  "showCost" => $showCost
]);
?>