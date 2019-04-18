<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>新增案例</title>
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
		<h1 align="center">新增案例</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">案例标题：</label>
				<div class="layui-input-block">
					<input type="text" id="title"  placeholder="请输入标题" autocomplete="off" class="layui-input" style="width: 350px;" required lay-verify="required">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">账务表ID：</label>
				<div class="layui-inline " style="width: 350px;">
					<select name="" required lay-verify="required" id="search-accId" >
						<option value=""></option>
						
					</select>
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">案例内容：</label>
				<div class="layui-input-block">
					<textarea id="content" placeholder="请输入内容" class="layui-textarea" style="resize:none;width: 350px;" required lay-verify="required"></textarea>
				</div>
			</div>
			
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="createStory" >
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
			//Demo
			layui.use('form', function() {
				var form = layui.form;
				selectAccId(form);
				
				//点击“发布”按钮触发
				form.on('submit(createStory)',function(data){
					createStory();
				});
			});
			
			var index = parent.layer.getFrameIndex(window.name);

			function closeNow() {
				parent.layer.close(index);
			}
			
			function createStory(){
				var title=$("#title").val();
				var sucAccId=$("#search-accId").val();
				var content=$("#content").val();
				
				$.ajax({
					url: "do-createSucCase.action",
					type: "post",
					data: {
						"title": title,
						"sucAccId": sucAccId,
						"content": content
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							closeNow();
							parent.layer.msg('发布成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							parent.showStorys();
						} else if(msg.type == "titleExist"){
/* 							layer.msg('故事标题已存在，发布失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  }); */
						} else if(msg.type == "userStoryExist"){
/* 							layer.msg('雇主已有故事，发布失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  }); */
						} else if(msg.type == "userExist"){
/* 							layer.msg('雇主不存在，发布失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  }); */
						} else{
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
			
			//获取账务表ID下拉框数据
			function selectAccId(form){
				$.ajax({
					url : "selectAccId.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到规则类型信息
						var list= msg.list;
						
						for(var i=0;i<list.length;i++){
							$("#search-accId").append("<option value="+list[i]+" >"+list[i]+"</option>");
							
						}
						form.render();
					},
					
					error : function() {
						alert("请求失败！");
					}
				});
				
			}
			
		</script>
			
	<body> 
<html>