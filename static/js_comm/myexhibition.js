(function () {
    $.fn.myexhibition = function () {
        if (arguments[0].constructor == Object) {
            initgrid(this, arguments[0]);
            return;
        }
    }

    function initgrid(Obj, jsons) {
        //----------------------------------------------------设置展示框-------------------------------------------------
        var exhibitionDiv=$('<div></div>');        //创建一个父DIV

        exhibitionDiv.addClass('myexhibition');    //添加CSS样式
        initcss(exhibitionDiv,jsons);  //设置展示框CSS
        initcontent(exhibitionDiv,jsons);  //设置展示框内容
        //------------------------------------------------------end-------------------------------------------------------

        exhibitionDiv.appendTo(Obj);  //添加展示框

        initevent(exhibitionDiv);
    }

    //样式 CSS
    function initcss(exhibition,jsons){
        if(jsons.left!=null){
            exhibition.css('left', jsons.left);
        }
        if(jsons.top!=null){
            exhibition.css('top', jsons.top);
        }
    }

    //内容
    function initcontent(exhibition,jsons){
        var data = jsons.data; //获取数据内容
        if (data == null){
            return;
        }
        for(var i=0;i<data.length;i++){
            var sub = data[i];
            var panel = $('<div class="panel panel-default" style="margin-bottom: 1px;"></div>');
            var panel_head = $('<div class="panel-heading" style="cursor: pointer;">'+sub.sName+'</div>');

            var panel_content = $('<div class="tb_exhibition"></div>');
            var panel_table = $('<table class="table" style="margin-bottom: 5px;"></table>')
            if (jsons.table_font_size!=null){
                panel_table.css('font-size', jsons.table_font_size);
            }
            if (sub.subdata!=null){
                var content = '<tbody>';
                for(var j=0;j<sub.subdata.length;j+=4){
                    var tr='<tr>';
                    for(var m=0;m<4;m++){
                        if (j+m<sub.subdata.length) {
                            tr+='<td><a href="'+sub.subdata[j+m]["sCode"]+'" >'+sub.subdata[j+m]["sName"]+'</a></td>';
                        }else{
                            tr+='<td></td>'
                        }
                     }
                    tr+='</tr>';
                    content+=tr;
                }
                content += '</tbody>';
                panel_table.html(content);
            }

            if (sub.sCode == jsons.shownode){
                panel_content.addClass('tb_show');
            }

            panel_head.appendTo(panel);
            panel_table.appendTo(panel_content);
            panel_content.appendTo(panel);
            panel.appendTo(exhibition);


        }
    }

    function initevent(exhibitionDiv){
        exhibitionDiv.find('.panel-heading').each(function(){
             $(this).click(function(){
                if ($(this).next().hasClass('tb_show')){
                    $(this).next().removeClass('tb_show');
                }else{
                    $(this).next().addClass('tb_show');
                }
            });
        });
    }
})();


