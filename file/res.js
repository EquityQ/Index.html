function whenclickauth(){
    var a = document.getElementById("acco").value;
    var b = document.getElementById("pass").value;
    var c = document.getElementById("mail").value;
    if (a !="" && b !="" && c !=""){
        var settings = {
"url": "https://alpha.map1e.vip/regist.php?acc="+a+"&pwd="+b+"&email="+c,
"method": "POST",
"timeout": 0,
};
$.ajax(settings).done(function (response) {
var json = response;
if (json.error == "empty"){
    alert("参数不能为空");
}
else if(json.error=="acc too short"){
    alert("账号过短");

}
else if(json.error=="pwd too short"){
    alert("密码过短");

}
else if(json.error=="same username"){
    alert("检索到用户名重复,请更改");

}else if(json.success == "true"){
alert("注册成功 用户名："+a+" 密码："+b+" 邮箱："+c+" 请妥善保管账号与密码，请勿将账号/密码/邮箱泄露给他人，避免造成不必要的损失，5秒后将自动跳转登录界面。");
    window.setTimeout("window.location='https://alpha.map1e.vip/auth.html'",5000);
}
});
    }
    else{alert("密码或账号不能为空。");}
}
