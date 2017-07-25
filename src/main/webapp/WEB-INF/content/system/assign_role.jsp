<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>为角色分配权限</title>
    
	<meta name="pragma" content="no-cache">
	<meta name="cache-control" content="no-cache">
	<meta name="expires" content="0">    
	<%@include file="../script.html" %>

  </head>
  
  <body>
    <!-- 把所有的角色查询出来展示到这个位置 -->
    <input type="hidden" name="roleId" value="${roleVO.id }" >
    <!-- 表格中展示所有的权限 -->
    <table id="dataList"></table>
    <div style="text-align: center;margin-top:10px;">
    	<a  class="easyui-linkbutton" id="assignBtn" data-options="iconCls:'icon-man'">分配</a>
    </div>
    <script type="text/javascript">
    	$(function(){
    		//为分配按钮添加事件处理函数
    		$("#assignBtn").on("click",function(event){
    			//获取到角色的id

    		});
    		
    		//加载所有权限
    		$("#dataList").treegrid({
    			url : "system/function/FunctionAction_findAll.action",
    			fitColumns : true,
    			idField : "id",
    			treeField: "funcName",
    			rownumbers : true,
    			checkbox:true,
    			cascadeCheck:false,
    			singleSelect : false,
    			columns : [[
    				
    				{field:"funcName",title:"权限名称",sortable:true,width:10},
    				{field:"funcType",title:"权限类型",width:5,formatter:function(value,rowData,index){
    					if(value == 1){
    						return "菜单";
    					}else if(value == 0){
    						return "按钮";
    					}else{
    						return "其他";
    					}
    				}},
    				{field:"funcURL",title:"权限URL",width:10},
    				{field:"status",title:"权限状态",formatter:function(value,rowData,index){
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
    			loadFilter:function(data){//"_parentId"
    				
    				if(data && data.data){
    					$.each(data.data ,function(index,obj){
    						if(obj.parentId){
    							data.data[index]._parentId = obj.parentId; 
    						}
    					});
    					return {"rows":data.data};
    				}
    				return null;
    			},
    			//当前表格中所有的数据加载完毕之后
    			onLoadSuccess : function(){
    				//根据角色的id获取到当前角色的所有权限信息
    				$.get("system/function/FunctionAction_findByRoleIds.action",
    					{"ids":  $("input[name=roleId]").val()},
    					function(data){
    						//判断用户是否已经有了角色，如果有，就将对应角色在表格中选中
    						if(data && data.success && data.data.length>0){
    							$.each(data.data,function(index,obj){
    								$("#dataList").treegrid("checkNode",obj.id);
    							});
    						}
    					},"json");
    			}
    			
    		});
    	});
    </script>
  </body>
</html>
