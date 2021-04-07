<?php

require_once(__DIR__."/../../../src/.import/import.php");

$sql = "SELECT * FROM users";

$res = mysqli_query(Connection::_connection(),  Query::queryFindAllUsers());

$html='<table><tr><td>Id</td><td>Login</td><td>Email</td><td>Permissions</td></tr>';
while($row = mysqli_fetch_array($res))
{
    $html.='<tr><td>'.$row['id'].'</td><td>'.$row['nameUser'].'</td><td>'.$row['emailUser'].'</td><td>'.$row['permissionUser'].'</td></tr>';
}
$html.= '</table>'; 
header('Content-Type:application/xls');
header('Content-Disposition: attachment; filename=userList.xls');
echo $html;
?>