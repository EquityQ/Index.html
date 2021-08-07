function whenclickauth(){
    var a = document.getElementById("acco").value;
    var b = document.getElementById("pass").value;
    var c = document.getElementById("vas").value;
    if (a !="" && b !=""){
        var settings = {
"url": "https://alpha.map1e.vip/admin.php?acc="+a+"&pwd="+b+"&grp="+c,
"method": "POST",
"timeout": 0,
};
$.ajax(settings).done(function (response) {
var json = response;
if (json.error == "empty"){
    alert("参数不能为空");
}
else if(json.error=="wrong password"){
    alert("密码错误");
    document.getElementById("acco").value = "";
    document.getElementById("pass").value = "";

}else if(json.error=="not admin"){
    alert("你不是管理员，请立刻离开此界面");
    document.getElementById("acco").value = "";
    document.getElementById("pass").value = "";
    window.setTimeout("window.location='https://alpha.map1e.vip/auth.html'",3000);
}else if (json.error=="unknown error"){
    window.setTimeout("window.location='https://alpha.map1e.vip/auth.html'",1000);
}
else if(json.success == "true"){
    document.getElementById("dc5").innerHTML = "尊敬的管理员 "+a+",邀请码已生成。";
    document.getElementById("de2").style.opacity="1";
    document.getElementById("de2").innerHTML="邀请码："+json.invite;
    document.getElementById("de1").style.opacity="1";
    document.getElementById("de1").innerHTML="给予权限："+json.group;
    document.getElementById("dc").style.display="none";
    document.getElementById("dc1").style.display="none";
    document.getElementById("dc2").style.display="none";
    document.getElementById("dc3").style.display="none";
}
});
    }
    else{alert("密码或账号不能为空。");}
}
