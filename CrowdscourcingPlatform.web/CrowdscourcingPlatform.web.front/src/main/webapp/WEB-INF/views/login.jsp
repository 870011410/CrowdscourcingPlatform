<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
body {
	background-image: url(img/login.jpg);
	background-size: cover;
}

.div-logArea {
	/*background-color:darkgrey;*/
	width: 450px;
	height: 450px;
	margin-top: 100px;
	margin-left: 50%;
	border-radius: 10px;
	background-color: rgba(96, 96, 96, 0.3);
}

.div-wel {
	width: 450px;
	height: 60px;
	/*margin-top: 400px;*/
	font-family: "宋体";
	font-size: 45px;
	color: white;
	text-align: center;
	padding-top: 20px;
}

.input-acc, .input-pwd {
	border-radius: 7px;
	height: 30px;
	width: 260px;
	margin-top: 40px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 32px;
}

.form-div {
	position: relative;
	width: 296px;
	margin-left: auto;
	margin-right: auto;
}

.ranimg {
	height: 33px;
	width: 110px;
}

.input-code {
	border-radius: 7px;
	height: 30px;
	width: 100px;
	margin-top: 40px;
	padding-left: 32px;
}

.img-div {
	float: right;
	margin-top: 42px;
}

.btn-log {
	/* display: block; */
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
	width: 140px;
	height: 40px;
	font-size: 20px;
	font-weight: bold;
	font-family: "宋体";
	border-radius: 7px;
}

.form-img {
	position: absolute;
	z-index: 2;
	width: 30px;
	height: 30px;
	top: 42px;
	left: 2px;
}
</style>
</head>
<body>
<h1><%=request.getLocalPort()%></h1>
<h1><%=request.getSession().getId() %></h1>

	<div class="div-logArea">
		<div class="div-wel">登 录</div>

		<hr width=90%>
		<form action="do-login.action" method="post">
			<div class="form-div">
				<img class="form-img" src="img/11.png"> <input
					class="input-acc" required lay-verify="required" type="text"
					placeholder="请输入账号" id="acc" name="acc" />
			</div>
			<div class="form-div">
				<img class="form-img" src="img/22.png"> <input
					class="input-pwd" required lay-verify="required" type="password"
					placeholder="请输入密码" id="pwd" name="pwd" />
			</div>
			<div class="form-div">
				<input class="input-code" type="text" placeholder="验证码" id="code" />
				<div class="img-div">
					<img class="ranimg" src="do-ranImage.action" alt="验证码图" id="ranimg" />
				</div>
			</div>
			<br /> 
			<div align="center">
				<button class="layui-btn layui-btn-normal btn-log" type="button"
					onclick="reg()">注 册</button>
				<button class="layui-btn layui-btn-normal btn-log" type="button"
					onclick="login()">登 录</button>
			</div>
			<br />
		</form>
	</div>
	<span id="rsa" style="display:none"></span>
	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script src="https://cdn.bootcss.com/jsencrypt/3.0.0-rc.1/jsencrypt.min.js"></script>
	<script type="text/javascript">
	
	//获得公钥
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
		//导入form样式
		layui.use('form', function() {
			var form = layui.form;

		});

		$("#ranimg").click(
				function() {
					$("#ranimg").attr("src",
							"do-ranImage.action?num=" + Math.random());
				});

		//登录
		function login() {
			//rsa加密对象
			var encrypt = new JSEncrypt();
			encrypt.setPublicKey($("#rsa").text());
			if ($("#acc").val().length <= 0) {
				layer.msg('请输入账号！', {
					icon : 2,
					time : 1000, //20s后自动关闭
				});
				return;
			}
			if ($("#pwd").val().length <= 0) {
				layer.msg('请输入密码！', {
					icon : 2,
					time : 1000, //20s后自动关闭
				});
				return;
			}
			if ($("#code").val().length <= 0) {
				layer.msg('请输入验证码！', {
					icon : 2,
					time : 1000, //20s后自动关闭
				});
				return;
			}

			$.ajax({
				url : "do-login.action",
				type : "POST",
				data : {
					"type" : "do-login",
					"acc" : $("#acc").val(),
					"pwd" :encrypt.encrypt($("#pwd").val()),
					"code" : $("#code").val()
				},
				dataType : "json",

				success : function(msg) {
					if (msg.type == "success") {
						layer.msg('登录成功！', {
							icon : 1,
							time : 800, //20s后自动关闭
						});
						var user = msg.user;

						//**判断角色是什么，跳转至不同界面
						if (user.type == 0) {
							window.setTimeout(
									"window.location='homePage.html'", 800);
						} else {
							window.setTimeout(
									"window.location.href = 'homePage.html'",
									800);
						}

					} else if (msg.type == "illegal") {
						layer.msg('非法操作！', {
							icon : 2,
							time : 1000, //20s后自动关闭
						});
					} else if (msg.type == "codeWrong") {
						layer.msg('验证码不一致！', {
							icon : 2,
							time : 1000, //20s后自动关闭
						});
						$("#code").val("");
						$("#ranimg").attr("src",
								"do-ranImage.action?num=" + Math.random());
					} else {
						layer.msg('登录失败，账号或密码错误！', {
							icon : 2,
							time : 1000, //20s后自动关闭
						});
						$("#pwd").val("");
						$("#code").val("");
						$("#ranimg").attr("src",
								"do-ranImage.action?num=" + Math.random());
					}
				},
				error : function() {
					layer.msg('请求失败！', {
						icon : 5,
						time : 1000, //20s后自动关闭
					});
				}
			});
		}
		
		//跳转到注册界面
		function reg(){
			window.location.href="reg.html";
		}
	</script>
</body>
</html>
