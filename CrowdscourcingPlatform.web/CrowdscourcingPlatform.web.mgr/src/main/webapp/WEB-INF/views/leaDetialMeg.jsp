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
	width: 280px;
	/*border-top: 2px solid #D8312A;*/
	/* background-color:blue; */
	margin: auto;
	top: 80px;
	bottom: 0;
}
.my-ul{
     height: 60px;
     overflow-y: scroll;

}
</style>
	</head>

	<body>
		<br />
		<br />
		<h1 align="center">联盟详情</h1>
		<br />
		<br />
		<div class="layui-form my-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">联盟名称：</label>
				<div class="layui-input-block my-text">
					<input type="id" id="leaName" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">联盟盟主：</label>
				<div class="layui-input-block my-text">
					<input type="id" id="useName" autocomplete="off" class="layui-input" readonly="readonly">
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">联盟成员：</label>
				<div class="layui-input-block my-ul">
					<ul class="" id="userUl">
  
  

  </ul>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
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

				//监听提交
				form.on('submit(formDemo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});

			});

			//关闭本弹出界面
			var index = parent.layer.getFrameIndex(window.name);
			function closeNow() {
				parent.layer.close(index);
			} 

			var leaId = 0;
			var userName="";
			//子类接收数据方法
			function inputDataHandle(data) {
				//联盟名
				$("#leaName").val(data[1]);
				//盟主名
				$("#useName").val(data[2]);
				//联盟id
				leaId= data[0];
				
				userName=data[2];
				//显示成员
				selectUserWithLea();
			}

			//查出该联盟的成员
			function selectUserWithLea(){
				
				$.ajax({
					url : "selectUserWithLea.action",
					type : "post",
					data : {
						"leaId":leaId
						
						
					},
					dataType : "json",
					success : function(msg) {
						var users = msg.users;
						//添加联盟人员
						
						for(var i =0;i<users.length;i++){
							if(users[i]==userName){
								//标识盟主
								$("#userUl").append("<li>"+users[i]+"<span style=' color:green'>(盟主)</span></li>");
							}else{
								$("#userUl").append("<li>"+users[i]+"</li>");
							}
							
						}
						
												
					},
					error : function() {
						alert("请求失败！");
					}
				});
				
			}
			
		</script>
		<body>
<html>
