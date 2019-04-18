<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>行业资讯</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="css/zjw.css">
	</head>
	<body>
		<br />
		<br />
		<h1 align="center">行业资讯配置</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">
			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" style="background-color:#F4A460" onclick="createNews()">
					<i class='layui-icon layui-icon-add-1'>&nbsp;新增资讯</i>
				</button>
			</div>
			<div class="md2 ">
				标题： <input type="text" class="layui-input my-input" id="check_name" placeholder="资讯标题">
			</div>
			
			<div class="md2 ">
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						状态：
						<div class="layui-inline " style="width: 110px;">
							<select name="" lay-verify="required" id="check_state">
								<option value=""></option>
								<option value="0">未上线</option>
								<option value="1">已上线</option>
							</select>
						</div>
					</div>
				</form>
			</div>

<!-- 		</div> -->

<!-- 		<div class="layui-row  div-font"> -->

			<div class="md2 ">
				发布时间：&nbsp;<input type="text" class="layui-input my-input" id="check_time_from" placeholder="开始时间">
			</div>
			<div class="md2 ">
				至：<input type="text" class="layui-input my-input" id="check_time_to"
				 placeholder="结束时间">
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findNews()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

 		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="news-table">
			<colgroup>
				<col width="95">
				<col width="250">
				<col width="130">
				<col width="140">
				<col width="120">
				<col width="220">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th style="text-align : center;height:10px;">序号</th>
					<th style="text-align : center;height:10px;">标题</th>
					<th style="text-align : center;height:10px;">链接</th>
					<th style="text-align : center;height:10px;">新增时间</th>
					<th style="text-align : center;height:10px;">状态</th>
					<th style="text-align : center;height:10px;">操作</th>
					<th style="display: none;text-align : center;">资讯ID</th>
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
				//查询行业动态
				showNews();
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
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件：标题、状态、起始时间、结束时间
			var check_name = $("#check_name").val().trim();
			var check_state = $("#check_state").val().trim();
			var check_time_from = $("#check_time_from").val().trim();
			var check_time_to = $("#check_time_to").val().trim();

			//分页初始化数据
			function showNews(){
				$("#news-table").find(".row").remove();
				$.ajax({
					url: "do-showNews.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"name": check_name,
						"state": check_state,
						"startTime": check_time_from,
						"endTime": check_time_to
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
										showNews();
									}
								}
							});
						});
						//数据的处理
						var newsList = msg.newsList;

						if (newsList.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						for (var i = 0; i < newsList.length; i++) {
							var news = newsList[i];

							$("#news-table").append("<tr class='row'></tr>")
							var $tr = $("#news-table").find(".row").last();
							$tr.append("<td >" + (i+1) + "</td>");
							$tr.append("<td >" + news.name + "</td>");
							$tr.append("<td >" + news.link + "</td>");
							$tr.append("<td >" + news.createTime.substring(0,19) + " </td>");
							$tr.append("<td >" + (news.state == '0' ? '未上线' : '已上线') + "</td>");
/* 							$tr.append(
								"<td >"+
								" <button class='layui-btn layui-btn-xs layui-btn-normal' value='修改' onclick='update(this)'/></button> " +
								" <button class='layui-btn layui-btn-xs layui-btn-normal' value='删除' onclick='askDel(this)'/></button> " +
								" <button class='layui-btn layui-btn-xs layui-btn-normal' value=" + (news.state == '0' ? '上线' :
									'下线') + " onclick='" + (news.state == '0' ? 'askOnline(this)' : 'askOffline(this)') + "'/></button></td>"
							); */
							$tr.append(
									"<td >"+
									" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='askDel(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-warm' onclick=" + (news.state == '0' ? 'askOnline(this)' : 'askOffline(this)') + ">"+
									(news.state == '0' ? "<i class='layui-icon layui-icon-up'>&nbsp;上线</i>" :"<i class='layui-icon layui-icon-down'>&nbsp;下线</i>") +"</button></td>"
							);
							
							$tr.append("<td style='display: none;'>" + news.id+ "</td>");
						}
					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
			}
			//根据条件查询文档
			function findNews() {
				count = 0;
				index = 1;
				start = 0;

				check_name = $("#check_name").val().trim();
				check_state = $("#check_state").val().trim();
				check_time_from = $("#check_time_from").val().trim();
				check_time_to = $("#check_time_to").val().trim();
				
				if(check_time_from.length>0 && check_time_to.length<=0){
					layer.msg('请填写完整的时间信息！',{
						icon: 0,
					    time: 1000, //1s后自动关闭
					  });
					return;
				}else if(check_time_to.length>0 && check_time_from.length<=0){
					layer.msg('请填写完整的时间信息！',{
						icon: 0,
					    time: 1000, //1s后自动关闭
					  });
					return;
				}		
				
				layer.msg('查询成功！',{
					icon: 6,
				    time: 1000, //1s后自动关闭
				  });
				showNews();
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
						content: 'updateNews.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							data[0] = e.parentElement.parentElement.children[1].innerText.trim(); //自己的数据存进去
							data[1] = e.parentElement.parentElement.children[2].innerText.trim();
 							data[2] = e.parentElement.parentElement.children[6].innerText.trim();
/* 							data[3] = e.parentElement.children[0].innerText.trim(); */
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data);
						}

					});

				}
				
				//新增资讯
				window.createNews = function() {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['500px', '350px'],//iframe的url
						content: 'createNews.html', //iframe的url，no代表不显示滚动条				

					});
				}
			});
			
			//询问是否删除
			function askDel(e){
				layer.confirm('确定要删除吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						del(e);
					}
				);
			}
			//删除
			function del(e) {
				var select_id = e.parentElement.parentElement.children[6].innerText.trim();
				var select_name = e.parentElement.parentElement.children[1].innerText.trim();
				$.ajax({
					url: "do-delNews.action",
					type: "post",
					data: {
						"id": select_id,
						"name": select_name,
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('删除成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							start = 0;
							index = 1;
							showNews();
						} else {
							layer.msg('删除失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
			}

			//询问是否上线
			function askOnline(e){
				layer.confirm('确定要上线吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						online(e);
					}
				);
			}
			//上线
			function online(e) {
				var select_id = e.parentElement.parentElement.children[6].innerText.trim();
				var select_name = e.parentElement.parentElement.children[1].innerText.trim();
				$.ajax({
					url: "do-onlineNews.action",
					type: "post",
					data: {
						"id": select_id,
						"name": select_name,
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('上线成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							showNews();
						} else {
							layer.msg('上线失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
			}
			
			//询问是否下线			
			function askOffline(e){
				layer.confirm('确定要下线吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						offline(e);
					}
				);
			}
			//下线
			function offline(e) {
				var select_id = e.parentElement.parentElement.children[6].innerText.trim();
				var select_name = e.parentElement.parentElement.children[1].innerText.trim();
				$.ajax({
					url: "do-offlineNews.action",
					type: "post",
					data: {
						"id": select_id,
						"name": select_name,
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('下线成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							showNews();
						} else {
							layer.msg('下线失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}

					},
					error: function() {
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
