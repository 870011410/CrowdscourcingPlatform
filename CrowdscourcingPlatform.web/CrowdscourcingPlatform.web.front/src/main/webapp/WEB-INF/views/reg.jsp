<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
<script type="text/javascript" src="3rd/layui/layui.js"></script>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<style>
body {
	background-image: url(img/reg.jpg);
	background-size: cover;
}

.div-logArea {
	/*background-color:darkgrey;*/
	/*width: 450px;
				height: 600px;
				margin-top: 100px;
				margin-left: auto;
				margin-right: auto;
				border-radius: 10px;*/
	box-shadow: -15px 15px 15px rgba(6, 17, 47, 0.7);
	position: absolute;
	width: 450px;
	/*border-top: 2px solid #D8312A;*/
	height: 470px;
	left: 0;
	right: 0;
	margin: auto;
	top: 0;
	bottom: 0;
	border-radius: 10px;
	background: #35394a;
	background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, #35394a),
		color-stop(100%, rgb(0, 0, 0)));
	background: -webkit-linear-gradient(230deg, rgba(53, 57, 74, 0) 0%,
		rgb(0, 0, 0) 100%);
	background: linear-gradient(230deg, rgba(53, 57, 74, 0) 0%, rgb(0, 0, 0)
		100%);
}

.div-wel {
	width: 450px;
	height: 60px;
	/*margin-top: 400px;*/
	font-family: "宋体";
	font-size: 35px;
	color: white;
	text-align: center;
	padding-top: 14px;
}

.btn-log {
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
	width: 100px;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	font-family: "宋体";
	border-radius: 7px;
}

.in-size {
	height: 30px;
}

.la-size {
	color: white;
	font-size: 18px;
	width: 100px;
}

.my-form {
	position: absolute;
	width: 350px;
	/*border-top: 2px solid #D8312A;*/
	left: -18px;
	right: 0;
	margin: auto;
	top: 80px;
	bottom: 0;
}
</style>
</head>

<body>
	<div class="div-logArea">
		<div class="div-wel">欢 迎 注 册</div>

		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label la-size">账号：</label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required"
						placeholder="请输入用户名" class="layui-input" id="acc">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label la-size">密码：</label>
				<div class="layui-input-inline">
					<input type="password" required lay-verify="required"
						placeholder="请输入密码" class=" layui-input" id="pwd">
				</div>

			</div>

			<div class="layui-form-item">
				<label class="layui-form-label la-size">重复密码：</label>
				<div class="layui-input-inline">
					<input type="password" required lay-verify="required"
						placeholder="请输入重复密码" class="layui-input" id="repwd">
				</div>

			</div>

			<div class="layui-form-item">
				<label class="layui-form-label la-size">昵称：</label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required"
						placeholder="请输入昵称" class="layui-input" id="name">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label la-size">手机号：</label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required|phone"
						placeholder="请输入手机号" class="layui-input" id="phone">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label la-size">Email：</label>
				<div class="layui-input-inline">
					<input type="text" required lay-verify="required|email"
						placeholder="请输入Email" class="layui-input" id="email">
				</div>

			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="reg">注册</button>
					<a href="login.html" class="layui-btn layui-btn-primary">返回</a>
				</div>
			</div>
		</div>
	</div>
<span id="rsa" style="display:none"></span>
</body>

<script type="text/javascript" src="3rd/Particleground.js"></script>
<script src="https://cdn.bootcss.com/jsencrypt/3.0.0-rc.1/jsencrypt.min.js"></script>
<script>


test();
function test(){
	
	$.ajax({
		url : "rsaPublic.action",
		type : "post",
		data : {
		},
		dataType : "json",
		success : function(msg) {
           $("#rsa").text(msg.pub);

		},
		error : function() {
			alert("请求失败！");
		}
	});
}
	//Demo
	layui.use('form', function() {
		var form = layui.form;

		//监听提交
		form.on('submit(reg)', function(data) {
			
			var encrypt = new JSEncrypt();
			encrypt.setPublicKey($("#rsa").text());
			$.ajax({
						url : "do-reg.action",
						type : "POST",
						data : {
							"acc" : $("#acc").val(),
							"pwd" : encrypt.encrypt($("#pwd").val()),
							"repwd" :encrypt.encrypt($("#repwd").val()),
							"name" : $("#name").val(),
							"phone" : $("#phone").val(),
							"email" : $("#email").val()
						},
						dataType : "json",

						success : function(msg) {
							if (msg.type == "success") {
								layer.msg('注册成功！请登录！', {
									icon : 1,
									time : 1000, //1s后自动关闭
								});
								window.setTimeout(
										"window.location='login.html'", 1000);
							} else if (msg.type == "illegal") {
								layer.msg('非法操作！', {
									icon : 2,
									time : 1000, //1s后自动关闭
								});
							} else if (msg.type == "repwdWrong") {
								layer.msg('重复密码和密码不一致！', {
									icon : 2,
									time : 1000, //1s后自动关闭
								});
							} else if (msg.type == "accRepeat") {
								layer.msg('账号已存在！', {
									icon : 2,
									time : 1000, //1s后自动关闭
								});
							} else if (msg.type == "nameRepeat") {
								layer.msg('昵称已存在！', {
									icon : 2,
									time : 1000, //1s后自动关闭
								});
							} else {
								layer.msg('注册失败！', {
									icon : 2,
									time : 1000, //1s后自动关闭
								});
							}
						},
						error : function() {
							layer.msg('请求失败！', {
								icon : 5,
								time : 1000, //1s后自动关闭
							});
						}
					});
		});
	});

	//粒子背景特效
	$('body').particleground({
		dotColor : '#E8DFE8',
		lineColor : '#133b88'
	});
</script>

</html>
