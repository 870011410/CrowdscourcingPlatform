<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
<style>
.my-form {
	width: 800px;
	/*border-top: 2px solid #D8312A;*/
	font-size: 16px;
	margin: auto;
	top: 80px;
	bottom: 0;
}

label {
	margin-top: 10px;
}

.imgHead {
	position: absolute;
	margin-left: 600px;
	margin-top: -450px;
}
.layui-upload-img {
	border-radius: 50px;
	width:100px;
	height:100px;
}

</style>
</head>

<body>

	<div class="layui-form my-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">昵称：</label> <label
				class="layui-form-label" id="name"
				style="text-align: left; width: 160px;"></label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">用户类型：</label> <label
				class="layui-form-label" id="type" style="text-align: left;"></label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">个人介绍：</label> <label
				class="layui-form-label" id="memo"
				style="text-align: left; width: 300px;">
				<div></div>
			</label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">信用分：</label> <label
				class="layui-form-label" id="score" style="text-align: left;"></label>
		</div>

		<div class="layui-forcm-item">
			<label class="layui-form-label" style="width: 100px;">手机号：</label> <label
				class="layui-form-label" id="phone" style="text-align: left;"></label>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label" style="width: 100px;">邮箱：</label> <label
				class="layui-form-label" id="email" style="text-align: left;"></label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">账户余额：</label> <label
				class="layui-form-label" id="money"
				style="text-align: left; width: 160px;"></label>
			
		</div>
<button class="layui-btn layui-btn-normal"
				style="font-size: 15px; margin-top: 10px;margin-left:60px;width: 120px;"
				onclick="recharge()"><i class='layui-icon layui-icon-rmb'>&nbsp;充 &nbsp;值</i></button>
		<button class="layui-btn layui-btn-normal"
			style="width: 120px; font-size: 15px;margin-left:20px; margin-top: 10px;"
			onclick="updateUserInfo()"><i class='layui-icon layui-icon-edit'>&nbsp;编&nbsp;辑</i></button>

	</div>
	
	<div class="imgHead">
		<div class="layui-input-inline">
			<div class="layui-upload-list">
				<img src="${user.src}" id="srcimgurl" class="layui-upload-img">
			</div>
		</div>
	</div>

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
	<script src="3rd/Content/ace/ace.js"></script>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});

		});

		function updateUserInfo() {
			window.location.href = "updateUserInfo.html";
		}

		showInfo();

		function showInfo() {
			$.ajax({
				url : "do-showUserInfo.action",
				type : "post",
				data : {
					"id" : "${user.id}"
				},
				dataType : "json",
				success : function(msg) {
					var user =msg.user;
					$("#name").text(user.name);
					$("#type").text((user.type == "0" ? "雇主" : "服务商"));
					$("#memo").find("div").append(user.memo);
					$("#score").text(user.score + "分");
					$("#phone").text(user.phone);
					$("#email").text(user.email);
					$("#money").text(user.money + "元");
				},
				error : function() {
					layer.msg('请求失败！', {
						icon : 2,
						time : 1000, //20s后自动关闭
					});
				}
			});
			
			
			
		/* 	$("#name").text("${user.name}");
			$("#type").text(("${user.type}" == "0" ? "雇主" : "服务商"));
			$("#memo").find("div").append('${user.memo}');
			$("#score").text("${user.score}" + "分");
			$("#phone").text("${user.phone}");
			$("#email").text("${user.email}");
			$("#money").text("${user.money}" + "元");
 */		}

		function recharge(){
			parent.recharge();
		}
		
		
	</script>
<body>
<html>