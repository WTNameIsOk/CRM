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

<title>编辑用户</title>

<meta name="pragma" content="no-cache">
<meta name="cache-control" content="no-cache">
<meta name="expires" content="0">
<%@include file="../../script.html"%>
</head>

<style type="text/css">
	.myselect{
		height:30px;
	}
</style>

<body >
	<section class="info-section">
		<form id="form" method="post">
			<table>
				<tr>
					<td class="text-title">字典类型名：</td>
					<td class="text-content">
						<input type="hidden" name="dictTypeVO.id" value="${dictTypeVO.id }"> 
						<input type="hidden" name="dictTypeVO.createById" value="${dictTypeVO.createById }"> 
						<input type="text" name="dictTypeVO.typename" value="${dictTypeVO.typename }" 
							class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>

				<tr>
					<td class="text-title">字典类型编码：</td>
					<td class="text-content">
						<input type="text" name="dictTypeVO.typecode" value="${dictTypeVO.typecode }"
							class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td class="text-title">备注：</td>
					<td class="text-content">
						<input type="text" name="dictTypeVO.typenote" value="${dictTypeVO.typenote }"
							class="easyui-textbox theme-textbox-radius" data-options="required:true"></td>
				</tr>
				
				<tr>
					<td class="text-title">排序编号：</td>
					<td class="text-content">
						<input type="text" name="dictTypeVO.sortnum" value="${dictTypeVO.sortnum }"
							class="easyui-textbox theme-textbox-radius" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td class="text-title">状态：</td>
					<td class="text-content">
						<select name="dictTypeVO.status" class="easyui-combobox theme-textbox-radius">
							<option value="1" ${roleVO.status==1?"selected":"" }>正常</option>
							<option value="0" ${roleVO.status==0?"selected":"" }>禁用</option>
							<option value="2" ${roleVO.status==2?"selected":"" }>已删除</option>
						</select>
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
				