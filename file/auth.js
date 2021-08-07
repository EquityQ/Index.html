function whenclickauth(){
    var a = document.getElementById("acco").value;
    var b = document.getElementById("pass").value;
    if (a !="" || b !=""){
        var settings = {
"url": "https://alpha.map1e.vip/acc_pwd_auth.php?acc="+a+"&pwd="+b,
"method": "POST",
"timeout": 0,
};

$.ajax(settings).done(function (response) {
var json = response;
if (json.error == "wrong password"){
    alert("不正确的密码");
    document.getElementById("acco").value = "";
    document.getElementById("pass").value = "";
}
else if(json.success == "true"){
    document.getElementById("lig").innerHTML = json.name;
    $.cookie("user",json.name,{expires: 7,path:'/'})
    $.cookie("pass",json.pass,{expires: 7,path:'/'})
    $.cookie("group",json.group,{expires: 7,path:'/'})
    $.cookie("hwid",json.code,{expires: 7,path:'/'})
    location.reload();
}
});
    }
    else{alert("密码或账号不能为空。");}
}
var p = $.cookie("user");
if (p != undefined && p !="default"){
    document.getElementById("lig").innerHTML = p;
    document.getElementById("dc").style.display="none";
    document.getElementById("dc1").style.display="none";
    document.getElementById("dc2").style.display="none";
    document.getElementById("dc3").style.display="none";
    document.getElementById("dc5").innerHTML="尊敬的用户 "+p+"，欢迎回来。";
}
else{
    document.getElementById("lig").innerHTML = '账号登录';
    document.getElementById("dc").style.display="inline";
    document.getElementById("dc1").style.display="inline";
    document.getElementById("dc2").style.display="inline";
    document.getElementById("dc3").style.display="inline";
}

var o = $.cookie("group");
if (o != undefined && o !="default"){
document.getElementById("de1").style.opacity="1";
document.getElementById("de2").style.opacity="1";
document.getElementById("de3").style.opacity="1";
}
if (o == "Both"){
    document.getElementById("de1").innerHTML="权限组：Detail & DeathWish";
}
else if(o == "Detail"){
    document.getElementById("de1").innerHTML="权限组：Detail";
}
else if(o == "DeathWish"){
    document.getElementById("de1").innerHTML="权限组：DeathWish";
}
else if(o == "defalt"){
    document.getElementById("de1").innerHTML="权限组：Deafault";
}
else{
    document.getElementById("de1").innerHTML="权限组："+o;
}

var u = $.cookie("hwid");
if (u != undefined && u !="default"){
        document.getElementById("h1z").innerHTML="已登录";
        document.getElementById("h1c").innerHTML="查看您的账户信息";
        document.getElementById("de4").style.display="block";
        document.getElementById("pdd").style.display="inline";
        document.getElementById("ht1").style.display="block";
        document.getElementById("ht2").style.display="block";
        document.getElementById("ht3").style.display="block";
    if (u==""){
        document.getElementById("de2").innerHTML="硬件绑定：未绑定";
        if (o=="defalt"){document.getElementById("de3").innerHTML="订阅状态：未订阅";}
        else{document.getElementById("de3").innerHTML="订阅状态：未过期";}
    }
    else{
        document.getElementById("de2").innerHTML="硬件绑定："+u;
        document.getElementById("de3").innerHTML="订阅状态：未过期";
    }
}

function outacc(){
    $.cookie("user","default");
    $.cookie("pass","default");
    $.cookie("group","default");
    $.cookie("hwid","default");
    location.reload();
}