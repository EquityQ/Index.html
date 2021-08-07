<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['inv'];
$pwd = $_GET['user'];


if (empty($acc) and empty($pwd)){
    echo '{"error" : "empty"}';
}elseif (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}
else{
    $conn = new mysqli($servername, $username, $password,$database);
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 
    $sql = 'select * from invite where invcode = "'.$acc.'" and name = ""';
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $conn->close();
            $cot = new mysqli($servername, $username, $password,$database);
            if ($cot->connect_error) {
                die("连接失败: " . $cot->connect_error);
            } 
            $sent = 'update invite set name = "'.$pwd.'" where invcode = "'.$acc.'"';
            $cot->query($sent);
            if ($cot->affected_rows >0){
            }else{
                echo '{"error" : "unknown error"}';
            }
            $cot->close();
            $cots = new mysqli($servername, $username, $password,$database);
            if ($cots->connect_error) {
                die("连接失败: " . $cots->connect_error);
            } 
            $sents = 'update acc set vip = "'.$row["vip"].'" where name = "'.$pwd.'"';
            $cots->query($sents);
            if ($cots->affected_rows >0){
                echo '{"success":"true", "name":"'.$pwd.'","invite":'.'"'.$acc.'","group":"'.$row["vip"].'"}';
            }else{
                echo '{"error" : "user is in the same group"}';
            $cota = new mysqli($servername, $username, $password,$database);
            if ($cota->connect_error) {
                die("连接失败: " . $cota->connect_error);
            } 
            $sentf = 'update invite set name = "" where invcode = "'.$acc.'"';
            $cota->query($sentf);
            $cota->close();
            }
            $cots->close();
        }
    } else {
        echo '{"error" : "invite code is unkown or invite code was used"}';
        $conn->close();
    }
}
?> 