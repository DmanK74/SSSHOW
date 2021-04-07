<?php 

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

$name = $_GET["name"];
$pass = $_GET["pass"];


$query = "SELECT * FROM `visitors` WHERE NickName LIKE '$name'";

$res = mysqli_query($connection,$query);
$data = mysqli_fetch_array($res);

if(count($data) > 1){
	echo json_encode("account already exists");
}
else{
$sql0 = "SET FOREIGN_KEY_CHECKS = 0";
$query = "INSERT INTO visitors (id,NickName,Pass,Permision) VALUES (null,'$name','$pass',0)";
$sql1 = "SET FOREIGN_KEY_CHECKS = 1";

$result0 = $connection->query($sql0);
 $resultins = $connection->query($query);

$result1 = $connection->query($sql1);

if($resultins){ 
echo json_encode("true");
}
else{
echo json_encode("false");
}

}
?>