<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<title>表单管理</title>
		<%@ include file="/common/meta.jsp"%>
		<link rel="stylesheet" href="${ctx}/styles/css/style.css" type="text/css" media="all" />
		<script src="${ctx}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	</head>

	<body>
		<form id="inputForm" action="" method="post">
			<input type="hidden" name="id" id="id" value="${id }"/>
			<table class="table_all" align="center" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td class="td_table_1">
						<span>表单名称：</span>
					</td>
					<td class="td_table_2" colspan="3">
						${form.name }&nbsp;
					</td>
				</tr>
                <tr>
                    <td class="td_table_1">
                        <span>中文名称：</span>
                    </td>
                    <td class="td_table_2" colspan="3">
                        ${form.displayName }&nbsp;
                    </td>
                </tr>
				<tr>
					<td class="td_table_1">
						<span>表单类型：</span>
					</td>
					<td class="td_table_2" colspan="3">
                        <frame:select type="select" name="type" configName="formType" value="${form.type}" displayType="1"/>&nbsp;
					</td>
				</tr>
			</table>
			<table align="center" border="0" cellpadding="0"
				cellspacing="0">
				<tr align="left">
					<td colspan="1">
						<input type="button" class="button_70px" name="reback" value="返回"
							onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
