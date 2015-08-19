<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
<title>�Ϸ�</title>



<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.2.js"></script>
<style type="text/css">
.win {
	width: 500px;
	height: 600px;
	background: #70a8d2;
	border-radius: 8px;
	box-shadow: 0px 0px 5px 10px;
	opacity: 0.8;
	position: absolute;
	left: 0;
	top: 0;
	display: none
}

.win .wTop {
	height: 30px;
	width: 100%;
	cursor: move
}

.win .content {
	height: 570px;
	width: 100%;
	border-radius: 5px;
	background: white
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<script language="javascript" type="text/javascript">
	$(function() {
		//��ק 
		dragAndDrop();
		//��ʼ��λ�� 
		initPosition();
		//�����ť 
		clickShowBtn();
	});
	//��ק 
	function dragAndDrop() {
		var _move = false;//�ƶ���� 
		var _x, _y;//�����ؼ����Ͻǵ����λ�� 
		$(".wTop").mousedown(function(e) {
			_move = true;
			_x = e.pageX - parseInt($(".win").css("left"));
			_y = e.pageY - parseInt($(".win").css("top"));
			//$(".wTop").fadeTo(20,0.5);//�����ʼ�϶���͸����ʾ 
		});
		$(document).mousemove(function(e) {
			if (_move) {
				var x = e.pageX - _x;//�ƶ�ʱ���λ�ü���ؼ����Ͻǵľ���λ�� 
				var y = e.pageY - _y;
				$(".win").css({
					top : y,
					left : x
				});//�ؼ���λ�� 
			}
		}).mouseup(function() {
			_move = false;
			//$(".wTop").fadeTo("fast",1);//�ɿ�����ֹͣ�ƶ����ָ��ɲ�͸�� 
		});
	}
	//��ʼ����קdiv��λ�� 
	function initPosition() {
		//�����ʼ��λ�� 
		var itop = ($(document).height() - $(".win").height()) / 2;
		var ileft = ($(document).width() - $(".win").width()) / 1.8;
		//���ñ���קdiv��λ�� 
		$(".win").css({
			top : itop,
			left : ileft
		});
	}
	//�����ʾ��ť 
	function clickShowBtn() {
		$("#show").click(function() {
			$(".win").show(1000);
		});

		$("#hidden").click(function() {
			$(".win").hide(1000);
		});
	}
</script>
<body>

	<button id="show">��ʾ</button>
	<div class="win">
		<div class="wTop">
			<p style="float: right; margin: 5px 5px 0px 0px; color: white"
				id="hidden">X</p>
		</div>
		<div class="content"></div>
	</div>

</body>
</html:html>
