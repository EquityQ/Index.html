function whenclickauth(){
    var a = document.getElementById("acco").value;
    var b = document.getElementById("pass").value;
    var c = document.getElementById("mail").value;
    if (a !="" && b !="" && c !=""){
        var settings = {
"url": "https://alpha.map1e.vip/forgot_pwd.php?acc="+a+"&newpwd="+b+"&email="+c,
"method": "POST",
"timeout": 0,
};
$.ajax(settings).done(function (response) {
var json = response;
if (json.error == "empty"){
    alert("参数不能为空");
}
else if(json.error=="wrong email or acc or newpass is old pass"){
    alert("账号和邮箱不一致或新密码与旧密码相同");

}else if(json.success == "true"){
    document.getElementById("dc5").innerHTML = "尊敬的用户 "+a+",密码已重置。";
    $.cookie("user","default");
    $.cookie("pass","default");
    $.cookie("group","default");
    $.cookie("hwid","default");
    document.getElementById("de2").style.opacity="1";
    document.getElementById("de2").innerHTML="5秒后自动跳转至登录界面";
    document.getElementById("dc").style.display="none";
    document.getElementById("dc1").style.display="none";
    document.getElementById("dc2").style.display="none";
    document.getElementById("dc3").style.display="none";
    window.setTimeout("window.location='https://alpha.map1e.vip/auth.html'",5000);
}
});
    }
    else{alert("密码或账号不能为空。");}
}
