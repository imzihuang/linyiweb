
$(function () {
    init_sel();
    init_province();
});

function init_sel(){
    $("#sel_province").change(function(){
        code=$("#sel_province").val();
        set_city(code)

        code=$("#sel_city").val();
        set_county(code)
    });
    $("#sel_city").change(function(){
        code=$("#sel_city").val();
        set_county(code)
    });
}

function init_province(){
    $.ajax({
        type:'GET',
        url: '/area/province',
        dataType: 'json',
        async:false,
        success:function(msg){
            var options='<option value="-1" selected="selected">选择省</option>';
            for (var i=0; i<msg.length; i++)
            {
                obj = msg[i];
                if(obj.bValid==1) alert(obj.bValid);
                option='<option value="'+obj.sCode+'">'+obj.sName+'</option>'
                options+=option;
            }
            $('#sel_province').html(options);
        }
    });
}

function set_city(province_code){
    if(province_code=='-1'){
        $('#sel_city').html('<option value="-1" selected="selected">无</option>');
        return;
    }
    $.ajax({
        type:'GET',
        url:'/area/city',
        dataType:'json',
        data:{'code':province_code},
        async:false,
        success:function(msg){
            var options=''
            for (var i=0; i<msg.length; i++)
            {
                obj = msg[i];
                if(obj.bValid==1) alert(obj.bValid);
                option='<option value="'+obj.sCode+'">'+obj.sName+'</option>'
                options+=option;
            }
            $('#sel_city').html(options);
        }
    });
}

function set_county(city_code){
    if(city_code=='-1'){
        $('#sel_county').html('<option value="-1" selected="selected">无</option>');
        return;
    }
    $.ajax({
        type:'GET',
        url:'/area/county',
        dataType:'json',
        data:{'code':city_code},
        async:false,
        success:function(msg){
            var options=''
            for (var i=0; i<msg.length; i++)
            {
                obj = msg[i];
                if(obj.bValid==1) alert(obj.bValid);
                option='<option value="'+obj.sCode+'">'+obj.sName+'</option>'
                options+=option;
            }
            $('#sel_county').html(options);
        }
    });
}


function test_province(){
    $.ajax({
        type:'GET',
        url: '/area/province',
        dataType: 'json',
        async:false,
        success:function(msg){
            alert(JSON.stringify(msg));
        }
    });
}