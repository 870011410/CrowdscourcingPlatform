<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
.layui-input {
	width: 200px;
}

.my-form {
	width: 500px;
	/*border-top: 2px solid #D8312A;*/
	margin: auto;
	top: 80px;
	bottom: 0;
}
</style>

</head>


<body>
	<br />
	<br />
	<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">

	<div class="layui-form my-form">
		<div class="layui-form-item">
			<label class="layui-form-label">请输入原密码 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<div class="layui-input-block">
				<input name="title" class="layui-input" type="text"
					placeholder="请输入原密码" autocomplete="off" lay-verify="title" >
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">请输入新密码 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<div class="layui-input-block">
				<input name="title" class="layui-input" type="text"
					placeholder="请输入原密码" autocomplete="off" lay-verify="title" id="pwd">
			</div>
		</div>

		<div class="layui-form-item">	
				<label class="layui-form-label">确认新密码 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="layui-input-block">
					<input name="title" class="layui-input" type="text"
						placeholder="请输入原密码" autocomplete="off" lay-verify="title" id="pwd1">
				</div>
			</div>
	


		<br /> <br />

		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="layui-btn layui-btn-lg layui-btn-warm"
				onclick="tomodify()">修 改</button>
		</div>
	



		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
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
			//修改密码的方法
			function tomodify() {
				//发送文本框内容

				var pwd = $("#pwd").val();
				var pwd1 = $("#pwd1").val();
/* 				var admin_acc=$("#admin_acc").text(); */

				if (pwd == pwd1) {
					$.ajax({

						url : "modifyPwd.action",
						type : "post",
						data : {
							"acc" :${admin.acc},							
							"pwd" : pwd

						},
						dataType : "json",

						success : function(msg) {

							if (msg.type == "suc") {

								alert("修改成功");
							}

						},

						error : function() {
							alert("修改失败！");
						}

					});
				}
			}

			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer;//执行一个laydate实例 

				//修改
				window.create = function() {
					layer.open({
						type : 2,
						title : false,
						shade : [ 0.2 ],
						area : [ '500px', '450px' ],
						content : 'modifyPwd.html', //iframe的url，no代表不显示滚动条
					});
				}
			});

			//发送一个ajax 请求  发送给loginservlet
		</script>
</body>

</html>