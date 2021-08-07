<?php
header('Content-Type:application/json; charset=utf-8');
$servername = "localhost";
$username = "account";
$password = "password";
$database = "account";
$acc = $_GET['acc'];
$pwd = $_GET['pwd'];
if (empty($acc) and empty($pwd)){
    echo '{"error" : "empty"}';
}elseif (empty($acc)) {
    echo '{"error" : "empty"}';
}elseif (empty($pwd)) {
    echo '{"error" : "empty"}';
}else{
    $conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
} 
    $sql = 'select * from acc where (name = "'.$acc.'" or email = "'.$acc.'") and password = "'.$pwd.'"';
    $result = $conn->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
            echo '{"success":"true", "name":'.'"'.$row["name"].'"'.', "group":'.'"'.$row["vip"].'","code":"'.$row["code"].'","pass":"'.$row["password"].'"}';
        }
    } else {
        echo '{"error" : "wrong password"}';
    }
    $conn->close();
}
?> 