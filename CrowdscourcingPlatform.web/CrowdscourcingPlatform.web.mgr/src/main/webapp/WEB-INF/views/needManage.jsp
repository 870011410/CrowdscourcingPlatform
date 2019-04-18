<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<link rel="stylesheet" href="css/zjw.css">

</head>

<body>
	<br />
	<br />
	<h1 align="center">需求管理</h1>
	<br />
	<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
	<br />
	<div class="layui-row  div-font">

		<div class="md2 ">
			需求标题： <input type="text" class="layui-input my-input" id="title" placeholder="需求标题">

		</div>
		<div class="md2 ">
			发布人： <input type="text" class="layui-input my-input" id="name" placeholder="发布人">

		</div>

		<div class="md2 ">
			<form class="layui-form my-form" action="" id="in-type">
				<div class="layui-form-item">
					需求类型：
					<div class="layui-inline " style="width: 110px;">
						<select name="" lay-verify="required" id="se-type">
							<option value="-1"></option>

						</select>
					</div>
				</div>
			</form>
		</div>

		<div class="md2 ">
			发布时间：&nbsp;<input type="text" class="layui-input my-input"
				id="in-begin" placeholder="开始时间">

		</div>
		<div class="md2 ">
			至：<input type="text"
				class="layui-input my-input" id="in-end" placeholder="结束时间">

		</div>

		<div class="md2 ">
			<button class="layui-btn layui-btn-sm" onclick="findNeed()">
				<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
			</button>

		</div>

	</div>

	<br />
	<table class="layui-table ta-search" lay-size="lg" id="file">
		<colgroup>
			<col width="100">
			<col width="150">
			<col width="150">
			<col width="150">
			<col width="100">
			<col width="100">
			<col width="150">

		</colgroup>
		<thead>
			<tr class="layui-bg-green">
				<th>标题</th>
				<th>内容</th>
				<th>发布时间</th>
				<th>截止时间</th>
				<th>发布人</th>
				<th>类型</th>
				<th>操作</th>

			</tr>
		</thead>

	</table>

	<div id="page" align="right" style="margin-right:50px"></div>
	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//导入form样式
		var form;
		layui.use('form', function() {
			form = layui.form;

		});

		//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#in-begin',
				theme : 'molv' //指定元素

			});
		});
		//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#in-end',
				theme : 'molv' //指定元素

			});
		});
		window.onload = function() {
			//需求类型的下拉框显示

			initDocType();

		}
		layui.use('layer', function() {
			var layer = layui.layer; //执行一个laydate实例  
		});

		//动态需求类型下拉框
		function initDocType() {

			$.ajax({
				url : "selectNeedType.action",
				type : "post",
				data : {},
				dataType : "json",
				success : function(msg) {

					//返回回来的需求类型数据集合
					var needTypes = msg.needTypes;

					for (var i = 0; i < needTypes.length; i++) {

						$("#se-type").append(
								"<option value="+needTypes[i].id+">"
										+ needTypes[i].name + "</option>");

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
		/* initDocType(); */
		//分页参数(初始化的)
		//从哪里开始
		var start = 0;
		//每页的条数
		var limit = 5;
		//当前页
		var index = 1;
		//查询的条件
		//需求标题
		var title = "";
		//发布人名字
		var name = "";
		//需求类型id
		var needId = -1;
		//发布时间段(起始)
		var sTime = "";
		//发布时间段(截止)
		var eTime = "";
		initNeed();
		//分页初始化数据(需求信息)
		function initNeed() {
			$("#file").find(".row").remove();
			$.ajax({
				url : "initNeed.action",
				type : "post",
				data : {
					"start" : start,
					"limit" : limit,
					"title" : title,
					"name" : name,
					"needId" : needId,
					"sTime" : sTime,
					"eTime" : eTime

				},
				dataType : "json",
				success : function(msg) {
					//返回回来的总条数
					var count = msg.count;
					//页码的处理
					layui.use('laypage', function() {
						var laypage = layui.laypage;

						laypage.render({
							//分页模块的id
							elem : 'page',
							limit : limit, //设置limit
							count : count, //设置count 从服务端得到
							curr : index, //设置当前页
							jump : function(obj, first) {

								//首次不执行
								if (!first) {
									start = (obj.limit * (obj.curr - 1));
									index = obj.curr;
									initNeed();
								}
							}
						});
					});
					//数据的处理
					var needs = msg.needs;

					if (needs.length == 0) {
						layer.msg('未查到匹配的结果！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
					for (var i = 0; i < needs.length; i++) {
						var need = needs[i];
						//查看需求的扎状态
                         var type = need.state;
						
						var ctrl ="";
						//操作的类型
						if(type==0){
							//操作为正常
							ctrl="<button class='layui-btn layui-btn-xs layui-btn-warm' value='禁止发布'  needId=" +
							need.id +" onclick='stopShow(this)'><i class='layui-icon layui-icon-down'>&nbsp;禁止发布</i></button> "
						}
						if(type==1){
							ctrl="<button class='layui-btn layui-btn-xs layui-btn-warm' value='恢复发布'  needId=" +
							need.id +" onclick='recoverShow(this)'><i class='layui-icon layui-icon-up'>&nbsp;恢复发布</i></button> "
						}
						$("#file").append("<tr class='row'></tr>")
						var $tr = $("#file").find(".row").last();

						$tr.append("<td >" + need.title + "</td>");
						$tr.append("<td >" + need.content + "</td>");
						$tr.append("<td >" + need.createTime.substring(0,19) + "</td>");
						$tr.append("<td >" + need.endTime.substring(0,19) + " </td>");
						$tr.append("<td >" + need.userName + " </td>");
						$tr.append("<td >" + need.nteName + " </td>");
						$tr.append("<td >" + ctrl+ " </td>");

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
		//根据条件查询需求
		function findNeed() {
			count = 0;
			index = 1;
			start = 0;
			var title_temp = $("#title").val().trim();
			var name_temp = $("#name").val().trim();
			var needId_temp = $("#se-type").val().trim();
			var sTime_temp = $("#in-begin").val().trim();
			var eTime_temp = $("#in-end").val().trim();

			if ((sTime_temp == "" && eTime_temp != "")
					|| (sTime_temp != "" && eTime_temp == "")) {
				layer.msg('发布日期要选择一个时间段！',{
					icon: 0,
				    time: 1000, //1s后自动关闭
				  });
				return;
			}
			
			 title =title_temp;
			name =name_temp;
			needId = needId_temp;
			sTime = sTime_temp;
			eTime = eTime_temp;

			initNeed();

		}
		
		//禁止需求发布显示
		function stopShow(e){
			layer.confirm('确定禁止该条需求发布?', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					stopShowThis(e);
				}
			);
		}
		
		function stopShowThis(e){
			//禁止这条需求在前端显示
			
			
				//得到该需求的id
				var needId = $(e).attr("needId");
				//做的操作
				var ctrlName = "禁止发布ID为"+needId+"的需求";
				//改变状态值
				var state = 1;
				$.ajax({
					url : "updateNeedState.action",
					type : "post",
					data : {
						"needId":needId,
						"ctrlName":ctrlName,
						"state":state
						
					},
					dataType : "json",
					success : function(msg) {
						//告知结果
						layer.msg(msg.res,{
						icon: 6,
					    time: 1000, //1s后自动关闭
					  });
						initNeed();
					},
					error : function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
		
		}
		
		//禁止需求发布显示
		function recoverShow(e){
			layer.confirm('确定恢复该条需求发布?', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					recoverShowThis(e)
				}
			);
		}
		function recoverShowThis(e){
			//恢复这条需求在前端显示
			
				//得到该需求的id
				var needId = $(e).attr("needId");
				//做的操作
				var ctrlName = "恢复发布ID为"+needId+"的需求";
				//改变状态值
				var state = 0;
				$.ajax({
					url : "updateNeedState.action",
					type : "post",
					data : {
						"needId":needId,
						"ctrlName":ctrlName,
						"state":state
						
					},
					dataType : "json",
					success : function(msg) {
						//告知结果
						layer.msg(msg.res,{
						icon: 6,
					    time: 1000, //1s后自动关闭
					  });
						initNeed();
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