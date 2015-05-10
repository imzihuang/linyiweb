
function operateFormatter(value, row, index) {
    return [
        '<a class="like" href="javascript:void(0)" title="Like">',
            '<i class="glyphicon glyphicon-heart"></i>',
        '</a>',
        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
            '<i class="glyphicon glyphicon-edit"></i>',
        '</a>',
        '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
        '</a>'
    ].join('');
}

window.operateEvents = {
    'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .edit': function (e, value, row, index) {
        alert('You click edit icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .remove': function (e, value, row, index) {
        alert('You click remove icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }
};

//加载bootStrapTable
$(function () {
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd'
    })
    $('.datepicker').datepicker('setValue', new Date())
    $('#table_activity').bootstrapTable({
        method: 'post',
        url: '/manage/activity',
        cache: false,
        height: 400,
        striped: true,
        pagination: true,
        pageSize: 50,
        pageList: [10, 25, 50, 100, 200],
        search: true,
        showColumns: true,
        showRefresh: true,
        minimumCountColumns: 2,
        clickToSelect: true,
        toolbar: '#custom-toolbar',
        columns: [{
            field: 'state',
            checkbox: true
        }, {
            field: 'sName',
            title: '活动名',
            valign: 'bottom',
            sortable: true
        },{
            field: 'sDescribe',
            title: '活动描述',
            valign: 'bottom',
            sortable: true
        },{
            field: 'dtCreate',
            title: '创建日期',
            valign: 'bottom',
            sortable: true
        },{
            field: 'dtBegin',
            title: '起始日期',
            valign: 'bottom',
            sortable: true
        },{
            field: 'dtEnd',
            title: '截止日期',
            valign: 'bottom',
            sortable: true
        },{
            field: 'sTypeCode',
            title: '活动类型',
            valign: 'bottom',
            sortable: true
        },{
            field: 'operate',
            title: 'Item Operate',
            align: 'center',
            valign: 'middle',
            clickToSelect: false,
            formatter: operateFormatter,
            events: operateEvents
        }]
    });
});