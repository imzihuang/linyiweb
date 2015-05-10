
function login(){
    var username=$("#txt_username").val();
    var pwd=$("#txt_pwd").val();
    if (username=='' || pwd==''){
        return false;
    }
    $.ajax({
        type:'POST',
        url:'/account/login',
        data:{'username':username,'pwd':pwd},
        dataType:'json',
        async:'true',
        success:function(msg){
            if (msg.status==0){
                alert(msg.message);
                return false;
            }
            location.reload();
        }
    });
}

function logout(){
    var username = $('#a_username').html();
    if (username == ''){
        return;
    }
    $.ajax({
        type:'POST',
        url:'/account/logout',
        data:{'username':username},
        dataType:'json',
        async:'false',
        success:function(msg){
            if (msg.status==0){
                alert(msg.message);
                return;
            }
            location.reload();
        }
    });
}