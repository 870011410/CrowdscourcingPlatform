<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
		<style>
			.my-form {
				width: 500px;
				/*border-top: 2px solid #D8312A;*/
				margin: auto;
				top: 80px;
				bottom: 0;
			}
			.div-img{
				color: #01AAED;
				width: 150px;
				text-align: center;
			}
			.div-img:hover{
				cursor:pointer;
				color: #5FB878;
				border: 1px solid #5FB878;
			}
			.my-btn{
			    height: 25px;
    			line-height: 25px;
    			width: 150px;
			}
		</style>
	</head>

	<body>
		<br />
		<br />
		<h2 align="center">作品修改</h2>
		<br />
		<br />
		<div class="layui-form my-form" action="">

			<div class="layui-form-item">
				<label class="layui-form-label">标题：</label>
				<div class="layui-inline " style="width: 200px;">
					<input id="in-title" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">金额：</label>
				<div class="layui-inline " style="width: 200px;">
					<input id="in-money" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">作品类型：</label>
				<div class="layui-inline " style="width: 200px;">
					<select name="" lay-verify="required" id="in-type">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
					<label class="layui-form-label">作品内容：</label>
					<div class="layui-input-block">
						<textarea id="in-content" ></textarea>
					</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">作品图片：</label>
				<div class="layui-input-block">
					<img src="img/1.jpg"  height="150px" width="150px" id="in-img"/>
				</div>
				
				
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					
  				<button type="button" class="layui-btn layui-btn-primary my-btn" id="div-img">修改图片</button>

				</div>
					
				</div>
			

			<div class="layui-form-item">
			<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="sent"">
						<i class='layui-icon layui-icon-auz'>&nbsp;确定</i>
					</button>
					<button class="layui-btn layui-btn-primary " onclick="closeNow()">
						<i class='layui-icon layui-icon-return'>&nbsp;返回</i>
					</button>
				</div>
			</div>

		</div>

		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
		<script src="3rd/Content/ace/ace.js"></script>
		<script>
		
			//Demo
			layui.use(['layedit', 'layer', 'jquery', 'upload','form'], function() {
				var $ = layui.jquery;
				var	layer = layui.layer;
				var	layedit = layui.layedit;
				var upload = layui.upload;
				var form = layui.form;
				layedit.set({
					tool: [
						'strong', 'italic', 'underline', 'del', '|', 'fontFomatt', 'fontfamily', 'fontSize', 'fontBackColor', 'colorpicker', 'face', '|', 'table', 'customlink', 'fullScreen'
					],
					height: '30%'
				});
				var index = layedit.build('in-content');
				selectNeedType(form);
				upload.render({
					elem: '#div-img',
					url: 'motifyWorkImg.action',
					size: 50,
					done: function(msg,index,upload) {
						$("#in-img").attr('src',msg.src)
						layer.msg('上传成功！', {
							icon: 1,
							time: 1000, //1s后自动关闭
						});
					}
				});
				form.on('submit(sent)', function(data) {
					 //修改作品
					 $.ajax({
							url : "motifyMyWork.action",
							type : "post",
							data : {
								"workId":workId,
								"title":$("#in-title").val(),
								"money":$("#in-money").val(),
								"typeId":$("#in-type").val(),
								"content":layedit.getContent(index),
								"img":$("#in-img").attr('src'),
							},
							dataType : "json",
							success : function(msg) {
								if (msg.type == "SUC") {
									parent.layer.msg('修改作品成功！', {
										icon: 1,
										time: 1000, //1s后自动关闭
									});
									closeNow();
									parent.findMyWork(); 
								} else {
									layer.msg(msg.type, {
										icon : 2,
										time : 1000, //20s后自动关闭
									});
								}
							},
							
							error : function() {
								alert("请求失败！");
							}
						});
				});

			});
			
			//关闭弹出层
			 var index = parent.layer.getFrameIndex(window.name);

			function closeNow() {
				parent.layer.close(index);
			} 

			var workId = "";
			var typeId ="";
			//子类接收数据方法
			function inputDataHandle(data) {
				workId=data[0];
				$("#in-title").val(data[1]);
				$("#in-money").val(data[2]);
				typeId=data[3];
				$("#in-content").html(data[4]);
				$("#in-img").attr('src',data[5]);
				
			}
			//查询作品所有类型
			function selectNeedType(form) {
				$.ajax({
					url: "selectNeedType.action",
					type: "post",
					data: {},
					dataType: "json",
					success: function(msg) {
						//得到规则类型信息
						var needTypes = msg.needTypes;

						for(var i = 0; i < needTypes.length; i++) {
							$("#in-type").append("<option value=" + needTypes[i].id + " >" + needTypes[i].name + "</option>");

						}

						$("#in-type").val(typeId);
						form.render();
					},

					error: function() {
						layer.msg('请求失败！', {
							icon: 5,
							time: 1000, //1s后自动关闭
						});
					}
				});

			}
 			
		</script>

		<body>
			<html>