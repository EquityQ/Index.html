<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['acc'];
$pwd = $_GET['pwd'];
$mail = $_GET['user'];


if (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}
elseif (empty($mail)){
    echo '{"error" : "empty"}';
}
else{
    if ($acc =="青衣茗月" or $acc =="DeathWish"){
    $conn = new mysqli($servername, $username, $password,$database);
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 
    $sql = 'select * from acc where name = "'.$acc.'" and password = "'.$pwd.'"';
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
            $conn->close();
            $cot = new mysqli($servername, $username, $password,$database);
            if ($cot->connect_error) {
                die("连接失败: " . $cot->connect_error);
            } 
            $sent = 'update acc set `code`="" where name ="'.$mail.'"';
            $cot->query($sent);
            if ($cot->affected_rows >0){
                echo '{"success":"true", "name":"'.$mail.'","hwid":"reset"}';
            }else{
                echo '{"error" : "user is null or hwid is null"}';
            }
            $cot->close();
    } else {
        $conn->close();
        echo '{"error" : "password not true"}';
    }
    }else{
        echo '{"error" : "not admin"}';
    }
}
?> 