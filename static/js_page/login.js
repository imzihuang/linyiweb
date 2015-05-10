
function login(){
    var username=$("#txt_username").val();
    var pwd=$("#txt_pwd").val();
    if (username=='' || pwd==''){
        return;
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
                return;
            }
            if (msg.status == 1){
                location.href = '/';
            }
        }
    });
}