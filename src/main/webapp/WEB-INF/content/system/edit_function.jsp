<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>编辑权限</title>

<meta name="pragma" content="no-cache">
<meta name="cache-control" content="no-cache">
<meta name="expires" content="0">
<%@include file="../script.html"%>
</head>

<body style="width:100%;max-width:600px;padding:30px 60px;">
	<section class="info-section">
		<form id="form" method="post">
			<table>
				<tr>
					<td class="text-title">权限名称：</td>
					<td class="text-content">
						<input type="hidden" name="funcVO.id" value="${funcVO.id }"> 
						<input type="text" name="funcVO.funcName" value="${funcVO.funcName }" 
							class="easyui-textbox theme-textbox-radius" data-options="required:true,validType:'length[2,20]'">
					</td>
				</tr>
				<tr>
					<td class="text-title">权限URL：</td>
					<td class="text-content">
						<input type="text" name="funcVO.funcURL" value="${funcVO.funcURL }"
							class="easyui-textbox theme-textbox-radius">
					</td>
				</tr>
				
				<tr>
					<td class="text-title">权限编码：</td>
					<td class="text-content">
						<input type="text" name="funcVO.funcCode" value="${funcVO.funcCode }"
							class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td class="text-title">权限类型：</td>
					<td class="text-content">
						<select name="funcVO.funcType" class="easyui-combobox theme-textbox-radius">
							<option value="1" ${funcVO.funcType==1 ? 'selected' : ''}>菜单</option>
							<option value="0" ${funcVO.funcType==0 ? 'selected' : ''}>按钮</option>
							<option value="" ${empty funcVO.funcType ? 'selected' : ''}>其它</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="text-title">上级权限：</td>
					<td class="text-content">
						<input class="easyui-combotree" id="parent" name="funcVO.parentId" value="${funcVO.parentId }">
					</td>
				</tr>
				<tr>
					<td class="text-title">排序编号：</td>
					<td class="text-content">
						<input type="text" name="funcVO.sortNum" value="${funcVO.sortNum }"
							class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td class="text-title">权限状态：</td>
					<td class="text-content">
						<select name="funcVO.status" class="easyui-combobox theme-textbox-radius">
							<option value="1" ${funcVO.status==1?"selected":"" }>正常</option>
							<option value="0" ${funcVO.status==0?"selected":"" }>禁用</option>
							<option value="2" ${funcVO.status==2?"selected":"" }>已删除</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="text-title">描述信息：</td>
					<td class="text-content">
						<textarea class="theme-textbox-radius" rows="5"  cols="20" name="funcVO.funcNote">${funcVO.funcNote }</textarea></td>
				</tr>
				<!-- 因为用户关联信息不需要修改，但是如果没有把这些信息传递给服务器端，hibernate对数据进行更新时就会把对应条目设置为null值 -->

				<tr style="display: none;">
					<td colspan="2">
						<input type="hidden" name="funcVO.createById" value="${funcVO.createById}"> 
						<input type="hidden" name="funcVO.createTime" value="${funcVO.createTime}">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;margin-top: 10px;">
						<a href="javascript:void(0);" id="saveBtn" class="easyui-linkbutton button-primary">保存</a> 
						<a href="javascript:void(0);" id="resetBtn" class="easyui-linkbutton button-danger">重置</a>
					</td>
				</tr>
				</table>
		</form>
	</section>
	<script type="text/javascript">
		$(function(){
			//当页面加载完毕初始化树状下拉列表

			
		});
		
		$(function() {
			//重置按钮
			$("#resetBtn").on("click",function(event){
				$("#form").form("reset");
			});
			//保存按钮
			$("#saveBtn").on("click", function(event) {

			});
		});
	</script>
</body>
</html>
				