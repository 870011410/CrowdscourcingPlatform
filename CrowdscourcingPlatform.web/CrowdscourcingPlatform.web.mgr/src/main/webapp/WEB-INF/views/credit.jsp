<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="css/zjw.css">
		<style>
			.ta-search {
				width: 100%;
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
			
			.btn{
				margin-top:10px;
			}
		</style>
	</head>

	<body>
		<br />
		<br />
		<h1 align="center">信用分查看</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">

			<div class="md2 ">
				用户名称： <input type="text" class="layui-input my-input" id="check_name" style="width: 100px;">
			</div>

			<div class="md2">
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						用户类型：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="check_type">
								<option value=""></option>
								<option value="0">雇主</option>
							</select>
						</div>
					</div>
				</form>
			</div>

			<div class="md2">
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						排序方式：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="check_orderBy">
								<option value=""></option>
								<option value="asc">按信用分从低到高排序</option>
								<option value="desc">按信用分从高到低排序</option>
							</select>
						</div>
					</div>
				</form>
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findCredits()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>
			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="credit">
			<colgroup>
				<col width="200">
				<col width="200">
				<col width="200">
				<col width="40">
			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>用户名称</th>
					<th>用户类型</th>
					<th>信用分</th>
					<th>操作</th>
				</tr>
			</thead>
		</table>

		<div id="page" align="right" style="margin-right:50px"></div>

		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			var form;
			//导入form样式
			layui.use('form', function() {
				form = layui.form;
			});
			window.onload = function() {
				//查询文件
				showCredits();
			}

			//分页参数(初始化的)
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件
			var check_name = $("#check_name").val().trim();
			var check_type = $("#check_type").val().trim();
			var check_orderBy = $("#check_orderBy").val().trim();

			//分页初始化数据
			function showCredits() {
				$("#credit").find(".row").remove();
				$.ajax({
					url: "do-showCredits.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"check_name": check_name,
						"check_type": check_type,
						"check_orderBy": check_orderBy
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
										showCredits();
									}
								}
							});
						});
						//数据的处理
						var users = msg.users;

						if (users.length == 0) {
							layer.msg('未查到匹配的结果！', {
								icon: 5,
								time: 1000, //20s后自动关闭
							});
						}
						for (var i = 0; i < users.length; i++) {
							var use = users[i];

							$("#credit").append("<tr class='row'></tr>")
							var $tr = $("#credit").find(".row").last();

							$tr.append("<td >" + use.name + "</td>");
							$tr.append("<td >" + use.pteName + "</td>");
							$tr.append("<td >" + use.score + " </td>");
							$tr.append(
								"<td><span style='display:none;'>" + use.id + "</span>" +
								" <button class='layui-btn layui-btn-xs layui-btn-normal' value='修改' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button></td>"
							);
						}
					},
					error: function() {
						layer.msg('请求失败！', {
							icon: 5,
							time: 1000, //20s后自动关闭
						});
					}
				});
			}
			//根据条件查询文档
			function findCredits() {
				count = 0;
				index = 1;
				start = 0;

				check_name = $("#check_name").val().trim();
				check_type = $("#check_type").val().trim();
				check_orderBy = $("#check_orderBy").val().trim();

				layer.msg('查询成功！', {
					icon: 6,
					time: 1000, //20s后自动关闭
				});
				showCredits();
			}

			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例 
				//修改
				window.update = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['500px', '350px'],
						content: 'updateCredit.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							//name,信用分,id
							data[0] = e.parentElement.parentElement.children[0].innerText.trim(); //自己的数据存进去
							data[1] = e.parentElement.parentElement.children[2].innerText.trim();
							data[2] = e.parentElement.children[0].innerText.trim();
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data);
						}

					});

				}
			});
		</script>
	</body>

</html>
