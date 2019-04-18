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
		<h1 align="center">修改曝光台</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			
				<form class="layui-form my-form">
					<div class="layui-form-item">
						<label class="layui-form-label">规则编号：</label>
						<div class="layui-inline " style="width: 300px;">
							<select name="" lay-verify="required" id="in-rule" lay-filter="se-filter">
								
								
							</select>
						</div>
					</div>
				</form>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">规则内容：</label>
				<div class="layui-input-block">
					<textarea id="content" class="layui-textarea" readonly="readonly" style="resize:none;width: 300px;"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" onclick="updateBrokeRule()">
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
			//Demo
			layui.use('form', function() {
				var form = layui.form;
				selectRule(form);
				
				//规则内容随下拉框变化
				form.on('select(se-filter)', function(data){
					 var option=$("#in-rule option:selected");
					 //规则编号查规则内容
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

			});

			var index = parent.layer.getFrameIndex(window.name);
			function closeNow() {
				parent.layer.close(index);
			} 

			var brokeRule_id = "";
			var rule_id = "";
			//子类接收数据方法
			function inputDataHandle(data) {
				$("#content").val(data[0]);
				brokeRule_id = data[1];
				rule_id=data[2];
				
				
				
			}
			//查询所有规则的下拉框
			function selectRule(form){
				$.ajax({
					url : "selectRule.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到规则类型信息
						var rules= msg.rules;
						
						for(var i=0;i<rules.length;i++){
							$("#in-rule").append("<option value="+rules[i].id+" >编号"+rules[i].id+"</option>");
							
						}
						
						$("#in-rule").val(rule_id);
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
			//修改曝光台配置
			function updateBrokeRule() {
				var ruleId = $("#in-rule").val();
				
				$.ajax({
					url: "updateBrokeRule.action",
					type: "post",
					data: {
						"ruleId": ruleId,
						"brokeRule_id": brokeRule_id
					},
					dataType: "json",
					success: function(msg) {

						if (msg.type == "SUC") {
							parent.layer.msg('修改成功！',{
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
