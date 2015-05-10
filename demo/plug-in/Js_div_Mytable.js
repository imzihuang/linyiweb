/*create by lzh 2012.1016*/
(function () {
    $.fn.MyGrid = function () {
        if (arguments[0].constructor == Object) {
            initgrid(this, arguments[0]);
            this.MyGrid.rowData[$(this)[0].id] = arguments[0];
            return;
        }

        if (arguments[0].constructor == String) {
            if ($(this) == null || $(this)[0].id == null) return null;
            var rowData = this.MyGrid.methods[arguments[0]];

            return rowData(this.MyGrid.rowData[$(this)[0].id]);
        }
    }

    $.fn.MyGrid.methods = {
        getValue: function (obj) {
            if (obj != null && obj.json_data != null) {
                return obj.json_data.rows;
            }
            return [];
        }, getSelected: function (obj) {
            if (obj != null && obj.current_select != null) {
                return obj.current_select;
            }
            return [];
        }, removeAll: function (obj) {
            if (obj != null) {
                obj.json_data = null;
            }
            return null;
        }
    };
    $.fn.MyGrid.rowData = {
        Data: []
    }

    /*
    设置初始值
    */
    function initMyGrid(Obj, jsons) {
        if (jsons.left == null) {
            jsons.left = 0;
        }
        if (jsons.width == null) {
            jsons.width = 0;
        }
        if (jsons.height == null) {
            jsons.height = 0;
        }
        if (jsons.top == null) {
            jsons.top = 0;
        }
        if (jsons.nopage == null) {
            jsons.nopage = false;
        }
        if (jsons.selected == null) {
            jsons.selected = false;
        }
        if (jsons.firstselected = null) {
            jsons.firstselected = true;
        }
        if (jsons.page == null) {
            jsons.page = 1;
        }

        if (jsons.rows == null) {
            jsons.rows = 1000;
        }
        if (jsons.title == null) {
            jsons.title = "我的标题";
        }
        if (jsons.td_height == null) {
            jsons.td_height = 25;
        }
        if (jsons.align_x == null) {
            jsons.align_x = false;
        }
        if (jsons.url != null) {
            $.ajax({
                url: jsons.url,
                type: "post",
                data: jsons.data + "&page=" + jsons.page + "&rows=" + jsons.rows,
                dataType: "json",
                async: false,
                success: function (msg) {
                    jsons.json_data = msg;
                }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("获取数据异常！");
                }
            });
        }
        if (jsons.json_data == null || jsons.json_data == "") {
            jsons.json_data = { total: 0, rows: [] };
        }
        if (jsons.width != 0) {
            Obj.css('width', jsons.width + 2);
        }
        if (jsons.height != 0) {
            Obj.css('height', jsons.height);
        }
        Obj.css('top', jsons.top);
        Obj.css('left', jsons.left);
        Obj.css('position', 'relative');
    }

    function initgrid(Obj, jsons) {
        initMyGrid(Obj, jsons);
        var table_height = jsons.height - 45;
        if (jsons.nopage) {
            table_height = jsons.height - 2;
        }
        var grid = "";
        //----------------------------------------------------设置表格内容-------------------------------------------------

        grid += '<div id="content' + Obj[0].id + '" class="table-date-list" style="height:' + table_height + 'px; overflow:auto;">';
        grid += set_table_content(Obj, jsons);
        grid += '</div>';
        //------------------------------------------------------end-------------------------------------------------------

        //----------------------------------------------------设置分页-----------------------------------------------------
        if (jsons.nopage == false) {
            grid += '<div class="pages clearfix" style="height:40px;">';
            grid += set_table_paging(Obj, jsons);
            grid += '</div>';
        }
        //------------------------------------------------------end-------------------------------------------------------

        //设置等待提示页面-------------------------------------------------------------------------------------------------
        grid += '<div id="wait' + Obj[0].id + '" style="height:100px; position:absolute; top:0px; left:0px; background-color: #d5e9dc; opacity: 0.5; display:none;">';
        grid += '</div>';
        //------------------------------------------------------end-------------------------------------------------------

        Obj.html(grid);
        init_element(Obj, jsons);
        init_stype(Obj, jsons);
        init_event(Obj, jsons, jsons.page);

        //$.tips(".J-failed", '<div class="p10 s-color2">上课时间同工作时间冲突，请更换其他班级！</div>', 'left');
    }


    //设置表格内容
    function set_table_content(Obj, jsons) {
        var table_width = 0;
        if (jsons.columns != null && jsons.columns.length > 0) {
            for (var i = 0; i < jsons.columns.length; i++) {
                table_width += jsons.columns[i].width;
            }
        }
        if (jsons.specialcolumns != null && jsons.specialcolumns.length > 0) {
            for (var j = 0; j < jsons.specialcolumns.length; j++) {
                table_width += jsons.specialcolumns[j].width;
            }
        }

        var grid = "";
        if (jsons.align_x) {
            grid += '<table cellspacing="0" class="m-table mb20" style="width:' + table_width + 'px"  >';
        } else {
            grid += '<table cellspacing="0" class="m-table mb20" >';
        }
        //----------------------------------------------添加列名-----------------------------------------
        grid += '<thead>';
        grid += '<tr>';
        if (jsons.columns != null && jsons.columns.length > 0) {
            for (var i = 0; i < jsons.columns.length; i++) {
                var mywidth = 0;
                if (jsons.columns[i].width != null) {
                    mywidth = jsons.columns[i].width;
                }
                var mytitle = "";
                if (jsons.columns[i].title != null) {
                    mytitle = jsons.columns[i].title;
                }
                grid += '<th style="width:' + mywidth + 'px; ">';
                grid += mytitle;
                grid += '</th>';
            }
        }
        if (jsons.specialcolumns != null && jsons.specialcolumns.length > 0) {
            for (var j = 0; j < jsons.specialcolumns.length; j++) {
                var mywidth = 0;
                if (jsons.specialcolumns[j].width != null) {
                    mywidth = jsons.specialcolumns[j].width;
                }
                var mytitle = "";
                if (jsons.specialcolumns[j].title != null) {
                    mytitle = jsons.specialcolumns[j].title;
                }
                grid += '<th style="width:' + mywidth + 'px;">';
                grid += mytitle;
                grid += '</th>';
            }
        }
        grid += '</tr>';
        grid += "</thead>";
        //------------------------------------------------end--------------------------------------------

        //----------------------------------------------添加内容------------------------------------------
        grid += '<tbody>';
        for (var j = 0; j < jsons.json_data.rows.length; j++) {
            var calssnames = "odd";
            if (j % 2 == 0) {
                calssnames = "even";
            }
            grid += '<tr class="' + calssnames + '">';
            if (jsons.columns != null && jsons.columns.length > 0) {
                for (var i = 0; i < jsons.columns.length; i++) {
                    var mywidth = 0;
                    if (jsons.columns[i].width != null) {
                        mywidth = jsons.columns[i].width;
                    }
                    var mytitle = jsons.columns[i].title;
                    var myheight = jsons.td_height;
                    var myvalue = "";
                    var mycolor = "#000000";
                    var tdclassName = "";
                    if (jsons.columns[i].tdclassname != null) {
                        tdclassName = jsons.columns[i].tdclassname;
                    }
                    if (jsons.columns[i].color != null) {
                        mycolor = jsons.columns[i].color;
                    }
                    var mycursor = "";
                    if (jsons.columns[i].cursor != null) {
                        mycursor = jsons.columns[i].cursor
                    }
                    var className = "";
                    if (jsons.columns[i].classname != null) {
                        className = jsons.columns[i].classname;
                    }
                    if (jsons.columns[i].formatter != null) {
                        myvalue = jsons.columns[i].formatter(j, jsons.json_data.rows[j]);
                    } else {
                        myvalue = jsons.json_data.rows[j][jsons.columns[i].field];
                    }
                    var style = 'width:' + mywidth + 'px; height:' + myheight + ';color:' + mycolor + ';cursor:' + mycursor + ';';
                    style += "border-bottom:#cccccc solid 1px;";
                    if (className != null && className != "") {
                        grid += '<td class="' + tdclassName + '" style="' + style + '"><span class="' + className + '">' + myvalue + '</span></td>';
                    } else {
                        grid += '<td class="' + tdclassName + '" style="' + style + '">' + myvalue + '</td>';
                    }
                }
            }
            if (jsons.specialcolumns != null && jsons.specialcolumns.length > 0) {
                for (var i = 0; i < jsons.specialcolumns.length; i++) {
                    var mywidth = 0;
                    if (jsons.specialcolumns[i].width != null) {
                        mywidth = jsons.specialcolumns[i].width;
                    }
                    var myheight = jsons.td_height;
                    var myvalue = "";
                    if (jsons.specialcolumns[i].formatter != null) {
                        myvalue = jsons.specialcolumns[i].formatter(j, jsons.json_data.rows[j]);
                    } else {
                        myvalue = jsons.json_data.rows[j][jsons.specialcolumns[i].field];
                    }
                    var style = 'width:' + mywidth + 'px; height:' + myheight + ';border-bottom:#cccccc solid 1px;';
                    grid += '<td style="' + style + '">' + myvalue + '</td>';
                }
            }
            grid += '</tr>';
        }
        grid += '</tbody>';
        //------------------------------------------------end--------------------------------------------
        grid += '</table>';
        return grid;
    }

    //设置分页
    function set_table_paging(Obj, jsons) {
        var grid = "";

        grid += '<div class="m-page">';
        grid += '<ul>';
        grid += '<li><a href="javascript:void(0)" id="firstpage' + Obj[0].id + '">首页</a></li>';
        grid += '<li><a href="javascript:void(0)" id="prepage' + Obj[0].id + '">上一页</a></li>';
        grid += '<li><a href="javascript:void(0)" id="nextpage' + Obj[0].id + '" >下一页</a></li>';
        grid += '<li><a href="javascript:void(0)" id="lastpage' + Obj[0].id + '">末页</a></li>';
        grid += '<li class="m-form-con">转到第<select id="sel' + Obj[0].id + '">';
        var c_row = jsons.rows;
        var c_total = jsons.json_data.total;
        var s_row = c_total;
        var num = 0;
        while (s_row > 0) {
            grid += '<option value="' + (num + 1) + '">第' + (num + 1) + '页</option>';
            s_row = s_row - c_row;
            num++;
        }
        if (c_total == 0) {
            grid += '<option value="0">第0页</option>';
        }
        grid += '</select>页</li>';
        grid += '<li>共' + num + '页&nbsp;&nbsp;' + c_total + '条记录</li>';
        grid += '</ul>';
        grid += '</div>';


        return grid;
    }

    //初始化元素
    function init_element(Obj, jsons) {
        //        $("select.formUI").formUI_select();
        //        $("input.formUI[type=checkbox]").formUI_checkbox();

        var select = $('#sel' + Obj[0].id);
        var c_page = jsons.page;
        if (select[0] != null) {
            select[0].options[c_page - 1].selected = true;
            if (select.prev()[0] != null && select.prev()[0].className == "formUI-select-text") {
                select.prev().html(select[0].options[select[0].selectedIndex].text);
            }
        }
    }

    //初始化表格样式,绑定外部事件
    function init_stype(Obj, jsons) {
        var key = "";
        for (var i = 0; i < jsons.columns.length; i++) {
            if (jsons.columns[i].key == true) {
                key = jsons.columns[i].field;
            }
        }
        $('#content' + Obj[0].id).children('table').children('tbody').children('tr').each(function () {
            $(this).mousedown(function () {//tr鼠标按下事件
                var index = this.rowIndex - 1;
                var ck = $(this).children('td').eq(0).find('input:checkbox')[0];
                if (ck != null) {//若无复选框，则不设置选择颜色，不设置current_select属性
                    ck.disabled = true;
                    if (!ck.checked) {
                        ck.checked = true;
                        if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-default") {
                            $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-checked";
                        }
                    } else {
                        ck.checked = false;
                        if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-checked") {
                            $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-default";
                        }
                    }

                    if (jsons.selected) {//多选
                        if (ck.checked) {
                            if (jsons.current_select == null) {
                                jsons.current_select = [];
                            }
                            if (jsons.firstselected == true) {
                                jsons.current_select = [];
                                jsons.firstselected = false;
                            }
                            for (var i = 0; i < jsons.current_select.length; i++) {
                                if (jsons.json_data.rows[index][key] == jsons.current_select[i][key]) {
                                    return;
                                }
                            }
                            jsons.current_select.push(jsons.json_data.rows[index]);

                        } else {
                            for (var i = 0; i < jsons.current_select.length; i++) {
                                if (jsons.json_data.rows[index][key] == jsons.current_select[i][key]) {
                                    jsons.current_select.splice(i, 1);
                                }
                            }
                        }

                        if ($(this)[0].className == 'odd') {
                            $(this)[0].className = "odd_1";
                        } else if ($(this)[0].className == "odd_1") {
                            $(this)[0].className = "odd";
                        }
                        if ($(this)[0].className == "even") {
                            $(this)[0].className = "even_1";
                        } else if ($(this)[0].className == "even_1") {
                            $(this)[0].className = "even";
                        }
                    }
                    if (!jsons.selected) {//单选
                        jsons.current_select = [];
                        jsons.current_select.push(jsons.json_data.rows[index]);
                        singleSelect(Obj, jsons);
                    }
                } else {
                    jsons.current_select = [];
                    jsons.current_select.push(jsons.json_data.rows[index]);
                }

                //设置tr的单击事件
                if (jsons.onClickRow != null) {
                    jsons.onClickRow(index, jsons.json_data.rows[index]);
                }
                //                //防止文本多选
                //                document.body.onselectstart = function () { return false };
            });
        });

        $('#content' + Obj[0].id).children('table').children('tbody').find('td').each(function (i) {
            //设置单元格操作事件
            $(this).click(function () {
                var index = $(this).parent()[0].rowIndex - 1;
                var all_columens = 0;
                if (jsons.columns != null) {
                    all_columens = jsons.columns.length;
                }
                if (jsons.specialcolumns != null) {
                    all_columens += jsons.specialcolumns.length;
                }
                var columnIndex = i % all_columens;
                //设置td的单击事件
                if (jsons.onClickCell != null) {
                    jsons.onClickCell(columnIndex,index, $(this).html(), jsons.json_data.rows[index], this);
                }
            });

            //设置单元格鼠标移动进去事件
            $(this).mousemove(function () {
                var index = $(this).parent()[0].rowIndex - 1;
                var all_columens = 0;
                if (jsons.columns != null) {
                    all_columens = jsons.columns.length;
                }
                if (jsons.specialcolumns != null) {
                    all_columens += jsons.specialcolumns.length;
                }
                var columnIndex = i % all_columens;
                //设置td的单击事件
                if (jsons.onMouseDownCell != null) {
                    jsons.onMouseDownCell(columnIndex,index, $(this).html(), jsons.json_data.rows[index], this);
                }
            });
            $(this).mouseenter(function () {
                var index = $(this).parent()[0].rowIndex - 1;
                var all_columens = 0;
                if (jsons.columns != null) {
                    all_columens = jsons.columns.length;
                }
                if (jsons.specialcolumns != null) {
                    all_columens += jsons.specialcolumns.length;
                }
                var columnIndex = i % all_columens;
                //设置td的单击事件
                if (jsons.onMouseEnterCell != null) {
                    jsons.onMouseEnterCell(columnIndex,index, $(this).html(), jsons.json_data.rows[index], this);
                }
            });
        });

        if (jsons.current_select != null) {//记录之前checkbox的选择状态
            for (var i = 0; i < jsons.json_data.rows.length; i++) {
                for (var j = 0; j < jsons.current_select.length; j++) {
                    if (key != "" && jsons.json_data.rows[i][key] == jsons.current_select[j][key]) {
                        $('#content' + Obj[0].id).children('table').children('tbody').children('tr').each(function () {
                            var index = this.rowIndex - 1;
                            var ck = $(this).children('td').eq(0).find('input:checkbox')[0];
                            if (ck != null && jsons.selected) {
                                if (index == i) {
                                    if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-default") {
                                        $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-checked";
                                    }
                                    if ($(this)[0].className == 'odd') {
                                        $(this)[0].className = "odd_1";
                                        if (ck != null) ck.checked = true;
                                    }
                                    if ($(this)[0].className == "even") {
                                        $(this)[0].className = "even_1";
                                        if (ck != null) ck.checked = true;
                                    }
                                }
                            }
                        });
                    }
                }
            }
        }
    }


    //初始化事件
    function init_event(Obj, jsons, c_page) {
        var select = $('#sel' + Obj[0].id);
        var c_page = jsons.page;
        var t_page = jsons.json_data.total / jsons.rows;
        if (jsons.json_data.total % jsons.rows == 0) {
            t_page - 1;
        }
        var c_content = $('#content' + Obj[0].id);
        var c_wait = $('#wait' + Obj[0].id);

        $('#firstpage' + Obj[0].id).click(function () {
            if (jsons.page != 1) {
                c_wait.css('height', c_content.height());
                c_wait.css('width', c_content.width());
                c_wait.show();
                c_page = 1;
                jsons.page = c_page;
                initMyGrid(Obj, jsons);
                var c = set_table_content(Obj, jsons);
                c_content.html(c);
                c_wait.hide();
                init_element(Obj, jsons);
                init_stype(Obj, jsons);
            }

        });

        $('#prepage' + Obj[0].id).click(function () {
            if (jsons.page > 1) {
                c_wait.css('height', c_content.height());
                c_wait.css('width', c_content.width());
                c_wait.show();
                c_page--;
                jsons.page = c_page;
                initMyGrid(Obj, jsons);
                var c = set_table_content(Obj, jsons);
                c_content.html(c);
                c_wait.hide();
                init_element(Obj, jsons);
                init_stype(Obj, jsons);
            }
        });

        $('#nextpage' + Obj[0].id).click(function () {
            if (jsons.page < t_page) {
                c_wait.css('height', c_content.height());
                c_wait.css('width', c_content.width());
                c_wait.show();
                c_page++;
                jsons.page = c_page;
                initMyGrid(Obj, jsons);
                var c = set_table_content(Obj, jsons);
                c_content.html(c);
                c_wait.hide();
                init_element(Obj, jsons);
                init_stype(Obj, jsons);
            }
        });

        $('#lastpage' + Obj[0].id).click(function () {
            if (jsons.page < t_page) {
                c_wait.css('height', c_content.height());
                c_wait.css('width', c_content.width());
                c_wait.show();
                c_page = $("#" + select[0].id + " option:last").val();
                jsons.page = c_page;
                initMyGrid(Obj, jsons);
                var c = set_table_content(Obj, jsons);
                c_content.html(c);
                c_wait.hide();
                init_element(Obj, jsons);
                init_stype(Obj, jsons);
            }
        });
        select.change(function () {
            c_wait.css('height', c_content.height());
            c_wait.css('width', c_content.width());
            c_wait.show();
            c_page = select.val();
            jsons.page = c_page;
            initMyGrid(Obj, jsons);
            var c = set_table_content(Obj, jsons);
            c_content.html(c);
            c_wait.hide();
            init_element(Obj, jsons);
            init_stype(Obj, jsons);
        });
    }

    //全选(存在选择框)
    function allSelect(Obj, jsons) {
        jsons.current_select = jsons.json_data.rows;
        if (jsons.current_select != null) {//记录之前checkbox的选择状态
            jsons.firstselected = false;
            $('#content' + Obj[0].id).children('table').children('tbody').children('tr').each(function () {

                var ck = $(this).children('td').eq(0).find('input:checkbox')[0];
                if (ck != null && jsons.selected) {
                    if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-default") {
                        $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-checked";
                    }
                    if ($(this)[0].className == 'odd') {
                        $(this)[0].className = "odd_1";
                        if (ck != null) ck.checked = true;
                    }
                    if ($(this)[0].className == "even") {
                        $(this)[0].className = "even_1";
                        if (ck != null) ck.checked = true;
                    }
                }
            });
        }
    }

    //全部撤销(存在选择框)
    function allRevoke(Obj, jsons) {
        jsons.current_select = [];
        jsons.firstselected = true;
        $('#content' + Obj[0].id).children('table').children('tbody').children('tr').each(function () {
            var ck = $(this).children('td').eq(0).find('input:checkbox')[0];
            if (ck != null && jsons.selected) {
                if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-checked") {
                    $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-default";
                }
                if ($(this)[0].className == 'odd_1') {
                    $(this)[0].className = "odd";
                    if (ck != null) ck.checked = false;
                }
                if ($(this)[0].className == "even_1") {
                    $(this)[0].className = "even";
                    if (ck != null) ck.checked = false;
                }
            }
        });
    }

    //默认单选
    function singleSelect(Obj, jsons) {
        var key = "";
        for (var i = 0; i < jsons.columns.length; i++) {
            if (jsons.columns[i].key == true) {
                key = jsons.columns[i].field;
            }
        }
        if (jsons.current_select != null && jsons.current_select.length == 1 && !jsons.selected) {
            for (var i = 0; i < jsons.json_data.rows.length; i++) {
                if (jsons.json_data.rows[i][key] == jsons.current_select[0][key]) {
                    $('#content' + Obj[0].id).children('table').children('tbody').children('tr').each(function () {
                        var ck = $(this).children('td').eq(0).find('input:checkbox')[0];
                        var index = this.rowIndex - 1;
                        if (ck != null && index == i) {
                            if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-default") {
                                $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-checked";
                            }
                            if ($(this)[0].className == 'odd') {
                                $(this)[0].className = "odd_1";
                                if (ck != null) ck.checked = true;
                            }
                            if ($(this)[0].className == "even") {
                                $(this)[0].className = "even_1";
                                if (ck != null) ck.checked = true;
                            }
                        }
                    });
                } else {
                    $('#content' + Obj[0].id).children('table').children('tbody').children('tr').each(function () {
                        var ck = $(this).children('td').eq(0).find('input:checkbox')[0];
                        var index = this.rowIndex - 1;
                        if (ck != null && index == i) {
                            if ($(ck).parent()[0].className == "formUI-checkbox formUI-checkbox-checked") {
                                $(ck).parent()[0].className = "formUI-checkbox formUI-checkbox-default";
                            }
                            if ($(this)[0].className == 'odd_1') {
                                $(this)[0].className = "odd";
                                if (ck != null) ck.checked = false;
                            }
                            if ($(this)[0].className == "even_1") {
                                $(this)[0].className = "even";
                                if (ck != null) ck.checked = false;
                            }
                        }
                    });
                }
            }
        }
    }

})();
