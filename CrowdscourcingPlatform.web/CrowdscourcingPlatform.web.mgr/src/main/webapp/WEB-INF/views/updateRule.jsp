<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>修改规则</title>
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
		<h1 align="center">修改规则</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
		
 			<div class="layui-form-item">
				<label class="layui-form-label">规则类型：</label>
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-input-inline" style="width: 300px;">
						<select name="" required lay-verify="required" id="rule-type">
							<option value=""></option>
						</select>
					</div>
				</form>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">规则内容：</label>
				<div class="layui-input-block">
					<textarea id="rule-content" required lay-verify="required" class="layui-textarea" style="resize:none;width: 300px;"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">扣分：</label>
				<div class="layui-input-block">
					<input type="id" id="rule-score" required lay-verify="required" autocomplete="off" class="layui-input" style="width: 300px;">
				</div>
			</div>
 			<div class="layui-form-item">
				<label class="layui-form-label">状态：</label>
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-input-inline" style="width: 300px;">
						<select name="" required lay-verify="required" id="rule-state">
							<option value=""></option>
							<option value="0">未上线</option>
							<option value="1">已上线</option>
						</select>
					</div>
				</form>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="askUpdate" >
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
			//导入form样式
			layui.use('form', function() {
				var form = layui.form;
				selectRuleType(form);
				
				
				form.on('submit(askUpdate)',function(data){
					layer.confirm('确定要修改吗？', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							updateRule();
						}
					);
				});
			});

			var index = parent.layer.getFrameIndex(window.name);

			function closeNow() {
				parent.layer.close(index);
			}

			var rule_id = "";//规则ID
			var ruleType_id="";//规则类型ID
			var ruleState_id="";//规则状态ID
			var dataHere;
			
			//子类接收数据方法
			function inputDataHandle(data) {
				ruleType_id=data[0];//规则类型ID
				$("#rule-content").val(data[1]);//规则内容	
				rule_id = data[2];//规则ID
				$("#rule-score").val(data[3]);//扣分
				ruleState_id=data[4];//规则状态ID
				dataHere=data;
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
							$("#rule-type").append("<option value="+ruleTypes[i].id+" >"+ruleTypes[i].name+"</option>");
							
						}
						$("#rule-type").val(dataHere[0]);
						$("#rule-state").val(dataHere[4]);
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
			

			
			//修改规则
			function updateRule() {
				var ruleId=rule_id;
				var ruleType=$("#rule-type option:selected").val().trim();
				var ruleContent=$("#rule-content").val().trim();
				var ruleScore=$("#rule-score").val();
				var ruleState=$("#rule-state option:selected").val(); 

				 $.ajax({
						url: "do-modifyRule.action",
						type: "post",
						data: {
							"id":ruleId,
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
								parent.layer.msg('修改规则成功！',{icon: 6,time: 1000});
							}else{
								layer.msg('修改规则失败！',{icon: 5,time: 1000});
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
