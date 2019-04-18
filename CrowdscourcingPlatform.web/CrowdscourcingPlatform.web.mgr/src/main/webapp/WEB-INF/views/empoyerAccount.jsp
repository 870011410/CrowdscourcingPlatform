<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>雇主对账</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<link rel="stylesheet" href="css/zjw.css">

</head>

<body>
	<br />
	<br />
	<h1 align="center">账务对账</h1>
	<br />
	<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
	<br />


	<div class="layui-row  div-font">
		<div class="md2 ">
			雇主名字： <input type="text" class="layui-input my-input" id="name" placeholder="雇主名字">

		</div>
		<div class="md2">
			交易时间：&nbsp;<input type="text" readonly="readonly" class="layui-input my-input"
				id="in-begin" placeholder="开始时间">

		</div>
		<div class="md2 ">
			至：<input type="text"
				class="layui-input my-input" readonly="readonly" id="in-end" placeholder="结束时间">

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
			<col width="110">
			<col width="110">
			<col width="110">
			<col width="130">
			<col width="130">
			<col width="100">
			<col width="80">
			<col width="150">

		</colgroup>
		<thead>
			<tr class="layui-bg-green">
				<th style="text-align: center">雇主(付款方)</th>
				<th style="text-align: center">服务商名字</th>
				<th style="text-align: center">联盟名称</th>
				<th style="text-align: center">作品名字</th>
				<th style="text-align: center">需求标题</th>
				<th style="text-align: center">状态</th>
				<th style="text-align: center">金额</th>
				<th style="text-align: center">成交时间</th>

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
		layui.use('layer', function() {
			var layer = layui.layer; //执行一个laydate实例  
		});

		//分页参数(初始化的)
		//从哪里开始
		var start = 0;
		//每页的条数
		var limit = 5;
		//当前页
		var index = 1;
		//查询的条件
		//雇主名字
		var name = "";
		//发布时间段(起始)
		var sTime = "";
		//发布时间段(截止)
		var eTime = "";
		initAccount();
		//分页初始化数据(账务信息)
		function initAccount() {
			$("#file").find(".row").remove();
			$.ajax({
				url : "initAccount.action",
				type : "post",
				data : {
					"start" : start,
					"limit" : limit,
					"name" : name,
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
									initAccount();
								}
							}
						});
					});
					//数据的处理
					var accs = msg.accounts;

					if (accs.length == 0) {
	
						layer.msg('未查到匹配的结果！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}

					for (var i = 0; i < accs.length; i++) {
						var acc = accs[i];
						var state="";
						var money=acc.money;
						if(acc.state==1){
							state="交易成功"
							
						}
						if(acc.state==2){
							state="付款"
						}
						if(acc.state==3){
							state="退款"
							money="+"+acc.money
						}
						$("#file").append("<tr class='row'></tr>")
						var $tr = $("#file").find(".row").last();

						$tr.append("<td >" + acc.useName + "</td>");
						$tr.append("<td >" + (acc.serName == null ? "—————" : acc.serName) + "</td>");
						$tr.append("<td >" + (acc.leaName == null ? "—————" : acc.leaName)+ "</td>");
						$tr.append("<td >" + (acc.worTitle == null ? "—————" : acc.worTitle) + "</td>");
						$tr.append("<td >" + (acc.neeTitle == null ? "—————" : acc.neeTitle) + "</td>");
						$tr.append("<td >" + state + " </td>");
						$tr.append("<td >" + money + " </td>");
						$tr.append("<td >" + acc.updateTime.substring(0,19) + " </td>");

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

			var name_temp = $("#name").val().trim();

			var sTime_temp = $("#in-begin").val().trim();
			var eTime_temp = $("#in-end").val().trim();

			if ((sTime_temp == "" && eTime_temp != "")
					|| (sTime_temp != "" && eTime_temp == "")) {
				layer.msg('发布日期要是一个时间段',{
					icon: 0,
				    time: 1000, //1s后自动关闭
				  });
				return;
			}

			name = name_temp;

			sTime = sTime_temp;
			eTime = eTime_temp;

			initAccount();

		}
	</script>
</body>

</html>