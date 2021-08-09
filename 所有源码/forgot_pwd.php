<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['acc'];
$mai = $_GET['email'];
$pwd = $_GET['newpwd'];
if (empty($acc) and empty($pwd) and empty($mai)){
    echo '{"error" : "empty"}';
}elseif (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}
elseif (empty(mai)){
    echo '{"error" : "empty"}';
}
elseif ($acc =="青衣茗月" or $acc=="DeathWish"){
    echo '{"error" : "empty"}';
}else{
    $conn = new mysqli($servername, $username, $password,$database);
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 
    $sql = 'update acc set `password` ="'.$pwd.'" where name ="'.$acc.'" and email = "'.$mai.'"';
    $conn->query($sql);
    if ($conn->affected_rows >0){
        echo '{"success":"true", "password":"changed","name":'.'"'.$acc.'"}';
    }else{
        echo '{"error" : "wrong email or acc or newpass is old pass"}';
    }
}
?> 