(function () {
    $.fn.my_shop_list = function () {
        if (arguments[0].constructor == Object) {
            arg = arguments[0];
            init_grid(this, arg);
            return;
        }
    }

    //初始化参数属性
    function init_arg(this_obj,arg) {
        if (arg.page == null) {
            arg.page = 1;
        }
        if (arg.rows == null) {
            arg.rows = 1000;
        }
        if (arg.title == null) {
            arg.title = "我的标题";
        }
        if (arg.url != null) {
            params = arg.params;
            if (params == null){
                params = {}
            }
            params.page = arg.page;
            params.rows = arg.rows;
            $.ajax({
                url: arg.url,
                type: "GET",
                data: params,
                dataType: "json",
                async: false,
                success: function (msg) {
                    arg.data = msg;
                }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("获取数据异常！");
                }
            });
        }
        if (arg.data == null || arg.data == "") {
            arg.data = { total: 0, rows: [] };
        }
    }


    function init_grid(this_obj, arg) {
        init_arg(this,arg);
        //----------------------------------------------------显示内容-------------------------------------------------
        var shop_div=$('<div class="product-bx"></div>');        //创建一个父DIV
        var current_page = arg.page;
        var current_rows = arg.rows;
        var total = arg.data.total;
        var data = arg.data.data;
        var columns = arg.columns;
        init_view(shop_div,data,current_page,columns);
        init_page(shop_div,total,current_page,current_rows);
        this_obj.empty();
        this_obj.append(shop_div);
        //------------------------------------------------------end-------------------------------------------------------

        init_event(this_obj,arg);
    }

    /*
    初始化店铺信息
    shop_div:内容容器
    data:店铺信息
    page:页数
    columns:列名(显示)设置
    */
    function init_view(shop_div,data,page,columns){
        var shop_ul = $('<ul class="product-grid"></ul>');

        //var shop_info_li = $('<li></li>');
        for(var i=0;i<data.length;i++){
            info = data[i];
            var shop_info_li = $('<li></li>');
            content = '<a href="javascript:void(0);" class="product-thumb">';
            content += '<div class="product-img"><img src=' + info[columns.img] +' height="122" width="182" alt="商品图片"></div>';
            content += '</a>';

            content += '<div class="product-shop">';
            content += '<a href="javascript:void(0);">'+ info[columns.name] +'</a>';
            content += '<input class="hidden_key" type="hidden" value="'+ info[columns.code]+'">';
            content += '</div>';

            content += '<div class="product-tit"><a href="javascript:void(0);">'+ info[columns.describe] +'</a></div>';
            content += '<div class="shop-addr"><span class="iconfont">&#xe6ab;</span>'+ info[columns.addr] +'</div>';
            content += '<div class="shop-phone"><span class="iconfont">&#xe6bb;</span>'+ info[columns.phone] +'</div>';
            shop_info_li.html(content);
            shop_ul.append(shop_info_li);
        }
        shop_div.append(shop_ul);
    }

    /*
    初始化分页
    shop_div:内容容器
    total:店铺总数量
    page:页数
    rows:一页显示的数量
    */
    function init_page(shop_div,total,page,rows){
        var page_div = $('<div class="play_list_pg"></div>');
        var total_page = parseInt(total/rows); //总页数
        if(total>0 && total%rows>0){
            total_page++;
        }
        if(total_page<=10){
            for(var i=0;i<total_page;i++){
                var a = $('<a href="javascript:void(0);" class="btn_pg_num"></a>');
                a.html(i+1);
                if (page == i+1){
                    a.addClass('on');
                }
                page_div.append(a);
            }
        }else{
            if(total_page-page>=9){
                //带缩略显示
                if(page<5){
                    for(var i=0;i<8;i++){
                        var a = $('<a href="javascript:void(0);" class="btn_pg_num"></a>');
                        a.html(i+1);
                        if (page == i+1){
                            a.addClass('on');
                        }
                        page_div.append(a);
                    }
                }else{
                    for(var i=page-2;i<page+6;i++){
                        var a = $('<a href="javascript:void(0);" class="btn_pg_num"></a>');
                        a.html(i+1);
                        if (page == i+1){
                            a.addClass('on');
                        }
                        page_div.append(a);
                    }
                }
                var span = $('<span class="pg_dot">...</span>');
                page_div.append(span);
                var a = $('<a href="javascript:void(0);" class="btn_pg_num">'+(total_page-1)+'</a>');
                page_div.append(a);
                var a = $('<a href="javascript:void(0);" class="btn_pg_num">'+total_page+'</a>');
                page_div.append(a);
            }else{
                for(var i=total_page-10;i<total_page;i++){
                    var a = $('<a href="javascript:void(0);" class="btn_pg_num"></a>');
                    a.html(i+1);
                    if (page == i+1){
                        a.addClass('on');
                    }
                    page_div.append(a);
                }
            }
        }
        first_a = $('<a href="javascript:void(0);" class="btn_first">第一页</a>');
        pre_a = $('<a href="javascript:void(0);" class="btn_pre">上一页</a>');
        next_a = $('<a href="javascript:void(0);" class="btn_nxt">下一页</a>');
        page_div.prepend(pre_a);
        page_div.prepend(first_a);
        page_div.append(next_a);
        shop_div.append(page_div);
    }

    /*
    初始化事件
    this_obj:当前容器
    arg:当前参数
    */
    function init_event(this_obj,arg){
        $('.product-shop').click(function(){
            init_shop_click_event($(this),arg);
        });

        $('.btn_pg_num').click(function(){
            init_page_a_event($(this),this_obj,arg);
        });
        $('.btn_first').click(function(){
            init_page_first_event(this_obj,arg);
        });
        $('.btn_pre').click(function(){
            init_page_pre_event(this_obj,arg);
        });
        $('.btn_nxt').click(function(){
            init_page_next_event(this_obj,arg);
        });
    }

    /*
    设置店铺名称单击事件
    */
    function init_shop_click_event(obj,arg){
        key_obj = obj.find('.hidden_key');
        key = key_obj.val();
        if (arg.shop_click == null){
            return;
        }
        arg.shop_click(key);
    }

    /*
    页面a标签事件
    this_obj:当前容器
    arg:当前参数
    */
    function init_page_a_event(obj,this_obj,arg){
        if (obj.hasClass('on')){
            return;
        }
        arg.page=parseInt(obj.html());
        init_grid(this_obj,arg);
    }

    function init_page_first_event(this_obj,arg){
        obj = this_obj.find('.on');
        page = parseInt(obj.html());
        if (page == 1){
            return;
        }
        arg.page = 1;
        init_grid(this_obj,arg);
    }

    function init_page_pre_event(this_obj,arg){
        obj = this_obj.find('.on');
        page = parseInt(obj.html());
        if (page == 1){
            return;
        }
        arg.page=page-1;
        init_grid(this_obj,arg);
    }

    function init_page_next_event(this_obj,arg){
        var rows = arg.rows;
        var total = arg.data.total;
        var total_page = parseInt(total/rows); //总页数
        if(total>0 && total%rows>0){
            total_page++;
        }
        obj = this_obj.find('.on');
        page = parseInt(obj.html());
        if (page == total_page){
            return;
        }
        arg.page=page+1;
        init_grid(this_obj,arg);
    }
})();


