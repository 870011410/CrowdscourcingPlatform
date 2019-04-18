<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>新增规则</title>
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
		<h1 align="center">新增规则</h1>
		<br />
		<br />
			<div class="layui-form my-form" action="">
		
 			<div class="layui-form-item">
				<label class="layui-form-label">规则类型：</label>
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-input-inline" style="width: 300px;">
						<select name="" required lay-verify="required" id="create-ruleType" >
							<option value=""></option>
						</select>
					</div>
				</form>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">规则内容：</label>
				<div class="layui-input-block">
					<textarea id="create-content" class="layui-textarea" style="resize:none;width: 300px;" required lay-verify="required"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">扣分：</label>
				<div class="layui-input-block">
					<input type="id" id="create-score" autocomplete="off" class="layui-input" style="width: 300px;" required lay-verify="required">
				</div>
			</div>
 			<div class="layui-form-item">
				<label class="layui-form-label">状态：</label>
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-input-inline" style="width: 300px;">
						<select name="" required lay-verify="required" id="create-ruleState">
							<option value=""></option>
							<option value="0">未上线</option>
							<option value="1">已上线</option>
						</select>
					</div>
				</form>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="sureCreate" > <!-- onclick="sureCreateRule()" -->
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
				var form = layui.form;
				selectRuleType(form);
				form.on('submit(sureCreate)',function(data){		
					var ruleType=$("#create-ruleType option:selected").val().trim();
					var ruleContent=$("#create-content").val().trim();
					var ruleScore=$("#create-score").val().trim();
					var ruleState=$("#create-ruleState option:selected").val().trim(); 
					
//					alert("规则:"+ruleType+"规则内容："+ruleContent+"分数："+ruleScore+"状态："+ruleState);
					$.ajax({
						url: "do-createRule.action",
						type: "post",
						data: {
							"rteId": ruleType,
							"content": ruleContent,
							"score": ruleScore,
							"state":ruleState
						},
						dataType: "json",
						success: function(msg) {
//							alert("这是传回来的index"+msg.index);
							if (msg.index>0) {
								closeNow();
								parent.searchRule();
								parent.layer.msg('新增成功',{icon: 6,time: 1000});
							}else{
								layer.msg('新增失败',{icon: 5,time: 1000});
							}

						},
						error: function() {
							layer.msg('请求失败！',{icon: 5});
						}
					});
				});
			});
			
			
			
			//获取规则类型下拉框
			function selectRuleType(form){
				$.ajax({
					url : "selectRuleType.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到规则类型信息
						var ruleTypes= msg.ruleTypes;
						
						for(var i=0;i<ruleTypes.length;i++){
							$("#create-ruleType").append("<option value="+ruleTypes[i].id+" >"+ruleTypes[i].name+"</option>");
							
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
			
		
			
			//确认新增规则的方法
			function sureCreateRule(){		
				var ruleType=$("#create-ruleType option:selected").val().trim();
				var ruleContent=$("#create-content").val().trim();
				var ruleScore=$("#create-score").val().trim();
				var ruleState=$("#create-ruleState option:selected").val().trim(); 
				
//				alert("规则:"+ruleType+"规则内容："+ruleContent+"分数："+ruleScore+"状态："+ruleState);
				$.ajax({
					url: "do-createRule.action",
					type: "post",
					data: {
						"rteId": ruleType,
						"content": ruleContent,
						"score": ruleScore,
						"state":ruleState
					},
					dataType: "json",
					success: function(msg) {
//						alert("这是传回来的index"+msg.index);
						if (msg.index>0) {
							closeNow();
							parent.searchRule();
							parent.layer.msg('新增成功',{icon: 6,time: 1000});
						}else{
							layer.msg('新增失败',{icon: 5,time: 1000});
						}

					},
					error: function() {
						layer.msg('请求失败！',{icon: 5});
					}
				});

			}
		</script>

		<body>
			<html>
