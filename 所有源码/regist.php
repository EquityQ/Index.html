<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['acc'];
$pwd = $_GET['pwd'];
$mail = $_GET['email'];
$gp = "defalt";


if (empty($acc) and empty($pwd)){
    echo '{"error" : "empty"}';
}elseif (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}
elseif (empty($mail)){
    echo '{"error" : "empty"}';
}
elseif(strlen($acc) < 6){
    echo '{"error" : "acc too short"}';
}
elseif(strlen($pwd) < 6){
    echo '{"error" : "pwd too short"}';
}
else{
    $conn = new mysqli($servername, $username, $password,$database);
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 
    $sql = 'select * from acc where name = "'.$acc.'"';
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        echo '{"error" : "same username"}';
            $conn->close();
    } else {
        $conn->close();
            $cot = new mysqli($servername, $username, $password,$database);
            if ($cot->connect_error) {
                die("连接失败: " . $cot->connect_error);
            } 
            $sent = 'insert into acc (`name`,`email`,`password`,`vip`,`code`) values ("'.$acc.'","'.$mail.'","'.$pwd.'","'.$gp.'","")';
            $cot->query($sent);
            if ($cot->affected_rows >0){
                echo '{"success":"true", "name":"'.$acc.'","password":'.'"'.$pwd.'","group":"'.$gp.'","code":""}';
            }else{
                echo '{"error" : "unknown error"}';
            }
            $cot->close();
    }
}
?> 