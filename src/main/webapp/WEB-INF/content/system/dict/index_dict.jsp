<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>权限列表</title>
    
	<meta name="pragma" content="no-cache">
	<meta name="cache-control" content="no-cache">
	<meta name="expires" content="0">    
	
	<%@include file="../../script.html" %>

  </head>
  <style type="text/css">
  	#container{
  		width:100%;
  		text-align:center;
  	}
  	#left{
  		float:left;
  		width:30%;
  		border:1px solid blue;
  	}
  	#right{
  		float:left;
  		width:69%;
  		border:1px solid blue;
  	}
  	h3{
  		color:green;
  	}
  </style>
  <body>
    <!-- 表格中展示所有的权限 -->
    <div id="container">
    	<div id="left">
    		<h3>字典类型</h3>
	    	<table id="dtList"  style="height:600px"></table>
	    	<div id="toolbarDt">
		    	<a href="javascript:void(0);" onclick="return addDt('system/dict/DictTypeAction_edit.action')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新建</a>
		    	<a href="javascript:void(0);" onclick="return delDt('system/dict/DictTypeAction_remove.action')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		    	<a href="javascript:void(0);" onclick="return editDt('system/dict/DictTypeAction_edit.action');" id="editBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
	   		</div>
   		 </div>
    	<div id="right">
    		<h3 id="info">所有字典</h3>
    		<div id="toolbar" >
		    	<a href="javascript:void(0);" onclick="return add('system/dict/DictAction_edit.action')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新建</a>
		    	<a href="javascript:void(0);" onclick="return del('system/dict/DictAction_remove.action')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		    	<a href="javascript:void(0);" onclick="return edit('system/dict/DictAction_edit.action');" id="editBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		    </div>
    		<table id="dictList" class="easyui-datagrid"  style="height:600px"></table>
    	</div>
    </div>
    
    
  
    <script type="text/javascript">
    var currentDt={
    	id:"",
    	typename:""
    }

    	

    //删除按钮事件处理函数

        
        //修改按钮事件处理函数

    	//添加按钮事件处理函数

        //删除按钮事件处理函数

        
        
    	$(function(){
    		//加载所有字典类型
    		$("#dtList").treegrid({
    			url : "system/dict/DictTypeAction_findAll.action",
    			fitColumns : true,
    			idField : "id",
    			treeField: "typename",
    			rownumbers : false,
    			toolbar : "#toolbarDt",
    			//checkbox : true,
    			singleSelect : true,
    			cascadeCheck : false,
    			columns : [[
    				{field:"typename",title:"字典类型名称",sortable:true,width:10},
    				{field:"typecode",title:"编码",sortable:true,width:10,formatter:function(value,rowData,index){
    					if(value == "allType"){
    						return "";
    					}else{
    						return value;
    					}
    					}},
    				{field:"status",title:"状态",formatter:function(value,rowData,index){
    					if("allType"==rowData.typecode){
    						return "";
    					}else if(value == 1){
    						return "可用";
    					}else if(value == 0){
    						return "禁用";
    					}else if(value == 2){
    						return "已删除";
    					}else{
    						return "";
    					}
    				}}
    			]],
    			loadFilter:function(data){//"_parentId"
    				if(data && data.data){
    					$.each(data.data ,function(index,obj){
    						if(obj.id!="ACEAF0031E2C4F92B16EAB5F5D923DE7"){
    							data.data[index]._parentId ="ACEAF0031E2C4F92B16EAB5F5D923DE7";
    						}
    					});
    					return {"rows":data.data};
    				}
    				return null;
    			},
    			onClickRow:function(row){
    				loadDictList(row.id,row.typecode);
    				if("allType"==row.typecode){
	    				currentDt.id="";
	    				currentDt.typename="";
	    				$("#info").text("所有字典");
    				}else{
    					currentDt.id=row.id;
    					currentDt.typename=row.typename;
    					$("#info").text("字典 类型为["+currentDt.typename+"]");
    				}
    			}
    		});
    		loadDictList("ACEAF0031E2C4F92B16EAB5F5D923DE7","allType");
    	});
    	
    		//加载字典数据
    function loadDictList(dictTypeId,typecode){
    		$("#dictList").datagrid({
    			url : "system/dict/DictAction_findByDictTypeId.action?dictType.id="+dictTypeId+"&dictType.typecode="+typecode,
    			pagination : true,
    			toolbar : "#toolbar",
    			fitColumns : true,
    			idField : "id",
    			rownumbers : true,
    			//singleSelect:true,
    			columns : [[
    				{field:"id",title:"选择",checkbox:true},
    				{field:"dictname",title:"词条名",sortable:true,width:10},
    				{field:"dictcode",title:"编码",width:15},
    				{field:"dictvalue",title:"值",width:20},
    				{field:"dictnote",title:"备注",width:15},
    				{field:"dictTypeName",title:"词条类型",width:15}
    			]],
    			loadFilter:function(data){
    				//data是服务器返回的数据,将服务器端返回的数据转换为datagrid需要的格式
    				return {"total":data.data.totalRows,"rows":data.data.result};
    			}
    		
    		});
    	}
    </script>
  </body>
</html>
