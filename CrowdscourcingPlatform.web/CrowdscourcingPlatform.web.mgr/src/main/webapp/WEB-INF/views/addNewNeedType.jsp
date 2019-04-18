<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新的需求类型</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
body{
/* background-color: #e2e2e2; */
}
.ta-search {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.div-font div {
	/* border: 1px solid black; */
	
}

.my-input {
	width: 120px;
	display: inline;
}

.center-icon {
	display: block;
	width: 50px;
	margin-left: auto;
	margin-right: auto;
}
/*添加需求类型的小界面  */
.add-need-type {
	
	text-align: center;
	font-size: 25px;
}
/* 文本框限制 */
.myText {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
}
.btn_add{
width: 200px;
	margin-left: auto;
	margin-right: auto;
}

</style>
</head>

<body>
	
	
	
	<!-- 添加一个需求类型的弹出层（添加界面） -->
	
		<div class="layui-row">
		<div class="layui-col-sm6 layui-col-md-offset3 add-need-type">
		新增需求类型
		</div>
		<div class="layui-col-sm12  add-need-type">
			<br>
			
			<div class="layui-col-sm12">
			需求类型名称：
				<input type="text" class="myText layui-input-block " id="needName" style="width: 200px;">
			</div>
			<br> <br>
			
			<div class="layui-col-sm12">
			
				<form class="layui-form my-form" action="" id="in-type">
                <div class="layui-form-item">
                所属服务类型：
					<div class="layui-inline " style="width: 200px;display:inline-block">
					
						<select name="" lay-verify="required" id="se-type">
							<option value=""></option>
                            
						</select>
					</div>
					</div>
				</form>
			</div>
			<br>
			<br>
			<!--按钮  -->
			<div class="btn_add">
				<button class="layui-btn layui-btn-fluid" onclick="addNeedType()">
					<i class="layui-icon layui-icon-auz">&nbsp;确定</i> 
				</button>
			</div>
			
		</div>

	</div>


	

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//导入form样式
		var form;
		layui.use('form', function() {
			form= layui.form;
			selectServerType();

		});
		
		
		 
		
		//下拉框数据的获取（获取服务类型）
		function selectServerType(){
			
			$.ajax({
				url : "selectServerType.action",
				type : "post",
				data : {},
				dataType : "json",
				success : function(msg) {
					
					//得到的服务类型信息
					var serverTypes= msg.serverTypes;
				
					//把数据写入下来框中
					for (var i = 0; i < serverTypes.length; i++) {
						
							$("#se-type").append("<option value="+serverTypes[i].id+">"
											+ serverTypes[i].name + "</option>");
						}
					
					form.render();
					//清空文本框
					$("#needName").val("");
				},
				error : function() {
					layer.msg('请求失败！',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
				}
			});
		}
		
		//添加一个新标签
		function addNeedType(){
			
			//拿到新增加的需求类型名字
			var needTypeName = $("#needName").val().trim();
			//拿到新增加的需求类型所属的服务id
			var serverId = $("#se-type").val().trim();
			if(needTypeName==""){
				layer.msg('请输入需求类型名称！',{
					icon: 0,
				    time: 1000, //1s后自动关闭
				  });
				return;
			}
			if(serverId==""){
				layer.msg('请选择所属的服务类型！',{
					icon: 0,
				    time: 1000, //1s后自动关闭
				  });
				return;
			}
			$.ajax({
				url : "addNewNeedType.action",
				type : "post",
				data : {
					"needTypeName" : needTypeName,
					"serverId" : serverId
					
				},
				dataType : "json",
				success : function(msg) {
					if(msg.res==0){
						layer.msg('添加需求类型失败！类型已存在',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}else{
						parent.layer.msg('添加需求类型成功！',{
							icon: 6,
						    time: 1000, //1s后自动关闭
						  });
						//关闭本界面
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
						//刷新下父类界面
						parent.refushJp();
						
					}

				},
				error : function() {
					layer.msg('请求失败！',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
				}
			});
			
		}
	</script>
</body>

</html>