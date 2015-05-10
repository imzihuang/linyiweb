

/**
function send_vercode(){
    var usertype = $('#user_typ').val();
    if (usertype == 'UT001'){
        var to_mail = $('#h_email').val();
    }else if(usertype == 'UT002' || usertype == 'UT003'){
        var to_mail = $('#de_email').val();
    }else{
        return;
    }
    if (!regMail(to_mail)){
        alert('邮箱错误！')
        return;
    }
    $.ajax({
        type:'GET',
        url:'/send_vercode',
        data:{'typ':'e','email':to_mail},
        dataType:'json',
        async:'true',
        success:function(msg){
            alert(msg.message)
        }
    });
}
**/

function submit_info(){
    if (usertype == 'UT001'){
        //普通用户注册(户主)
        var email = $('#h_email').val();
        var username = $('#h_username').val();
        var password = $('#h_password').val();
        var second_pwd = $('#h_second_pwd').val();
    }else{
        return;
    }

    if (email=="" || username == "" || password == ""){
        alert("参数异常！");
    }
    if (password != second_pwd){
        alert('俩次密码不一致');
    }

    var userinfo = {'sEmail':email,'sName':username,'sPwd':password,'sNickName':nickname,'sMobile':mobile};
    alert(JSON.stringify(userinfo))
    $.ajax({
        type:'POST',
        url:'account/signin',
        data:{'userinfo':JSON.stringify(userinfo)},
        dataType:'json',
        async:'false',
        success:function(msg){
            alert(msg.message);
            if (msg.status == 1){
                location.href = '/';
            }
        }
    });
}


//验证邮箱
function regMail(str){
    var reg = /^([a-zA-Z\d][_\.a-zA-Z\d]*)@([a-zA-Z\d.]+)\.([a-z]{2,4})/;
    return reg.test(str);
}
