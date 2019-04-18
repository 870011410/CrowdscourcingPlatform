<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style>
			.ta-search {
				width: 1000px;
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
		</style>
	</head>

	<body>
		<br />
		<br />
		<h1 align="center">文档审核</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">

			<div class="layui-col-md2 layui-col-md-offset3">
				文档标题： <input type="text" class="layui-input my-input" id="in-fname">

			</div>
			<div class="layui-col-md2 ">
				上传人： <input type="text" class="layui-input my-input" id="in-name">

			</div>

			<div class="layui-col-md2 ">
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						文档类型：
						<div class="layui-inline " style="width: 110px;">
							<select name="" lay-verify="required" id="se-type">
								<option value=""></option>

							</select>
						</div>
					</div>
				</form>
			</div>

		</div>

		<div class="layui-row  div-font">

			<div class="layui-col-md2 layui-col-md-offset3">
				注册时间：&nbsp;<input type="text" class="layui-input my-input" id="in-begin" placeholder="请输入开始时间">

			</div>
			<div class="layui-col-md2 ">
				至：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="layui-input my-input" id="in-end" placeholder="请输入结束时间">

			</div>

			<div class="layui-col-md2 ">
				<button class="layui-btn layui-btn-radius " onclick="findFile()">
				查询<span class="layui-badge-dot layui-bg-orange"></span>
			</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="file">
			<colgroup>
				<col width="200">
				<col width="120">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="350">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>文档标题</th>
					<th>上传人</th>
					<th>上传时间</th>
					<th>下载积分</th>
					<th>文档类型</th>
					<th>操作</th>

				</tr>
			</thead>

		</table>

		<div id="page" align="center"></div>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			//导入form样式
			layui.use('form', function() {
				var form = layui.form;

			});
			window.onload = function() {

				//查询文件
				initFile();

			}
			//日期选择器
			layui.use('laydate', function() {
				var laydate = layui.laydate; //执行一个laydate实例 
				laydate.render({
					elem: '#in-begin',
					theme: 'molv' //指定元素

				});
			});
			//日期选择器
			layui.use('laydate', function() {
				var laydate = layui.laydate; //执行一个laydate实例 
				laydate.render({
					elem: '#in-end',
					theme: 'molv' //指定元素

				});
			});

			/* //动态生成文档类型下拉框
			function initDocType() {

				$.ajax({
					url : "initDocType.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						var document = msg.document;

						for (var i = 0; i < document.length; i++) {

							$("#se-type").append(
									"<option value="+document[i].al_id+">"
											+ document[i].al_name + "</option>");

						}

					},
					error : function() {
						alert("请求失败！");
					}
				});
			} */
			/* initDocType(); */
			//分页参数(初始化的)
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件
			var fname = $("#in-name").val().trim();
			var begin = $("#in-begin").val().trim();
			var end = $("#in-end").val().trim();
			var name = $("#in-name").val().trim();
			var state = $("#in-type").val().trim();

			//分页初始化数据
			function initFile() {
				$("#file").find(".row").remove();
				$.ajax({
					url: "initFile.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"fname": fname,
						"begin": begin,
						"end": end,
						"name": name,
						"state": state

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
									if(!first) {
										start = (obj.limit * (obj.curr - 1));
										index = obj.curr;
										initFile();
									}
								}
							});
						});
                         //数据的处理
						var document = msg.document;

						if(document.length == 0) {
							alert("未查到匹配的结果！");
						}
						for(var i = 0; i < document.length; i++) {
							var doc = document[i];

							$("#file").append("<tr class='row'></tr>")
							var $tr = $("#file").find(".row").last();

							$tr.append("<td >" + doc.do_name + "</td>");
							$tr.append("<td >" + doc.us_name + "</td>");
							$tr.append("<td >" + doc.do_uptime + "</td>");
							$tr.append("<td >" + doc.do_score + " </td>");
							$tr.append("<td >" + doc.al_name + " </td>");
							$tr.append("<td ><input type='button' class='layui-btn layui-btn-radius  btn-search layui-btn-normal' value='下载'  valuePath=" +
								doc.path +
								" onclick='down(this)'/> " +
								"<input type='button' class='layui-btn layui-btn-radius  btn-search' value='通过'  valueId=" +
								doc.do_id +
								" onclick='audit(this)'/> " +
								"<input type='button' class='layui-btn layui-btn-radius  btn-search' value='不通过'  valueId=" +
								doc.do_id +
								" onclick='audit(this)'/></td>");
						}


					},
					error: function() {
						alert("请求失败！");
					}
				});
			}
			//根据条件查询文档
			function findFile() {
				count = 0;
				index = 1;
				start = 0;

				fname = $("#in-fname").val().trim();
				begin = $("#in-begin").val().trim();
				end = $("#in-end").val().trim();
				name = $("#in-name").val().trim();
				state = $("#se-type").val().trim();
				alert("查询成功！")
				initFile();

			}
			//下载的方法
			function down(e) {
				$.ajax({
					url: "downFile.action",
					type: "post",
					data: {},
					dataType: "json",
					success: function(msg) {
						if(msg.type == "SUC") {
							window.location.href = $(e).attr("valuePath");
						} else {
							alert(msg.type);
						}

					},
					error: function() {
						alert("请求失败！");
					}
				});

			}

			//审核文件的方法
			function audit(e) {
				var state = 1;
				if($(e).attr("value") == "不通过") {
					state = 2
				}
				$.ajax({
					url: "auditFile.action",
					type: "post",
					data: {
						"doid": $(e).attr("valueId"),
						"state": state
					},
					dataType: "json",
					success: function(msg) {
						if(msg.type == "SUC") {
							alert("审核" + $(e).attr("value") + "!")
							initFile();
						} else {
							alert(msg.type);
						}

					},
					error: function() {
						alert("请求失败！");
					}
				});

			}
		</script>
	</body>

</html>