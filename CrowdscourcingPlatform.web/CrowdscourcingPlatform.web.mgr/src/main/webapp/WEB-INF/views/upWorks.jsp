<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<title>layedit demo</title>
		<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
		<style>
			.my-form {
				width: 520px;
				/*border-top: 2px solid #D8312A;*/
				margin-left: 20px;
				padding-top: 50px;
				
				
			}
			
			.div-logArea {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2)
				position: absolute;
				width: 600px;
				height: 600px;
				margin-left: 200px;
				margin-top: 50px;
				border-radius: 10px;
				
				
				
				
			}
		</style>
	</head>

	<body>
		<div class="div-logArea">
			<div class="layui-form my-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">作品标题：</label>
					<div class="layui-input-block">
						<input id="in-title" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作品内容：</label>
					<div class="layui-input-block">
						<textarea id="in-content" ></textarea>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作品金额：</label>
					<div class="layui-input-block">
						<input id="in-money" lay-verify="required" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">作品图片：</label>
					<div class="layui-input-block">
						<div class="layui-upload-drag" id="img">
							<i class="layui-icon"></i>
							<p>点击上传，或将文件拖拽到此处</p>
						</div>
					</div>
				</div>
				<div class="layui-form-item" style="text-align: center;">
					<div class="layui-input-block">
						<button class="layui-btn" id="upWorks" lay-filter="sent">立即提交</button>
						<input type="button" class="layui-btn layui-btn-primary" id="close" value="返回">
					</div>
				</div>
			</div>
		</div>
		<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
		<script src="3rd/Content/ace/ace.js"></script>
		<script>
			layui.use(['layedit', 'layer', 'jquery', 'upload'], function() {
				var $ = layui.jquery;
				var	layer = layui.layer;
				var	layedit = layui.layedit;
				var upload = layui.upload;
				layedit.set({

					tool: [
						'strong', 'italic', 'underline', 'del', '|', 'fontFomatt', 'fontfamily', 'fontSize', 'fontBackColor', 'colorpicker', 'face', '|', 'table', 'customlink', 'fullScreen'
					],
					height: '90%'
				});
				var ieditor = layedit.build('in-content');

				//拖拽上传
				upload.render({
					elem: '#img',
					bindAction: '#upWorks',
					url: 'upWorks.action',
					auto: false,
					size: 50,
					before: function(obj) {
						this.data = {
							"title": $("#in-title").val(),
							"content": $("#in-content").val(),
							"money": $("#in-money").val()
						}
						
						
						//携带额外的数据
						//预读本地文件示例，不支持ie8
						/*	obj.preview(function(index, file, result) {
								$('#imgDiv').attr('style', 'display: block;'); 
								$('#imgPreview').attr('src', result); //图片链接（base64）
							});*/
						/*var index = layer.load(); //开始上传之后打开load层
						$("#hidden_tmp_index").val(index); //将load层的index隐藏到页面中*/
					},
					done: function(res) {
						console.log(res)
					}
				});
			})
		</script>
	</body>

</html>