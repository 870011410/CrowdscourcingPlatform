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
	width: 600px;
	/*border-top: 2px solid #D8312A;*/
	font-size: 16px;
	margin-top: 50px;
	bottom: 0;
}

.layui-col-space15 {
	margin: 0px;
}

.layui-btn-primary {
	margin-left: 5px;
}

.layui-form-item {
	margin-top: 8px;
}

.layui-fluid {
	padding: 10px 12px;
}

.layui-upload-img {
	border-radius: 50px;
}

.imgHead {
	position: absolute;
	margin-left: 675px;
	margin-top: -380px;
}
</style>
</head>

<body>
	<div class="layui-form my-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">联盟昵称：</label>
			<div class="layui-input-block">
				<input type="id" id="name" autocomplete="off" class="layui-input">
			</div>
		</div>
       <div class="layui-form-item">
			<label class="layui-form-label">联盟盟主：</label>
			<div class="layui-input-block">
				<input type="id" id="leaMaster" autocomplete="off" class="layui-input" readonly="readonly">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联盟介绍：</label>
			<div class="layui-input-block">
				<textarea id="memo"></textarea>
			</div>
		</div>

		

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="newLeagure()">新建</button>
				<button class="layui-btn layui-btn-primary " onclick="closeNow()">返回</button>
			</div>
		</div>

		<span style="display: none;" id="sessionName">${user.name}</span> 
	</div>
	<div class="layui-input-inline" style="display: none;">
		<input type="text" name="head" lay-verify="required" id="inputimgurl"
			placeholder="图片地址" value="" class="layui-input">
	</div>
	<div class="imgHead">
		<div class="layui-input-inline">
			<div class="layui-upload-list">
				<img src="" id="srcimgurl" class="layui-upload-img">
			</div>
		</div>
		<br>
		<div class="layui-input-inline layui-btn-container"
			style="width: auto;">
			<button class="layui-btn layui-btn-primary" id="editimg">添加图标</button>
		</div>
	</div>

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
	<script src="3rd/Content/ace/ace.js"></script>
	<script type="text/javascript"
		src="3rd/layui/static/cropper/cropper.js"></script>
	<script type="text/javascript"
		src="3rd/layui/static/cropper/croppers.js"></script>
	<script>
		//修改头像
		layui.config({
					base : '3rd/layui/static/cropper/' //layui自定义layui组件目录
				})
				.use(
						[ 'form', 'croppers' ],
						function() {
							var $ = layui.jquery, form = layui.form, croppers = layui.croppers, layer = layui.layer;

							//创建一个头像上传组件
							croppers.render({
								elem : '#editimg',
								saveW : 100 //保存宽度
								,
								saveH : 100,
								mark : 1 //选取比例
								,
								area : '900px' //弹窗宽度
								,
								url : "test.action" //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
								,
								done : function(url) { //上传完毕回调

									$("#inputimgurl").val(url);
									$("#srcimgurl").attr('src',
											url + "?t=" + Math.random());

								}
							});

						});

		var layedit;
		var index;
		var form;
		//Demo
		layui.use([ 'layedit', 'layer', 'jquery', 'upload', 'form' ],
				function() {
					var $ = layui.jquery;
					var layer = layui.layer;
					layedit = layui.layedit;
					var upload = layui.upload;
					form = layui.form;

					layedit.set({

						tool : [ 'strong', 'italic', 'underline', 'del', '|',
								'fontFomatt', 'fontfamily', 'fontSize',
								'fontBackColor', 'colorpicker', 'face', '|',
								'table', 'customlink', 'fullScreen' ],
						height : '40%'
					});
					/* $("#memo").val($("#sessionMemo").text()); */
					index = layedit.build('memo');

					showInfo();
				});

		function showInfo() {
			$("#leaMaster").val($("#sessionName").text());
			form.render();
			
		}

		function closeNow() {
			window.location.href = "";
		}

		function newLeagure() {
			var name = $("#name").val().trim();
			var content = layedit.getContent(index);
			var src = $("#inputimgurl").val();
            
			if(name==""){
				layer.msg('请输入联盟名！', {
					icon : 2,
					time : 1000, //20s后自动关闭
				});
				return;
			}
			if(content==""){
				layer.msg('请输入联盟介绍！', {
					icon : 2,
					time : 1000, //20s后自动关闭
				});
				return;
			}
			if(src==""){
				layer.msg('请选择联盟图标！', {
					icon : 2,
					time : 1000, //20s后自动关闭
				});
				return;
			}
			$.ajax({
				url : "newLeagure.action",
				type : "post",
				data : {
					"leaName" : name,
					"content" : content,
					"src" : src
				},
				dataType : "json",
				success : function(msg) {
                   if(msg.res=="illegal"){
                	   layer.msg('有未填写的数据！', {
   						icon : 2,
   						time : 1000, //20s后自动关闭
   					});
                   }else if(msg.res=="typeiszero"){
                	   layer.msg('雇主不能创建联盟！', {
      						icon : 2,
      						time : 1000, //20s后自动关闭
      					});
                   }else if(msg.res=="added"){
                	   layer.msg('您已加入过联盟了！', {
     						icon : 2,
     						time : 1000, //20s后自动关闭
     					});
                   }else if(msg.res=="suc"){
                	   parent.layer.msg('联盟创建成功！等待管理员审核！', {
    						icon : 1,
    						time : 1000, //20s后自动关闭
    					});
                	   parent.myNeed();
                   }else if(msg.res=="reapet"){
                	   layer.msg('联盟名字重复！', {
   						icon : 2,
   						time : 1000, //20s后自动关闭
   					});
                   }else{
                	   layer.msg('联盟创建失败！', {
   						icon : 2,
   						time : 1000, //20s后自动关闭
   					});
                   }

				},
				error : function() {
					layer.msg('请求失败！', {
						icon : 2,
						time : 1000, //20s后自动关闭
					});
				}
			});

		}
	</script>
<body>
<html>