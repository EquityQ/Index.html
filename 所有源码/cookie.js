var p = $.cookie("user");
if (p != undefined && p!= "default"){
    document.getElementById("lig").innerHTML = p;
}
else{
    document.getElementById("lig").innerHTML = '账号登录';
}
