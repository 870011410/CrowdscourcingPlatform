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
		<h1 align="center">行业动态配置</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">
			<div class="md2">
				<button class="layui-btn layui-btn-sm" style="background-color:#F4A460" onclick='create()'>
					<i class='layui-icon layui-icon-add-1'>&nbsp;新增动态</i>
				</button>
			</div>

			<div class="md2 " >
				动态名： <input type="text" class="layui-input my-input" id="check_name" placeholder="开始时间">
			</div>

			<div class="md2 ">
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						服务类型：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="check_type">
								<option value=""></option>

							</select>
						</div>
					</div>
				</form>
			</div>

			<div class="md2 ">
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						状态：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="check_state">
								<option value=""></option>
								<option value="0">未上线</option>
								<option value="1">已上线</option>
							</select>
						</div>
					</div>
				</form>
			</div>

			<div class="md2 ">
				发布时间：&nbsp;<input type="text" class="layui-input my-input" id="check_time_from" placeholder="开始时间">
			</div>
			<div class="md2 ">
				至：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="layui-input my-input" id="check_time_to"
				 placeholder="结束时间">
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findTrends()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="trends">
			<colgroup>
				<col width="140">
				<col width="140">
				<col width="130">
				<col width="180">
				<col width="120">
				<col width="320">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>动态名</th>
					<th>链接</th>
					<th>服务类型</th>
					<th>发布时间</th>
					<th>状态</th>
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
				//初始化下拉框
				selectServerType();
				//查询行业动态
				showTrends();
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
						//清空数据
					//	$("#check_type").empty();
						//把数据写入下来框中
						for (var i = 0; i < serverTypes.length; i++) {
								$("#check_type").append(
										"<option value="+serverTypes[i].id+">"
												+ serverTypes[i].name + "</option>");
							}
						form.render();
					},
					error : function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //20s后自动关闭
						  });
					}
				});
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
			var check_state = $("#check_state").val().trim();
			var check_time_from = $("#check_time_from").val().trim();
			var check_time_to = $("#check_time_to").val().trim();

			//分页初始化数据
			function showTrends() {
				$("#trends").find(".row").remove();
				$.ajax({
					url: "do-showTrends.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"check_name": check_name,
						"check_type": check_type,
						"check_state": check_state,
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
										showTrends();
									}
								}
							});
						});
						//数据的处理
						var trends = msg.trends;

						if (trends.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						}
						for (var i = 0; i < trends.length; i++) {
							var tre = trends[i];

							$("#trends").append("<tr class='row'></tr>")
							var $tr = $("#trends").find(".row").last();

							$tr.append("<td >" + tre.name + "</td>");
							$tr.append("<td >" + tre.link + "</td>");
							$tr.append("<td >" + tre.steName + "</td>");
							$tr.append("<td >" + tre.createTime.substring(0,19) + " </td>");
							$tr.append("<td >" + (tre.state == '0' ? '未上线' : '已上线') + "</td>");
							$tr.append(
								"<td ><span style='display:none;'>" + tre.id + "</span><span style='display:none;'>" + tre.steId +
								"</span> " +
								" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button>" +
								" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='askDel(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button>" +
								" <button class='layui-btn layui-btn-xs layui-btn-warm' onclick='" + (tre.state == '0' ? 'upline(this)' : 'downline(this)') + "'>"+
								(tre.state == '0' ? "<i class='layui-icon layui-icon-up'>&nbsp;上线</i>" :"<i class='layui-icon layui-icon-down'>&nbsp;下线</i>") + "</button></td>"
							);
						}
					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //20s后自动关闭
						  });
					}
				});
			}
			//根据条件查询文档
			function findTrends() {
				count = 0;
				index = 1;
				start = 0;

				check_name = $("#check_name").val().trim();
				check_type = $("#check_type").val().trim();
				check_state = $("#check_state").val().trim();
				check_time_from = $("#check_time_from").val().trim();
				check_time_to = $("#check_time_to").val().trim();
				
				if(check_time_from.length>0 && check_time_to.length<=0){
					layer.msg('请填写完整的时间信息！',{
						icon: 0,
					    time: 1000, //20s后自动关闭
					  });
					return;
				}else if(check_time_to.length>0 && check_time_from.length<=0){
					layer.msg('请填写完整的时间信息！',{
						icon: 0,
					    time: 1000, //20s后自动关闭
					  });
					return;
				}		
				
				layer.msg('查询成功！',{
					icon: 6,
				    time: 1000, //20s后自动关闭
				  });
				showTrends();
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
						area: ['500px', '420px'],
						content: 'updateTrends.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							data[0] = e.parentElement.parentElement.children[0].innerText.trim(); //自己的数据存进去
							data[1] = e.parentElement.parentElement.children[1].innerText.trim();
							data[2] = e.parentElement.children[1].innerText.trim();
							data[3] = e.parentElement.children[0].innerText.trim();
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data);
						}

					});
				}
				//发布
				window.create = function() {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['500px', '450px'],
						content: 'createTrends.html', //iframe的url，no代表不显示滚动条
					});
				}
			});
			
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
				var select_id = e.parentElement.children[0].innerText.trim();
				var select_name = e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-delTrends.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_name": select_name,
						"admName": "第一个管理员"
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('删除成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							start = 0;
							index = 1;
							showTrends();
						} else {
							layer.msg('删除失败！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon:5,
						    time: 1000, //20s后自动关闭
						  });
					}
				});
			}

			//上线
			function upline(e) {
				var select_id = e.parentElement.children[0].innerText.trim();
				var select_name = e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-uplineTrends.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_name": select_name,
						"admName": "第一个管理员"
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('上线成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							showTrends();
						} else {
							layer.msg('上线失败！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //20s后自动关闭
						  });
					}
				});
			}

			//下线
			function downline(e) {
				var select_id = e.parentElement.children[0].innerText.trim();
				var select_name = e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-downlineTrends.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_name": select_name,
						"admName": "第一个管理员"
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('下线成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							showTrends();
						} else {
							layer.msg('下线失败！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						}

					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //20s后自动关闭
						  });
					}
				});

			}
		</script>
	</body>

</html>
