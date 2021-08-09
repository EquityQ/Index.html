function whenclickauth(){
    var a = document.getElementById("acco").value;
    var b = document.getElementById("pass").value;
    var c = document.getElementById("mail").value;
    if (a !="" && b !="" && c !=""){
        var settings = {
"url": "https://alpha.map1e.vip/resethwid.php?acc="+a+"&pwd="+c+"&user="+b,
"method": "POST",
"timeout": 0,
};
$.ajax(settings).done(function (response) {
var json = response;
if (json.error == "empty"){
    alert("参数不能为空");
}
else if(json.error=="password not true"){
    alert("密码不正确");

}
else if(json.error=="not admin"){
    alert("你不是管理员，请离开管理页面");
    window.setTimeout("window.location='https://alpha.map1e.vip'",1000);

}
else if(json.error=="user is null or hwid is null"){
    alert("用户不存在或用户的HWID尚未绑定");

}else if(json.success == "true"){
    alert("用户："+json.name+" 的HWID已被重置");
    document.getElementById("pass").value = "";
    
}
});
    }
    else{alert("密码、账号、用户ID不能为空。");}
}
