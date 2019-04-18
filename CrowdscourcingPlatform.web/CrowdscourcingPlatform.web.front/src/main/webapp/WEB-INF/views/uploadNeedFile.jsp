<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<title>上传文件</title>
		<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<style>
			.my-form {
				width: 520px;
				/*border-top: 2px solid #D8312A;*/
				margin-left: 20px;
				padding-top: 20px;
				
				
			}
			
			.div-logArea {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2)
				position: absolute;
				width: 600px;
				height: 700px;
				margin-left: 200px;
				margin-top: 50px;
				border-radius: 10px;
				
				
				
				
			}
		</style>
	</head>

	<body style="margin-top: 60px;">
		<!-- <div class="div-logArea"> -->
			<br>
			  <h1 align="center">上传文件</h1>
			<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
			<h3 align="center">请上传rar文件</h3>
			<div class="layui-form my-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label"></label>
					<div class="layui-input-block">
						<div class="layui-upload-drag" id="img">
							<i class="layui-icon"></i>
							<p>点击上传，或将文件拖拽到此处</p>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="upWorks" lay-filter="sent" style="margin-left:70px" onclick="checkSpan()">立即提交</button>
					</div>
				</div>
			</div>
		<!-- </div> -->
		<div><img id ="my-img" src=""></div>
		
		<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
		<script src="3rd/Content/ace/ace.js"></script>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script>
			layui.use(['element','layer'], function() {
				var element = layui.element;
				var layer = layui.layer;

			});
			var needId;
			function inputDataHandle(data) {
				//投标需求id
				needId=data[0];
				
			}
			layui.use(['layedit', 'layer', 'jquery', 'upload'], function() {
				var $ = layui.jquery;
				var	layer = layui.layer;
				var	layedit = layui.layedit;
				var upload = layui.upload;

				//拖拽上传
				
				upload.render({
					elem: '#img',
					bindAction: '#upWorks',
					url: 'uploadNeedFile.action',
					auto: false,
					accept:'file',
					before: function(obj) {
						
						this.data = {
							"needId": needId
						}

					},
					done: function(msg,index,upload) {
						parent.layer.msg(msg.type,{
							icon: 6,
						    time: 1000, //1s后自动关闭
						  });
						window.setTimeout("location.reload()",1000);
						if(msg.type=="文件上传成功！等待雇主接收！"){
							
							parent.initMyBidedWin();
							var index = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index);
						}
					}
				});
			})
			function checkSpan(){
				
				if($("span").eq(0).text()==""){
					parent.layer.msg('请选择一个文件',{
						icon: 6,
					    time: 1000, //1s后自动关闭
					  });
				}
				
				
			}
		</script>
	</body>

</html>