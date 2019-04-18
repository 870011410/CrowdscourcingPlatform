<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>修改密码</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style>
		.my-form {
			width: 100%;
 			margin: auto; 
			top: 30px;
			bottom: 0;
		}
		</style>
	</head>

	<body>
		<br />
		<h1 align="center">修改密码</h1>
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label" style="width:100px;">请输入原密码：</label>
				<div class="layui-input-block">
					<input type="text" id="old_pwd" autocomplete="off" class="layui-input" style="width:200px;" required lay-verify="required">
				</div>
			</div>
 			<div class="layui-form-item">
				<label class="layui-form-label" style="width:100px;">请输入新密码：</label>
				<div class="layui-input-block">
					<input type="password" id="new_pwd" autocomplete="off" class="layui-input" style="width:200px;" required lay-verify="required">
				</div>
			</div> 

 			<div class="layui-form-item">
				<label class="layui-form-label" style="width:100px;">确认新密码：</label>
				<div class="layui-input-block">
					<input type="password" id="re_pwd" autocomplete="off" class="layui-input" style="width:200px;" required lay-verify="required">
				</div>
			</div> 

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" onclick="modifyPwd()" lay-submit>
						<i class='layui-icon layui-icon-auz'>&nbsp;确定</i>
					</button>
					<button class="layui-btn layui-btn-primary " onclick="closeNow()">
						<i class='layui-icon layui-icon-return'>&nbsp;返回</i>
					</button>
				</div>
			</div>

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

			var index = parent.layer.getFrameIndex(window.name);
			function closeNow() {
				parent.layer.close(index);
			}
			
			//修改密码的方法
			function modifyPwd() {
				//发送文本框内容

				var old_pwd = $("#old_pwd").val();
				var new_pwd = $("#new_pwd").val();
				var re_pwd = $("#re_pwd").val();
				var now_pwd=${admin.pwd};
/* 				if(old_pwd=="" || new_pwd=="" || re_pwd==""){
					layer.msg('请填写完整',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
					return;
				} */
 				if(old_pwd!=now_pwd){
					layer.msg('原密码错误！请重新输入',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
					return;
				} 
 				if(new_pwd==now_pwd){
					layer.msg('新密码不能与原密码相同',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
					return;
 				}
 				if(new_pwd!=re_pwd){
					layer.msg('两次输入的新密码不一致',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
					return;
 				}
				$.ajax({
					url : "modifyPwd.action",
					type : "post",
					data : {
						"acc" :${admin.acc},							
						"pwd" : new_pwd
					},
					dataType : "json",

					success : function(msg) {
						if (msg.type == "suc") {

							parent.layer.msg('修改成功,请重新登录！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							parent.window.setTimeout(
									"window.location='adminLogin.html'", 1000);
						}else{
							parent.layer.msg('修改失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						closeNow();
					},

					error : function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}

				});
			}



		</script>
		<body>
<html>
