$(function(){
	initdrop();
	initexhibition();
});

//初始化产品下拉框
function initdrop(){
	$.ajax({
		type:'GET',
        url:'/merchant_load/',
        dataType:'json',
        async:'false',
        success:function(msg){
            create_content(msg);
            create_popup(msg);
        }
	});
}


//初始化展示框
function initexhibition(){
	m_node = $('#par_code').val();
	if (m_node == null){
		return;
	}
	s_node = $('#sub_code').val();
	$.ajax({
		type:'GET',
        url:'/merchant_load/'+m_node,
        dataType:'json',
        async:'false',
        success:function(msg){
        	data = msg;
        	var jsons={
        		table_font_size:11,
				data:data.subdata,
				shownode:s_node
			};
			$('#myexhibition').myexhibition(jsons);
        }
	});
}

//创建下拉框内容
function create_content(datalist){
	for(var i=0;i<datalist.length;i++){
		var subdata = datalist[i];
		if (subdata == null){
			continue;
		}
		//初始化下拉内容
		var dropli = $('<li role="presentation"><a class="drop_a '+subdata.sCode+'" role="menuitem" href="'+subdata.sCode+'" style="width:198px;">'+subdata.sName+'</a></li>');
		$('.dropdown-menu').append(dropli)
		//dropli.appendto('.dropdown-popup');
		var drop_divder = $('<li class="divider"></li>');
		$('.dropdown-menu').append(drop_divder)
		//drop_divder.appendto('.dropdown-popup');
	}
}


//创建产品弹出框
function create_popup(datalist){
	for(var i=0;i<datalist.length;i++){
		var currentdata = datalist[i];
		if (currentdata == null){
			continue;
		}

		//初始化弹出框
		var jsons={
			touchObj:$('.drop_a.'+currentdata.sCode),
			left:199,
			data:currentdata.subdata,
			display:'sName',
			link:'sCode'
		};
		$('.dropdown-menu').mypopup(jsons);
	}
}

