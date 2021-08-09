function whenclickauth(){
    var a = document.getElementById("acco").value;
    var b = document.getElementById("inv").value;
    if (a !="" && b !=""){
        var settings = {
"url": "https://alpha.map1e.vip/exchange.php?user="+a+"&inv="+b,
"method": "POST",
"timeout": 0,
};
$.ajax(settings).done(function (response) {
var json = response;
if (json.error == "empty"){
    alert("参数不能为空");
}
else if(json.error=="invite code is unkown or invite code was used"){
    alert("错误的礼物码或礼物码已被使用");
    document.getElementById("acco").value="";
    document.getElementById("inv").value="";

}else if(json.error=="user is in the same group"){
    alert("激活的用户已在此权限组或你输入的用户名不正确，礼包码使用失败");

}
else if(json.success == "true"){
    document.getElementById("dc5").innerHTML = "礼包码已激活";
alert("已成功提升 "+json.name+"用户的权限组至"+json.group+",礼包码："+json.invite+" 已被使用。");
document.getElementById("acco").value="";
document.getElementById("inv").value="";
}
});
    }
    else{alert("用户名或激活码不能为空。");}
}
