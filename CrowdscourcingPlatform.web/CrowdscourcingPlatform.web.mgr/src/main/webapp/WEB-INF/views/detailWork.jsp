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
.div-size{
	border:1px solid #e2e2e2;
	height: 150px;
}
.div-inner{
	width: 370px;
	height: 132px;
	margin: 8px;
	
}
</style>
</head>

<body>
	<br />
	<br />
	<h1 align="center">作品详情</h1>
	<br />
	<br />
	<div class="layui-form my-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名：</label>
			<div class="layui-input-block">
				<input type="id" id="useName" autocomplete="off" class="layui-input"
					readonly="readonly">
			</div>
		</div>

		<div class="layui-form-item " >
			<label class="layui-form-label" >作品内容：</label>
			<div class="layui-input-block div-size" >
				<div id="div-content" class="div-inner">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-primary " id="close">
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
		$('#close').click(function(){
		    parent.layer.close(index);
		});
		
		//子类接收数据方法
		function inputDataHandle(data){
			$("#useName").val(data[0]);
/* 			alert(data[2]); */
			$("#div-content").append(data[2]);
		}
	</script>
<body>
<html>