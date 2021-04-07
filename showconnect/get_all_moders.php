
<?php 

error_reporting(E_ERROR | E_PARSE);
require_once("connect.php");


$query = mysqli_query($connection,"SELECT id, NickName  FROM visitors WHERE Permision = 2");

//$data = mysqli_fetch_array($result);

$result = array();

while($row = mysqli_fetch_assoc($query))
{
$result[] = [
  'id' => $row["id"],  
  'NickName' => $row["NickName"],

];
}
// результат
echo json_encode(
$result
);

?>