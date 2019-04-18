<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>盟主管理联盟成员</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<style>
.ta-search {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

.div-font div {
	font-size: 15px;
}

.my-input {
	width: 120px;
	display: inline;
}

.btn {
	margin-top: 10px;
}

.layui-input, .layui-select, .layui-textarea {
	height: 32px;
	line-height: 1.3;
	line-height: 38px\9;
	baccount-width: 1px;
	baccount-style: solid;
	background-color: #fff;
	baccount-radius: 2px;
	font-size: 12px;
}

.md2 {
	/* width: 16.66666667%; */
	margin-left: 25px;
	display: inline-block;
}

.layui-btn-xs i {
	font-size: 11px !important;
}

.layui-table td, .layui-table th {
	position: relative;
	padding: 9px 15px;
	min-height: 17px;
	line-height: 17px;
	font-size: 12px;
}

.layui-table[lay-size=lg] td, .layui-table[lay-size=lg] th {
	padding: 10px 20px;
}

.layui-table td, .layui-table th {
	position: relative;
	padding: 9px 15px;
	min-height: 17px;
	line-height: 17px;
	font-size: 12px;
}

</style>
</head>

<body>

	<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
	<br />
	<div class="layui-row  div-font">
		<div class="md2 ">
			&nbsp;&nbsp;服务商： <input type="text" class="layui-input my-input"
				style="width: 160px;" id="check_name">
		</div>
		<div class="md2 ">
			<form class="layui-form my-form">
				<div class="layui-form-item">
					状态：
					<div class="layui-inline" style="width: 120px;">
						<select name="" lay-verify="required" id="check_state">
							<option value="-1">全部</option>
							<option value="0">待审核</option>
							<option value="1">审核通过</option>
							<option value="2">审核不通过</option>
						</select>
					</div>
				</div>
			</form>
		</div>

		<!-- 		</div>

		<div class="layui-row  div-font"> -->
       <br>
		<div class="md2 ">
			申请时间：<input type="text" class="layui-input my-input"
				id="check_time_from" placeholder="请输入开始时间" style="width: 160px;">
		</div>
		<div class="md2 ">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至：<input type="text" class="layui-input my-input" id="check_time_to"
				placeholder="请输入结束时间" style="width: 160px;">
		</div>

		<div class="md2 ">
			<button class="layui-btn layui-btn-sm" style="background: #63b5fb;" onclick="findAccounts()">
				<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
			</button>

		</div>

	</div>

	<br />
	<table class="layui-table ta-search" lay-size="lg" id="account">
		<colgroup>
			<col width="140">
			<col width="180">
			<col width="180">
			<col width="120">
			<col width="180">
		</colgroup>
		<thead>
			<tr class="layui-bg" style="background-color: #1E9FFF; color:white;">
				<th>服务商名</th>
				<th>申请日期</th>
				<th>审核日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
	</table>

	<div id="page" align="center"></div>

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//导入form样式
		layui.use(['form','layer'], function() {
			var form = layui.form;
		});
		
		//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#check_time_from',
				theme : 'molv' //指定元素

			});
		});
		//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#check_time_to',
				theme : 'molv' //指定元素
			});
		});
		//分页参数(初始化的)
		//从哪里开始
		var start = 0;
		//每页的条数
		var limit = 5;
		//当前页
		var index = 1;
		//查询的条件
		var check_name = "";
		var check_state = -1;
		var check_time_from ="";
		var check_time_to ="";
		//分页初始化数据
		showMyLeaguePeople();
		function showMyLeaguePeople() {
			$("#account").find(".row").remove();
			$.ajax({
						url : "showMyLeaguePeople.action",
						type : "post",
						data : {
							"start" : start,
							"limit" : limit,
							"check_name" : check_name,
							"check_state" : check_state,
							"check_time_from" : check_time_from,
							"check_time_to" : check_time_to
						},
						dataType : "json",
						success : function(msg) {
							
						    
							//返回回来的总条数
							var count = msg.count;
							//页码的处理
							layui.use('laypage',function() {
												var laypage = layui.laypage;

												laypage.render({
															//分页模块的id
															elem : 'page',
															limit : limit, //设置limit
															count : count, //设置count 从服务端得到
															curr : index, //设置当前页
															jump : function(
																	obj, first) {

																//首次不执行
																if (!first) {
																	start = (obj.limit * (obj.curr - 1));
																	index = obj.curr;
																	showMyLeaguePeople();
																}
															}
														});
											});
							//数据的处理
							var leaUsers = msg.leaUsers;

							if (leaUsers.length == 0) {
								layer.msg('未查到匹配的结果！', {
									icon : 5,
									time : 1000, //20s后自动关闭
								});
							}

							for (var i = 0; i < leaUsers.length; i++) {
								var leaUser = leaUsers[i];
                                var time = "————————————";
                                if(leaUser.updateTime!=undefined){
                                	time = leaUser.updateTime;
                                }
                                var type ="";
                                var ctrl ="";
                                if(leaUser.state==0){
                                	type="待审核";
                                	ctrl="<button class='layui-btn layui-btn-xs layui-btn-warm' value='通过'  audiId=" +
                                	leaUser.id +" userId="+leaUser.userId+
    								" onclick='audiPass(this)'><i class='layui-icon layui-icon-ok'>&nbsp;通过</i></button> "+
    								"<button class='layui-btn layui-btn-xs layui-btn-danger' value='不通过'  audiId=" +
    								leaUser.id +" userId="+leaUser.userId+
    								" onclick='audiNotGo(this)'><i class='layui-icon layui-icon-close'>&nbsp;不通过</i></button> "
                                }else if(leaUser.state==1){
                                	type="审核通过";
                                	ctrl="<button class='layui-btn layui-btn-xs layui-btn-danger' value='剔除'  audiId=" +
                                	leaUser.id +" userId="+leaUser.userId+
    								" onclick='throwUser(this)'><i class='layui-icon layui-icon-password'>&nbsp;剔除</i></button> "
                                }else{
                                	type="审核不通过";
                                	ctrl="";
                                }
                                	
                                	
								$("#account").append("<tr class='row'></tr>")
								var $tr = $("#account").find(".row").last();

								$tr.append("<td >"+leaUser.leaUserName+"</td>");
								$tr.append("<td >"
										+leaUser.createTime + "</td>");
								$tr.append("<td >" + time + " </td>");
								$tr.append("<td >"
										+ type
										+ " </td>");
								$tr.append("<td >" + ctrl+ "</td>");
								
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
		//根据条件查询用户
		function findAccounts() {
			count = 0;
			index = 1;
			start = 0;

			var check_time_from_t = $("#check_time_from").val().trim();
			var check_time_to_t = $("#check_time_to").val().trim();

			if ((check_time_from_t != "" && check_time_to_t == "")
					|| (check_time_from_t == "" && check_time_to_t != "")) {
				layer.msg('日期信息填写不完整！', {
							icon : 1,
							time : 1000, //1s后自动关闭
						});
				return;
			}
			layer.msg('查询成功！', {
				icon : 1,
				time : 1000, //20s后自动关闭
			});
			check_name = $("#check_name").val().trim();
			check_state = $("#check_state").val().trim();
			check_time_from = $("#check_time_from").val().trim();
			check_time_to = $("#check_time_to").val().trim();
			showMyLeaguePeople();
		}
		
		function audiPass(e){
			layer.confirm('同意加入联盟?', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					layer.closeAll('dialog'); 
					audiPassThis(e);
				}
			);
		}
		function audiPassThis(e){
			 
			//关系表id
			var audiId = $(e).attr("audiId");
			//服务商id
			var userId = $(e).attr("userId");
			$.ajax({
				url : "audiPassLeagueUser.action",
				type : "post",
				data : {
					"audiId":audiId,
					"userId":userId
					
				},
				dataType : "json",
				success : function(msg) {
					//告知结果
					var res = msg.res;
					if(res=="isLeaMaster"){
						layer.msg('该用户已有联盟或在成立联盟中',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });
					}else if(res=="isAdded"){
						layer.msg('该用户已加入其他联盟',{
							icon: 2,
						    time: 1000, //1s后自动关闭
						  });
					}else if(res=="suc"){
						layer.msg('加入成功',{
							icon: 1,
						    time: 1000, //1s后自动关闭
						  });
						showMyLeaguePeople();
						
					}else{
						layer.msg('操作失败',{
							icon: 1,
						    time: 1000, //1s后自动关闭
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
		}
		
		//审核不通过		
		function audiNotGo(e){
			layer.confirm('拒绝加入联盟?', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					layer.closeAll('dialog'); 
					audiNotGoThis(e);
				}
			);
		}
		function audiNotGoThis(e){
			 
			//关系表id
			var audiId = $(e).attr("audiId");
			//服务商id
			var userId = $(e).attr("userId");
			$.ajax({
				url : "audiThrowLeagueUser.action",
				type : "post",
				data : {
					"audiId":audiId,
					"userId":userId
					
				},
				dataType : "json",
				success : function(msg) {
					//告知结果
					var res = msg.res;
					if(res=="suc"){
						layer.msg('操作成功',{
							icon: 1,
						    time: 1000, //1s后自动关闭
						  });
						showMyLeaguePeople();
						
					}else{
						layer.msg('操作失败',{
							icon: 1,
						    time: 1000, //1s后自动关闭
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
		}
		
		//审核不通过		
		function throwUser(e){
			layer.confirm('剔除该成员?', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					layer.closeAll('dialog'); 
					throwUserThis(e);
				}
			);
		}
		function throwUserThis(e){
			 
			//关系表id
			var audiId = $(e).attr("audiId");
			//服务商id
			var userId = $(e).attr("userId");
			$.ajax({
				url : "deleteLeagueUser.action",
				type : "post",
				data : {
					"audiId":audiId,
					"userId":userId
					
				},
				dataType : "json",
				success : function(msg) {
					//告知结果
					var res = msg.res;
					if(res=="suc"){
						layer.msg('剔除成功',{
							icon: 1,
						    time: 1000, //1s后自动关闭
						  });
						showMyLeaguePeople();
						
					}else{
						layer.msg('剔除失败',{
							icon: 2,
						    time: 1000, //1s后自动关闭
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
		}
	</script>
</body>

</html>