<?php 

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

$name = $_GET["name"];
$pass = $_GET["pass"];
$query = mysqli_query($connection, "SELECT id, Permision FROM visitors WHERE NickName = '$name' and Pass = '$pass' and Permision = 1");


$result;
while($row = mysqli_fetch_assoc($query))
{
$result = [
  'id' => $row["id"],
  'Permision' => $row["Permision"]
];
}

// результат
echo json_encode(
$result
);

// $data = mysqli_fetch_array($result);

// if(count($data) > 0){
// 	// pass match
	
// 	echo json_encode(['id'=> $data['id']]);
// }
// else{
// 	echo json_encode("error");
// }
?>