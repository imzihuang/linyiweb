
$(function(){
    $('#shop_id').my_shop_list({
        url:'/shop/shoplist',
        page:1,
        rows:20,
        //params:{"code":"124"},
        title:'我的店铺',
        columns:{"img":"sLoge_Url","code":"sCode","name":"sName","describe":"sName","addr":"sAddress","phone":"sTelephone"},
        shop_click:function(key){
            alert(key);
        }
    });
});