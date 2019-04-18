<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>查看自己联盟的信息</title>
<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
<style>
.my-form {
	width: 800px;
	/*border-top: 2px solid #D8312A;*/
	font-size: 16px;
	margin: auto;
	margin-top: 80px;
	bottom: 0;
}

label {
	margin-top: 10px;
}

.imgHead {
	position: absolute;
	margin-left: 600px;
	margin-top: -300px;
}
.layui-upload-img {
	border-radius: 50px;
	width:100px;
	height:100px;
}

</style>
</head>

<body>

	<div class="layui-form my-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">联盟名称：</label> <label
				class="layui-form-label" id="name"
				style="text-align: left; width: 160px;"></label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">联盟盟主：</label> <label
				class="layui-form-label" id="master" style="text-align: left;"></label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">联盟介绍：</label> <label
				class="layui-form-label" id="memo"
				style="text-align: left; width: 300px;">
				<div id="leaMemo"></div>
			</label>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px;">联盟人数：</label> <label
				class="layui-form-label" id="count" style="text-align: left;"></label>
		</div>
		
<div class="layui-form-item" id="btn-mgr" style="display:none;" >
			<button id="btn-mgr1" class="layui-btn layui-btn-normal"
			style="width:120px; margin-left: 100px; font-size: 15px; margin-top: 10px;" 
			leaId ="" onclick="peopleMgr(this)">
			<i class="layui-icon layui-icon-group" style="font-size:15px"></i>联盟管理</button>
			<button id="btn-mgr2"  class="layui-btn layui-btn-normal"
			style="width:120px; margin-left: 20px; font-size: 15px; margin-top: 10px;" 
			leaId ="" onclick="leaTender(this)">
			  <i class="layui-icon layui-icon-form" style="font-size:15px"></i>联盟投标</button>
		</div>
	</div>
	
	<div class="imgHead">
		<div class="layui-input-inline">
			<div class="layui-upload-list">
				<img src="" id="srcimgurl" class="layui-upload-img">
			</div>
		</div>
	</div>

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
	<script src="3rd/Content/ace/ace.js"></script>
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

		

		showInfo();
        //显示联盟信息
		function showInfo() {
			$.ajax({
				url : "showMyLeaMeg.action",
				type : "POST",
				data : {
				},
				dataType : "json",

				success : function(msg) {
					if(msg.res=="noLea"){
						layer.msg('您还没有加入联盟哦！',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });						
					}else if(msg.res=="isMaster"){
						//是盟主
						$("#name").html(msg.leaMange.name);
						$("#master").html(msg.leaMange.userName);
						$("#memo").html(msg.leaMange.memo);
						var count = msg.count+1;
						$("#count").html(count+" 人");
						$("#srcimgurl").attr("src",msg.leaMange.src);
						$("#btn-mgr1").attr("leaId",msg.leaMange.id);
						$("#btn-mgr2").attr("leaId",msg.leaMange.id);
						$("#btn-mgr").css("display","block");
					}
				},
				error : function() {
					alert("请求失败！");
				}
			});
		}

		function peopleMgr(e){
			var leaId= $(e).attr("leaId");
			$.ajax({
				url : "peopleMgr.action",
				type : "POST",
				data : {
					"leaId":leaId
				},
				dataType : "json",

				success : function(msg) {
					parent.$("#if-right").attr("src","leaguePeopleManage.html");
				},
				error : function() {
					alert("请求失败！");
				}
			});
		}
		
		function leaTender(e){
			var leaId= $(e).attr("leaId");
			$.ajax({
				url : "leaTenderMgr.action",
				type : "POST",
				data : {
					"leaId":leaId
				},
				dataType : "json",

				success : function(msg) {
					parent.$("#if-right").attr("src","leagueWorkTable.html");
				},
				error : function() {
					alert("请求失败！");
				}
			});
		}
		
	</script>
<body>
<html>