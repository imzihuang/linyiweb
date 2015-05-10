
$(function(){
    $('#shop_id').my_shop_list({
        url:'shop.json',
        page:20,
        rows:20,
        params:{"code":"124"},
        title:'我的店铺',
        columns:{"img":"logourl","code":"sCode","name":"sName","describe":"sDescribe","addr":"sAddress","phone":"sTelephone"},
        shop_click:function(key){
            alert(key);
        }
    });
});