<?php
require "mySqlConn.php";
$firstname =$_POST[''];
$lastName =$_POST[''];
$email = $_POST[''];
$password =$_POST[''];

$query = "insert into registereduser(FirstName,LastName,Email,Password) values('$firstname,$lastName,$email,$password')";

if (isset($dbConn)) {
    $dbConn->Query($query);
}
echo "Data Registered";
