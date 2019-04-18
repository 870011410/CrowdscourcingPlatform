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
		<h1 align="center">日志查看</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">

			<div class="md2 ">
				操作人： <input type="text" class="layui-input my-input" id="check_name" placeholder="操作人">
			</div>

			<div class="md2">
				操作时间：&nbsp;<input type="text" class="layui-input my-input" id="check_time_from" placeholder="开始时间">
			</div>
			<div class="md2 ">
				至： <input type="text" class="layui-input my-input" id="check_time_to"
				 placeholder="结束时间">
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findLogs()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="log">
			<colgroup>
				<col width="140">
				<col width="230">
				<col width="230">
			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>操作人</th>
					<th>操作内容</th>
					<th>操作时间</th>
				</tr>
			</thead>
		</table>

		<div id="page" align="right" style="margin-right:50px"></div>


		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			//导入form样式
			layui.use('form', function() {
				var form = layui.form;

			});
			window.onload = function() {
				//查询文件
				showLogs();
			}
			//日期选择器
			layui.use('laydate', function() {
				var laydate = layui.laydate; //执行一个laydate实例 
				laydate.render({
					elem: '#check_time_from',
					theme: 'molv' //指定元素

				});
			});
			//日期选择器
			layui.use('laydate', function() {
				var laydate = layui.laydate; //执行一个laydate实例 
				laydate.render({
					elem: '#check_time_to',
					theme: 'molv' //指定元素
				});
			});

			//分页参数(初始化的)
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 10;
			//当前页
			var index = 1;
			//查询的条件
			var check_name = $("#check_name").val().trim();
			var check_time_from = $("#check_time_from").val().trim();
			var check_time_to = $("#check_time_to").val().trim();

			//分页初始化数据
			function showLogs() {
				$("#log").find(".row").remove();
				$.ajax({
					url: "do-showLogs.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"check_name": check_name,
						"check_time_from": check_time_from,
						"check_time_to": check_time_to
					},
					dataType: "json",
					success: function(msg) {
						//返回回来的总条数
						var count = msg.count;
						//页码的处理
						layui.use('laypage', function() {
							var laypage = layui.laypage;

							laypage.render({
								//分页模块的id
								elem: 'page',
								limit: limit, //设置limit
								count: count, //设置count 从服务端得到
								curr: index, //设置当前页
								jump: function(obj, first) {

									//首次不执行
									if (!first) {
										start = (obj.limit * (obj.curr - 1));
										index = obj.curr;
										showLogs();
									}
								}
							});
						});
						//数据的处理
						var logs = msg.logs;

						if (logs.length == 0) {
							layer.msg('未查到匹配的结果！', {
								icon: 5,
								time: 1000, //20s后自动关闭
							});
						}
						for (var i = 0; i < logs.length; i++) {
							var log = logs[i];

							$("#log").append("<tr class='row'></tr>")
							var $tr = $("#log").find(".row").last();

							$tr.append("<td >" + log.name + "</td>");
							$tr.append("<td >" + log.content + "</td>");
							$tr.append("<td >" + log.createTime.substring(0,19) + " </td>");
						}
					},
					error: function() {
						layer.msg('请求失败！', {
							icon: 2,
							time: 1000, //20s后自动关闭
						});
					}
				});
			}
			//根据条件查询文档
			function findLogs() {
				count = 0;
				index = 1;
				start = 0;

				check_name = $("#check_name").val().trim();
				check_time_from = $("#check_time_from").val().trim();
				check_time_to = $("#check_time_to").val().trim();

				if (check_time_from.length > 0 && check_time_to.length <= 0) {
					layer.msg('请填写完整的时间信息！', {
						icon: 0,
						time: 1000, //20s后自动关闭
					});
					return;
				} else if (check_time_to.length>0 && check_time_from.length<=0) {
					layer.msg('请填写完整的时间信息！', {
						icon: 0,
						time: 1000, //20s后自动关闭
					});
					return;
				}

				layer.msg('查询成功！', {
					icon: 1,
					time: 1000, //20s后自动关闭
				});
				showLogs();
			}
		</script>
	</body>

</html>
