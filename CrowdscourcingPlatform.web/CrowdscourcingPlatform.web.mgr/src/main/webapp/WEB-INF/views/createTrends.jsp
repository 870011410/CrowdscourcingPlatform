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
		<h1 align="center">发布行业动态</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">动态名：</label>
				<div class="layui-input-block">
					<input type="id" id="name" autocomplete="off" class="layui-input" style="width: 300px;" required lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">链接：</label>
				<div class="layui-input-block">
					<textarea id="link" class="layui-textarea" style="resize:none;width: 300px;" required lay-verify="required"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">服务类型：</label>
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-input-inline" style="width: 300px;">
						<select name="" required lay-verify="required" id="type">
							<option value=""></option>
						</select>
					</div>
				</form>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="createTrends" ">
						<i class='layui-icon layui-icon-release'>&nbsp;发布</i>
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
				
				//点击“发布”按钮触发
				form.on('submit(createTrends)',function(data){
					createTrends();
				});
			});
			
			window.onload = function() {
				selectServerType();
			}
			//下拉框数据的获取（获取服务类型）
			function selectServerType(){
				$.ajax({
					url : "selectServerType.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到的服务类型信息
						var serverTypes= msg.serverTypes;
						//清空数据
					//	$("#check_type").empty();
						//把数据写入下来框中
						for (var i = 0; i < serverTypes.length; i++) {
								$("#type").append(
										"<option value="+serverTypes[i].id+">"
												+ serverTypes[i].name + "</option>");
							}
						form.render();
					},
					error : function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
			}
			
			var index = parent.layer.getFrameIndex(window.name);

			function closeNow() {
				parent.layer.close(index);
			}
			
			function createTrends() {
				var name = $("#name").val();
				var link = $("#link").val();
				var type = $("#type").val();

				$.ajax({
					url: "do-createTrends.action",
					type: "post",
					data: {
						"name": name,
						"link": link,
/* 						"admName": "第一个管理员", */
						"type": type
					},
					dataType: "json",
					success: function(msg) {

						if (msg.type == "success") {
							closeNow();
							parent.layer.msg('发布成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							parent.showTrends();
						} else if (msg.type == "nameExist") {
							layer.msg('动态名已存在，发布失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						} else {
							layer.msg('发布失败！',{
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
