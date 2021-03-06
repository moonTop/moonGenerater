function pageInit(){
	//datagrid
	initDatagrid();
}

//高度计算
function getHeight(){
	return $(window).height()*0.77;
};

function initDatagrid(){
    $('#${beanNameLower}_grid').datagrid({
	    height:getHeight(),
		nowrap: true,
		striped: true,
		pagination:true,
		rownumbers:true,
//		fitColumns: true,
		singleSelect:false,
		pageSize:15,
		pageList:[10,15,20,30],
		frozenColumns:[[
		                {field:'ck',checkbox:true}
		                ]],
		columns:[[
            {field:'ID',hidden:true},	
            <#list fields as field>
			<#if field.isPK?index_of("true")==-1>
			 {title : '${field.remark}',field : '${field.fieldName}',sortable : true,width : 100,align : 'center'}<#if field_has_next>,</#if>
		    </#if>
			</#list>
		]],
		toolbar:[{
   			text : '新增',
			iconCls : 'icon-add',
			plain:true,
			handler : function() {
				openAdd${beanName}();
			}
		},'-',{
			text : '编辑',
			iconCls : 'icon-edit',
			plain:true,
			handler : function() {
				openEdit${beanName}();
			}
		},'-',{
			text : '删除',
			iconCls : 'icon-remove',
			plain:true,
			handler : function() {
				delete${beanName}();
			}
		}],
		enableHeaderClickMenu: true
	});
    loadDatagrid();
}
function loadDatagrid(otherParams){
	var params={};
	if(otherParams != undefined){
		extend(params,otherParams);
	}
	var url = purl+'co${beanName}Manager.dh?key=query${beanName}s';
	MyUtility.bindService2DataGrid("${beanNameLower}_grid", url, params);
	MyUtility.refreshDataGrid("${beanNameLower}_grid", null, true);
}
var ${beanNameLower}OprUrl;

function openAdd${beanName}() {
	 $('#addDlg').dialog({
			title: '新增',
			modal:true
		});
	   $('#addDlg').dialog('open');
	   $("#fm${beanName}").form("clear");
}
function openEdit${beanName}() {
    var rows = $("#${beanNameLower}_grid").datagrid("getSelections");
    if (null !=rows && rows.length>0) {
    	if(rows.length>1){
    		$.messager.alert("提示信息","请选择其中一条数据进行操作");
    		return;
    	}
    	var row = rows[0];
    	$('#addDlg').dialog({
			title: '修改',
			modal:true
		});
    	$('#addDlg').dialog('open');
        $("#fm${beanName}").form("clear");
        $("#fm${beanName}").form("load", row);
    }
    else
    {
    	$.messager.alert("提示信息","请先选择要操作的对象");
    }
}
function saveOrUpdate${beanName}(form) {
	 if( $("#fm${beanName}").form("validate")){
	 			var id = $("#ID").val();
	 			var method = "save";
	 			if(!isEmpty(id)){
	 				method = "update";
	 			}
	 			var url = purl+'co${beanName}Manager.dh?key='+method+'${beanName}&username='+food.enUserName;
	        	MyUtility.requestService(url,food.serializeObject($("#fm${beanName}")),function(data){
	    			if (data.result == "exists") {
	    				$.messager.alert("提示信息", "该条信息已经存在,请修改关键字");
	    			} else if (data.result > 0) {
	    				$.messager.alert("提示信息", "操作成功");
	    				$("#addDlg").dialog("close");
	    				loadDatagrid();
	    			} else {
	    				$.messager.alert("提示信息", "操作失败");
	    			}
	    		});
		}
}	
function delete${beanName}() {
   var rows = $('#${beanNameLower}_grid').datagrid('getSelections');
    if (null != rows && rows.length>0) {
        $.messager.confirm('警告', '确认删除所选信息内容?', function (r) {
            if (r) {
            	var resultCount=0;
            	for (var i = 0; i < rows.length; i++) {
					var row = rows[i];
					MyUtility.requestService(purl+'co${beanName}Manager.dh?key=delete${beanName}&username='+food.enUserName, {ID: row.ID}, function(data){
						if(data.result>0){
							resultCount = resultCount+1;
						}
					}, null, false);
				}
            	$.messager.alert("提示信息", "总共"+rows.length+"条，成功"+resultCount+"条");
            	loadDatagrid();
            }
        });
    } else {
    	$.messager.alert("请先选择要操作的对象");
    }
}  
function doSearch(value,names){
	loadDatagrid({queryWord : value});
}
