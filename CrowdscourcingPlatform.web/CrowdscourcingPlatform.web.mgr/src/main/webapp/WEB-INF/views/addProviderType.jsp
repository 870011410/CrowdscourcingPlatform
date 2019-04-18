<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style>
			body {}
			
			.my-form {
				width: 520px;
				/*border-top: 2px solid #D8312A;*/
				margin: auto;
				top: 80px;
				bottom: 0;
			}
		</style>
	</head>

	<body>

		<!-- 添加一个需求类型的弹出层（添加界面） -->
		<br />
		<br />
		<h1 align="center">新增服务商类型</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 200px;font-size: 20px;">服务商类型名称：</label>
				<div class="layui-input-block">
					<input id="in-name" lay-verify="required" class="layui-input" style="width: 200px;">
				</div>
			</div>

			<div class="layui-form-item" style="text-align: center;">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="sent">
						<i class="layui-icon layui-icon-auz">&nbsp;确定</i> 
					</button>
<!-- 					<input type="button" class="layui-btn layui-btn-primary" id="close" value="返回" onclick="closeNow()"> -->
					<button class="layui-btn layui-btn-primary" id="close" value="返回" onclick="closeNow()">
						<i class="layui-icon layui-icon-return">&nbsp;返回</i> 
					</button>
				</div>
			</div>

		</div>

		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			//导入form样式

			layui.use('form', function() {
				var form = layui.form;
				form.on('submit(sent)', function(data) {
					//新增服务商类型

					var name = $("#in-name").val().trim(); //服务类型名称
					$.ajax({
						url: "addProviderType.action",
						type: "post",
						data: {
							"name": name,

						},
						dataType: "json",
						success: function(msg) {
							if(msg.type == "SUC") {
								parent.layer.msg('新增类型成功！',{
									icon: 6,
								    time: 1000, //1s后自动关闭
								  });
 								closeNow(); 
								parent.refushJp();

							} else {
								parent.layer.msg(msg.type,{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}
						},

						error: function() {
							parent.layer.msg('请求失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
					});
				});

			});
			var index = parent.layer.getFrameIndex(window.name);
			function closeNow() {
				parent.layer.close(index);
			} 
		</script>
	</body>

</html>