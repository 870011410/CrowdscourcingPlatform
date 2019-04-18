<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
.my-form {
	width: 300px;
	/*border-top: 2px solid #D8312A;*/
	margin: auto;
	top: 80px;
	bottom: 0;
}
</style>
</head>

<body>
	<br />
	<h1 align="center">充值</h1>
	<br />
	<form class="layui-form my-form" name=alipayment action=alipay.trade.page.pay method=post 
	target="_blank">
		<div class="layui-form-item">
			<label class="layui-form-label">充值金额：</label>
			<div class="layui-input-block">
				<input id="WIDout_trade_no" name="WIDout_trade_no" style="display: none"/>
				<input id="WIDsubject" name="WIDsubject" style="display: none"/>
				<input type="text" id="WIDtotal_amount" lay-verify="required" name="WIDtotal_amount" 
					class="layui-input">
				<input id="WIDbody" name="WIDbody" style="display: none"/>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block" style="margin-left:40px;">
				<button class="layui-btn layui-btn-normal" lay-submit style="width:100px;font-size:16px;" onclick="confirm()"><i class="layui-icon layui-icon-diamond">&nbsp;充&nbsp;值</i></button>
				<a class="layui-btn layui-btn-primary" style="width:100px;font-size:16px;" onclick="closeNow()"><i class="layui-icon layui-icon-return">&nbsp;返&nbsp;回</i></a>
			</div>
		</div>

	</form>

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;
		});

		var index = parent.layer.getFrameIndex(window.name);
	
		function closeNow(){
			/* parent.$("#if-right").contents().showInfo(); */
			parent.refresh();
			parent.layer.close(index);
		}
		
		function confirm(){
			//如果充值金额不为空，则跳转
			if($("#WIDtotal_amount").val().trim().length>0){
				parent.layer.close(index);
				parent.confirmRecharge();
			}
		}

		/* function recharge() {
			var money = $("#money").val();
			$.ajax({
				url : "do-recharge.action",
				type : "post",
				data : {
					"money" : money,
					"name" : "${user.name}",
					"select_id" : "${user.id}"
				},
				dataType : "json",
				success : function(msg) {

					if (msg.type == "success") {
						parent.layer.msg('充值成功！', {
							icon : 1,
							time : 1000, //20s后自动关闭
						});
						window.setTimeout(closeNow(), 1000);
					} else {
						layer.msg('充值失败！', {
							icon : 2,
							time : 1000, //20s后自动关闭
						});
					}

				},
				error : function() {
					layer.msg('请求失败！', {
						icon : 2,
						time : 1000, //20s后自动关闭
					});
				}
			});

		} */
		function GetDateNow() {
			var vNow = new Date();
			var sNow = "";
			sNow += String(vNow.getFullYear());
			sNow += String(vNow.getMonth() + 1);
			sNow += String(vNow.getDate());
			sNow += String(vNow.getHours());
			sNow += String(vNow.getMinutes());
			sNow += String(vNow.getSeconds());
			sNow += String(vNow.getMilliseconds());
			document.getElementById("WIDout_trade_no").value =  sNow;
			document.getElementById("WIDsubject").value = "${user.name}";
			document.getElementById("WIDbody").value = "${user.id}";
/* 			alert(document.getElementById("WIDsubject").value); */	
		}
		GetDateNow();
	</script>
<body>
<html>