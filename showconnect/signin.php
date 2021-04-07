<?php 

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");

$name = $_GET["name"];
$pass = $_GET["pass"];

$query = mysqli_query($connection,"SELECT id, Permision FROM visitors WHERE NickName = '$name' and Pass = '$pass'");

$data = mysqli_fetch_array($result);


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

// if(count($result) > 0){
// 	// pass match
	
// 	echo json_encode("COOL");
// }
// else{
// 	echo json_encode("error");
// }
?>