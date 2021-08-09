<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['acc'];
$pwd = $_GET['pwd'];
$gp = $_GET['grp'];

function GetRandStr($length){
    $str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $len = strlen($str)-1;
    $randstr = '';
    for ($i=0;$i<$length;$i++) {
     $num=mt_rand(0,$len);
     $randstr .= $str[$num];
    }
    return $randstr;
}

if (empty($acc) and empty($pwd)){
    echo '{"error" : "empty"}';
}elseif (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}
elseif (empty($gp)){
    echo '{"error" : "empty"}';
}else{
    $conn = new mysqli($servername, $username, $password,$database);
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 
    $sql = 'select * from acc where name = "'.$acc.'" and password = "'.$pwd.'"';
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            if ($row["name"]=="青衣茗月" or $row["name"]=="DeathWish"){
            $conn->close();
            $cot = new mysqli($servername, $username, $password,$database);
            if ($cot->connect_error) {
                die("连接失败: " . $cot->connect_error);
            } 
            $inv = GetRandStr(21);
            $sent = 'insert into invite (`name`,`invcode`,`admin`,`vip`) values ("","'.$inv.'","'.$acc.'","'.$gp.'")';
            $cot->query($sent);
            if ($cot->affected_rows >0){
                echo '{"success":"true", "group":"'.$gp.'","invite":'.'"'.$inv.'"}';
            }else{
                echo '{"error" : "unknown error"}';
            }
            $cot->close();
            }
            else {
                echo '{"error" : "not admin"}';
                $conn->close();
            }
        }
    } else {
        echo '{"error" : "wrong password"}';
        $conn->close();
    }
}
?> 