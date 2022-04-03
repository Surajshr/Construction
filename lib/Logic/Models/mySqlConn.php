<?php
$dbConn = mysqli_connect(
    'localhost:3308',
    'root',
    '',
    'constructionDb');
if(!$dbConn) {
    die("Database is not Connected". mysqli_connect_error());
}
else
    echo "connected to ConnectionDB";

?>