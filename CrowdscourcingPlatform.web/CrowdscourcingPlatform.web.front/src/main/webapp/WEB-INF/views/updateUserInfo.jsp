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
	top: 80px;
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
	margin-top: -410px;
}
</style>
</head>

<body>
	<div class="layui-form my-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">昵称：</label>
			<div class="layui-input-block">
				<input type="id" id="name" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">个人介绍：</label>
			<div class="layui-input-block">
				<textarea id="content"></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">手机号：</label>
			<div class="layui-input-block">
				<input type="id" id="phone" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">邮箱：</label>
			<div class="layui-input-block">
				<input type="id" id="email" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-normal" style="width: 120px; font-size: 15px;" onclick="updateUserInfo()"><i class="layui-icon layui-icon-release">&nbsp;保&nbsp;存</i></button>
				<button class="layui-btn layui-btn-primary" style="width: 120px; font-size: 15px;" onclick="closeNow()"><i class="layui-icon layui-icon-return">&nbsp;返&nbsp;回</i></button>
			</div>
		</div>

		<span style="display: none;" id="sessionName">${user.name}</span> <span
			style="display: none;" id="sessionContent">${user.memo}</span> <span
			style="display: none;" id="sessionPhone">${user.phone}</span> <span
			style="display: none;" id="sessionEmail">${user.email}</span>
	</div>
	<div class="layui-input-inline" style="display: none;">
		<input type="text" name="head" lay-verify="required" id="inputimgurl"
			placeholder="图片地址" value="${user.src}" class="layui-input">
	</div>
	<div class="imgHead">
		<div class="layui-input-inline">
			<div class="layui-upload-list">
				<img src="${user.src}" id="srcimgurl" class="layui-upload-img" style="width:100px;height:100px;">
			</div>
		</div>
		<br>
		<div class="layui-input-inline layui-btn-container"
			style="margin-left: -20px;">
			<button class="layui-btn layui-btn-primary" id="editimg"><i class="layui-icon layui-icon-camera">&nbsp;修改头像</i></button>
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
		layui
				.config({
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
								area : '800px' //弹窗宽度
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
					index = layedit.build('content');

					showInfo();
				});

		function showInfo() {
			$("#name").val($("#sessionName").text());
			$("#content").val($("#sessionContent").html());
			$("#phone").val($("#sessionPhone").text());
			$("#email").val($("#sessionEmail").text());

			form.render();
			index = layedit.build('content');
		}

		function closeNow() {
			window.location.href = "showUserInfo.html";
		}

		function updateUserInfo() {
			var name = $("#name").val().trim();
			var content = layedit.getContent(index);
			var phone = $("#phone").val().trim();
			var email = $("#email").val().trim();
			var src = $("#inputimgurl").val();

			$.ajax({
				url : "do-updateUserInfo.action",
				type : "post",
				data : {
					"name" : name,
					"content" : content,
					"phone" : phone,
					"email" : email,
					"src" : src,
					"select_id" : "${user.id}"
				},
				dataType : "json",
				success : function(msg) {

					if (msg.type == "success") {
						layer.msg('修改成功！', {
							icon : 1,  
							time : 1000, //20s后自动关闭
						});
						parent.$("#imgHead").attr("src",src);
						window.setTimeout(closeNow(), 1000);
					} else if (msg.type == "nameExist") {
						layer.msg('昵称已存在，修改失败！', {
							icon : 2,
							time : 1000, //20s后自动关闭
						});
					} else {
						layer.msg('修改失败！', {
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