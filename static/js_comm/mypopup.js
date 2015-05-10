(function () {
    $.fn.mypopup = function () {
        if (arguments[0].constructor == Object) {
            initgrid(this, arguments[0]);
            //this.MyGrid.rowData[$(this)[0].id] = arguments[0];
            return;
        }

        //if (arguments[0].constructor == String) {
        //    if ($(this) == null || $(this)[0].id == null) return null;
        //    var rowData = this.MyGrid.methods[arguments[0]];
        //    return rowData(this.MyGrid.rowData[$(this)[0].id]);
        //}
    }

    function init_params(jsons){
        if(jsons.link == null){
            jsons.link = 'sCode';
        }
        if(jsons.display == null){
            jsons.display = 'sName';
        }
    }

    function initgrid(Obj, jsons) {
        init_params(jsons);

        //----------------------------------------------------设置弹出框-------------------------------------------------
        var popupDiv=$('<div></div>');        //创建一个父DIV

        popupDiv.addClass('mypopup');    //添加CSS样式
        popupDiv.addClass('panel');
        popupDiv.addClass('panel-info');
        initcss(popupDiv,jsons);  //设置弹出框CSS
        initcontent(popupDiv,jsons);  //设置弹出框内容
        //------------------------------------------------------end-------------------------------------------------------

        popupDiv.appendTo(Obj.parent());  //添加弹出框

        initevent(Obj,popupDiv,jsons);//初始化事件
    }

    //样式 CSS
    function initcss(popup,jsons){
        if(jsons.left!=null){
            popup.css('left', jsons.left);
        }
        if(jsons.top!=null){
            popup.css('top', jsons.top);
        }
    }

    //内容
    function initcontent(popup,jsons){
        var data = jsons.data; //获取要弹出的数据内容
        if (data == null){
            return;
        }
        var content = '<ul class="list-group">';
        for(var i=0;i<data.length;i++){
            var sub = data[i];
            content += '<li class="list-group-item">';
            content += '<div class="row">';
            content += '<div class="col-md-2">'+ sub.sName +'</div>';
            content += '<div class="col-md-10">';
            if (sub.subdata != null){
                for(var j=0;j<sub.subdata.length;j++){
                    content += '<a href="'+sub.subdata[j][jsons.link]+'" style="padding:5px;">' + sub.subdata[j][jsons.display] + '</a>'
                }
            }
            content += '</div>';
            content += '</div>';
            content += '</li>';
        }
        content += '</ul>';
        popup.html(content);
    }

    /*
    初始化事件
    Obj:当前对象
    popup:弹出框
    jsons:数据
    */
    function initevent(Obj, popup, jsons){
        touchObj = jsons.touchObj;
        if (touchObj == null){
            touchObj = Obj;
        }
        touchObj.hover(function(){
            var cl = $(this).attr('class');
            $(".mypopup").removeClass('show');
            popup.addClass('show');
        },function(){
            //var cl = $(this).attr('class');
            //var divThis = $(".mypopup."+cl);
            setTimeout(function() {
                if (!popup.hasClass("to_div")) {//说明没有从按钮进入div
                    popup.removeClass('show');
                }
            }, 100);
        });
        popup.hover(function(){
            $(this).addClass('to_div');
        },function(){
            $(this).removeClass('show');
            $(this).removeClass('to_div');
        });
    }
})();


