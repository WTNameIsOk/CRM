<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
	<meta name="pragma" content="no-cache">
	<meta name="cache-control" content="no-cache">
	<meta name="expires" content="0">    
	<%@include file="../script.html" %>

  </head>
  
  <body >
   	<table id="userList" class="easyui-datagrid"></table>
    <div id="toolbar">
    	<a href="javascript:void(0);" onclick="return add('system/user/UserAction_edit.action')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新建</a>
    	<a href="javascript:void(0);" onclick="return del('system/user/UserAction_remove.action')" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
    	<a href="javascript:void(0);" onclick="return edit('system/user/UserAction_edit.action');" id="editBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    	<a href="javascript:void(0);" onclick="return assign('system/user/UserAction_assign.action')" id="setBtn" class="easyui-linkbutton" data-options="iconCls:'icon-man',plain:true">分配角色</a>
    </div>
    <script type="text/javascript">
    	//分配角色按钮事件处理函数

    	//修改按钮事件处理函数

    	//添加按钮事件处理函数

        //删除按钮事件处理函数

    	//加载用户数据
    	$(function(){
    		$("#userList").datagrid({
    			url : "system/user/UserAction_findByPage.action",
    			pagination : true,
    			toolbar : "#toolbar",
    			fitColumns : true,
    			idField : "id",
    			rownumbers : true,
    			//singleSelect:true,
    			columns : [[
    				{field:"id",title:"选择",checkbox:true},
    				{field:"username",title:"用户名",sortable:true,width:10},
    				{field:"phone",title:"联系电话",width:15},
    				{field:"email",title:"电子邮箱",width:20},
    				{field:"roleNames",title:"用户角色",width:15},
    				{field:"createBy",title:"创建者",width:10},
    				{field:"createTime",title:"创建时间",width:15},
    				{field:"updateBy",title:"修改者",width:10},
    				{field:"updateTime",title:"修改时间",width:15},
    				{field:"status",title:"用户状态",formatter:function(value,rowData,index){
    					if(value == 1){
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
    			loadFilter:function(data){
    				//data是服务器返回的数据,将服务器端返回的数据转换为datagrid需要的格式
    				return {"total":data.data.totalRows,"rows":data.data.result};
    			}
    		
    		});
    	});
    </script>
  </body>
</html>
