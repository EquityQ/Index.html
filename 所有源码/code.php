<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['acc'];
$pwd = $_GET['pwd'];
$cod = $_GET['cod'];
if (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}elseif (empty($cod)){
    echo '{"error" : "empty"}';
}else{
    $conn = new mysqli($servername, $username, $password,$database);
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    } 
    $sql = 'select * from acc where (name = "'.$acc.'" or email = "'.$acc.'") and password = "'.$pwd.'"';
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            if ($row["code"]==""){
                $coon = new mysqli($servername, $username, $password,$database);
                $sql_s = 'update acc set code = "'.$cod.'" where name ="'.$acc.'" or email = "'.$acc.'"';
                $res = $coon->query($sql_s);
                if ($res->num_rows > 0) {
                    while($ro = $res->fetch_assoc()) {
                    }
                }
                echo '{"success":"code had been changed"}';
                $coon->close(); 
            }
            else{
                if ($row["code"]==$cod){
                    echo '{"success":"true"}';
                }
                else{
                    echo '{"error":"wrong code"}';
                }
            }
        }
    } else {
        echo '{"error" : "wrong password"}';
    }
    $conn->close();
}
?> 