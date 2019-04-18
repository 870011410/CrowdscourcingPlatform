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
				width: 450px;
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
		<h1 align="center">发布违规</h1>
		<br />
		<br />
		<div class="layui-form my-form" >

			<div class="layui-form-item">
				<label class="layui-form-label">用户名称：</label>
				<div class="layui-inline " style="width: 300px;">
					<select name="" lay-verify="required" id="in-user">
						<option value=""></option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">规则类型：</label>
				<div class="layui-inline " style="width: 300px;">
					<select name="" lay-verify="required" id="in-rule" lay-filter="se-filter" >
						<option value=""></option>
						
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">规则编号：</label>
				<div class="layui-inline " style="width: 300px;">
					<select name="" lay-verify="required" id="in-ruleId" lay-filter="rule-filter"> 
						
					</select>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">规则内容：</label>
				<div class="layui-input-block">
					<textarea id="content" class="layui-textarea" readonly="readonly" style="resize:none;width: 300px;"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="sent">
						<i class='layui-icon layui-icon-release'>&nbsp;发布</i>
					</button>
					<button class="layui-btn layui-btn-primary" id="close">
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
				selectUser(form);
				selectRuleType(form);
				//规则编号随规则类型变化
				form.on('select(se-filter)', function(data){
					$("#in-ruleId").empty();
					$("#content").val("");
					 var option=$("#in-rule option:selected");
					 
					 if(option.val()==""){
						form.render(); 
						return;
					 }
					 //规则类型ID查规则ID
					 $.ajax({
							url : "selectRuleId.action",
							type : "post",
							data : {
								"id":option.val()
							},
							dataType : "json",
							success : function(msg) {
								//得到规则类型信息	
								var rules= msg.rules;
								
								for(var i=0;i<rules.length;i++){
									$("#in-ruleId").append("<option value="+rules[i].id+" >编号"+rules[i].id+"</option>");
								}
								form.render();
								//规则内容随下拉框变化
								if(rules.length!=0){
									$.ajax({
										url : "selectRuleContent.action",
										type : "post",
										data : {
											"id":rules[0].id
										},
										dataType : "json",
										success : function(msg) {
											//得到规则类型信息
											
											var rules= msg.rules;
											 $("#content").val(rules[0].content);
											
										},
										
										error : function() {
											layer.msg('请求失败！',{
												icon: 5,
											    time: 1000, //1s后自动关闭
											  });
										}
									});
								}
								 
							},
							
							error : function() {
								layer.msg('请求失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}
						});

					 
					
				});
				//规则内容随下拉框变化
				form.on('select(rule-filter)', function(data){
					 var option=$("#in-ruleId option:selected");
					 
					 $.ajax({
							url : "selectRuleContent.action",
							type : "post",
							data : {
								"id":option.val()
							},
							dataType : "json",
							success : function(msg) {
								//得到规则类型信息
								
								var rules= msg.rules;
								 $("#content").val(rules[0].content);
								
							},
							
							error : function() {
								layer.msg('请求失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}
						});

					 
					
				});
				form.on('submit(sent)', function(data) {
					 //曝光台发布违规
					
					 var user=$("#in-user option:selected");//用户ID
					 var ruleId=$("#in-ruleId option:selected");//规则ID					 
					 $.ajax({
							url : "createBrokeRule.action",
							type : "post",
							data : {
								"ruleId":ruleId.val(),
								"userId":user.val(),
								"userName":user.text()
							},
							dataType : "json",
							success : function(msg) {
								if (msg.type == "SUC") {
									parent.layer.msg('发布违规成功！',{
										icon: 6,
									    time: 1000, //1s后自动关闭
									  });
									closeNow(); 
									parent.initBrokeRule();
								} else {
									parent.layer.msg(msg.type,{
										icon: 5,
									    time: 1000, //1s后自动关闭
									  });
								}
							},
							
							error : function() {
								parent.layer.msg('请求失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}
						});
				});

			});
			//返回功能
			var index = parent.layer.getFrameIndex(window.name);
			$('#close').click(function() {
				
				parent.layer.close(index);
				
			});
			//查询所有用户的下拉框
			function selectUser(form){
				$.ajax({
					url : "selectUser.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到规则类型信息
						var users= msg.users;
						
						for(var i=0;i<users.length;i++){
							$("#in-user").append("<option value="+users[i].id+" >"+users[i].name+"</option>");
							
						}
						
						
						form.render();
					},
					
					error : function() {
						parent.layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
				
			}
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
							$("#in-rule").append("<option value="+ruleTypes[i].id+" >"+ruleTypes[i].name+"</option>");
							
						}
						form.render();
					},
					
					error : function() {
						parent.layer.msg('请求失败！',{
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

		</script>

		<body>
<html>