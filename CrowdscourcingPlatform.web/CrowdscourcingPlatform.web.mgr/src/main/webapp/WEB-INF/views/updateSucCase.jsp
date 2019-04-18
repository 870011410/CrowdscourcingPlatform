<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>案例修改</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style>
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
		<h1 align="center">修改案例</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">案例标题：</label>
				<div class="layui-input-block">
					<input type="text" id="title" autocomplete="off" class="layui-input" required lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">案例内容：</label>
				<div class="layui-input-block">
					<textarea id="content" class="layui-textarea" style="resize:none;" required lay-verify="required"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="updateSucCase" >
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

				//点击“确定”按钮触发
				form.on('submit(updateSucCase)', function(data) {
					askUpdateSucCase();
				});

			});

			var index = parent.layer.getFrameIndex(window.name);
			function closeNow() {
				parent.layer.close(index);
			}

			var select_id = "";
			//子类接收数据方法
			function inputDataHandle(data) {
				$("#title").val(data[0]);
/* 				$("#useName").val(data[1]); */
				$("#content").val(data[1]);
				select_id = data[2];
			}
			
			function askUpdateSucCase(){
				layer.confirm('确定要修改吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						updateSucCase();
					}
				);
			}
			
			function updateSucCase() {
				var title = $("#title").val();
				var content = $("#content").val();
/* 				alert(select_id); */

				$.ajax({
					url: "do-modifySucCase.action",
					type: "post",
					data: {
						"title": title,
						"content": content,
						"id": select_id
					},
					dataType: "json",
					success: function(msg) {

						if (msg.type == "success") {
							closeNow();
							parent.layer.msg('修改成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							parent.showStorys();
						} else if (msg.type == "titleExist") {
/* 							layer.msg('故事标题已存在，修改失败！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  }); */
						} else {
							layer.msg('修改失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}

					},
					error: function() {
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
