<?php
    $host = "localhost";
    $dbuser = "root";
    $dbpassword = "";
    $dbname = "online_theatre_ticket_office";
    $db_1 = "`admin`";
    $db_2 = "`modders`";
    $db_3 = "`shows`";
    $db_4 = "`ticket`";
    $db_5 = "`visitors`";
    $db_6 = "`genres`";
    $connection = mysqli_connect("$host", "$dbuser", "$dbpassword", "$dbname");
    
    if($connection == false)
{
    echo "Error!";
    echo mysqli_connect_error();
    exit();
}

?>