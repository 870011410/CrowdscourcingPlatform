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
		<h1 align="center">修改友情链接</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">链接名：</label>
				<div class="layui-input-block">
					<input type="id" id="name" autocomplete="off" class="layui-input" required lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">链接：</label>
				<div class="layui-input-block">
					<textarea id="link" class="layui-textarea" style="resize:none;" required lay-verify="required"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="updateLinker" >
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
			var form;
			//Demo
			layui.use('form', function() {
				form = layui.form;
				
				//点击“确定”按钮触发
				form.on('submit(updateLinker)',function(data){
					updateLinker();
				});
			});

			var index = parent.layer.getFrameIndex(window.name);

			function closeNow() {
				parent.layer.close(index);
			}

			var select_id = "";
			var dataHere;
			//子类接收数据方法
			function inputDataHandle(data) {
				$("#name").val(data[0]);
				$("#link").val(data[1]);
				select_id = data[2];
			}
			
			function updateLinker() {
				var name = $("#name").val();
				var link = $("#link").val();

				$.ajax({
					url: "do-updateLinker.action",
					type: "post",
					data: {
						"name": name,
						"link": link,
/* 						"admName": "第一个管理员", */
						"select_id": select_id
					},
					dataType: "json",
					success: function(msg) {

						if (msg.type == "success") {
							closeNow();
							parent.layer.msg('修改成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							parent.showLinkers();
						} else if (msg.type == "nameExist") {
							layer.msg('链接名已存在，修改失败！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						} else {
							layer.msg('修改失败！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //20s后自动关闭
						  });
					}
				});

			}
		</script>
		<body>
			<html>
