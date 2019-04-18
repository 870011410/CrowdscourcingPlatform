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
	margin-left: 50px;
	margin-top: 20px;

	bottom: 0;
	font-size: 16px;
}
</style>
	</head>

	<body>
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">原密码：</label>
				<div class="layui-input-block">
					<input type="password" id="oldPwd" required lay-verify="required" placeholder="请输入原密码" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">新密码：</label>
				<div class="layui-input-block">
					<input type="password" id="newPwd" required lay-verify="required" placeholder="请输入新密码" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">确认密码：</label>
				<div class="layui-input-block">
					<input type="password" id="confirmPwd" required lay-verify="required" placeholder="请输入确认密码" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-normal" lay-submit lay-filter="updatePwd" style="width:120px;"><i class='layui-icon layui-icon-edit'>&nbsp;修&nbsp;改</i></button>
				</div>
			</div>

		</div>
<span id="rsa" style="display:none"></span>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script src="https://cdn.bootcss.com/jsencrypt/3.0.0-rc.1/jsencrypt.min.js"></script>
		<script>
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
			//Demo
			layui.use('form', function() {
				var form = layui.form;
                 
				//监听提交
				form.on('submit(updatePwd)', function(data) {
					//rsa加密对象
					var encrypt = new JSEncrypt();
					encrypt.setPublicKey($("#rsa").text());
					$.ajax({
						url: "do-updatePwd.action",
						type: "POST",
						data: {
							"oldPwd": encrypt.encrypt($("#oldPwd").val()),
							"newPwd": encrypt.encrypt($("#newPwd").val()),
							"confirmPwd": encrypt.encrypt($("#confirmPwd").val())
						},
						dataType: "json",

						success: function(msg) {
							if (msg.type == "success") {
								layer.msg('修改成功！请重新登录！', {
									icon: 1,
									time: 1000, //1s后自动关闭
								});
								parent.window.setTimeout(
									"window.location='login.html'", 1000);
							} else if (msg.type == "confirmPwdWrong") {
								layer.msg('重复密码和密码不一致！', {
									icon: 2,
									time: 1000, //1s后自动关闭
								});
							} else if (msg.type == "oldPwdWrong") {
								layer.msg('原密码错误！', {
									icon: 2,
									time: 1000, //1s后自动关闭
								});
							} else {
								layer.msg('修改失败！', {
									icon: 2,
									time: 1000, //1s后自动关闭
								});
							}
						},
						error: function() {
							layer.msg('请求失败！', {
								icon: 5,
								time: 1000, //1s后自动关闭
							});
						}
					});
				});
			});
		</script>
		<body>
			<html>
