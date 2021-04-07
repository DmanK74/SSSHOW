<?php 

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");


$id = $_GET["id"];

$query = "SELECT id = $id FROM visitors WHERE NickName and Pass";
$resultins = mysqli_query($connection,$query);
$data = mysqli_fetch_array($resultins);

$result = [];
while($row = mysqli_fetch_assoc($query))
{
  $result[] = [
    'NickName' => $row["NickName"], 
    'id' => $row["id"],
  ];
}

// результат
echo json_encode(
  $result
);

// if(count($data) > 0){
// 	// pass match
	
// 	echo json_encode(['NickName'=> $data[1]['NickName']]);
// }
// else{
// 	echo json_encode("error");
// }
?>