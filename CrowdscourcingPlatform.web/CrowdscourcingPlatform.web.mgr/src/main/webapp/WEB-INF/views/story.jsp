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
		<h1 align="center">故事配置</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">			
			<div class="md2 ">
				<button class="layui-btn layui-btn-sm " style="background-color:#F4A460" onclick='create()'>
					<i class='layui-icon layui-icon-add-1'>新增故事</i>
				</button>
			</div>
			<div class="md2 " style="margin-left:20px;">
				标题： <input type="text" class="layui-input my-input" id="check_title" placeholder="故事标题">
			</div>

			<div class="md2 " >
				雇主名字： <input type="text" class="layui-input my-input" id="check_use_name" placeholder="雇主名字">
			</div>

			<div class="md2"  >
				<form class="layui-form my-form" action="" id="in-type">
					<div class="layui-form-item">
						状态：
						<div class="layui-inline " style="width: 90px;">
							<select name="" lay-verify="required" id="check_state">
								<option value=""></option>
								<option value="0">未上线</option>
								<option value="1">已上线</option>
							</select>
						</div>
					</div>
				</form>
			</div>

<!-- 		</div>

		<div class="layui-row  div-font"> -->

			<div class="md2 " >
				发布时间：&nbsp;<input type="text" class="layui-input my-input" id="check_time_from" placeholder="开始时间">
			</div>
			<div class="md2 " >
				至：<input type="text" class="layui-input my-input" id="check_time_to"
				 placeholder="结束时间">
			</div>

			<div class="md2 " >
				<button class="layui-btn layui-btn-sm " onclick="findStorys()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="story">
			<colgroup>
				<col width="140">
				<col width="120">
				<col width="150">
				<col width="140">
				<col width="100">
				<col width="320">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>标题</th>
					<th>雇主名称</th>
					<th>内容</th>
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
			//导入form样式
			layui.use('form', function() {
				var form = layui.form;

			});
			window.onload = function() {

				//查询文件
				showStorys();

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
			//查询的条件
			var check_title = $("#check_title").val().trim();
			var check_use_name = $("#check_use_name").val().trim();
			var check_state = $("#check_state").val().trim();
			var check_time_from = $("#check_time_from").val().trim();
			var check_time_to = $("#check_time_to").val().trim();

			//分页初始化数据
			function showStorys() {
				$("#story").find(".row").remove();
				$.ajax({
					url: "do-showStorys.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"check_title": check_title,
						"check_use_name": check_use_name,
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
										showStorys();
									}
								}
							});
						});
						//数据的处理
						var storys = msg.storys;

						if (storys.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //20s后自动关闭
							  });
						}
						for (var i = 0; i < storys.length; i++) {
							var sto = storys[i];

							$("#story").append("<tr class='row'></tr>")
							var $tr = $("#story").find(".row").last();
	
							$tr.append("<td >" + sto.title + "</td>");
							$tr.append("<td >" + sto.useName + "</td>");
							$tr.append("<td >" + sto.content.substring(0,8) + "...</td>");
							$tr.append("<td >" + sto.createTime.substring(0,19) + " </td>");
							$tr.append("<td >" + (sto.state=='0'?'未上线':'已上线') + "</td>");
							$tr.append(
									"<td ><span style='display:none;'>" + sto.id + "</span><span style='display:none;'>" + sto.rank +
									"</span><span style='display:none;'>" + sto.content + "</span>" +
									"</span><span style='display:none;'>" + sto.content + "</span>" + 
									" <button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='askDel(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-warm'   onclick='"+(sto.state=='0'?'upline(this)':'downline(this)')+"'>"+
									(sto.state=='0'? "<i class='layui-icon layui-icon-up'>&nbsp;上线</i>":"<i class='layui-icon layui-icon-down'>&nbsp;下线</i>")+"</button>"+
									" <button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#CD853F' onclick='stick(this)'><i class='layui-icon layui-icon-top'>&nbsp;置顶</i></button></td>"
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
			function findStorys() {
				count = 0;
				index = 1;
				start = 0;
				
				check_title = $("#check_title").val().trim();
				check_use_name = $("#check_use_name").val().trim();
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
				showStorys();
			}
			
			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer;//执行一个laydate实例 
				//详情
				window.details = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['550px', '400px'],
						content: 'detailsStory.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data=new Array();
							data[0]=e.parentElement.parentElement.children[0].innerText.trim();//自己的数据存进去
							data[1]=e.parentElement.parentElement.children[1].innerText.trim();
							data[2]=e.parentElement.children[2].innerText.trim();
							var body=layer.getChildFrame('body',index);//确定两个界面父子关系
							var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
							iframeWin.inputDataHandle(data);
						}

					});
				}
				//修改
				window.update = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['550px', '400px'],
						content: 'updateStory.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data=new Array();
							data[0]=e.parentElement.parentElement.children[0].innerText.trim();//自己的数据存进去
							data[1]=e.parentElement.parentElement.children[1].innerText.trim();
							data[2]=e.parentElement.children[2].innerText.trim();
							data[3]=e.parentElement.children[0].innerText.trim();
							var body=layer.getChildFrame('body',index);//确定两个界面父子关系
							var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
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
						area: ['550px', '400px'],
						content: 'createStory.html', //iframe的url，no代表不显示滚动条
					});
				}
			});
			
			//置顶
			function stick(e) {
				var select_id=e.parentElement.children[0].innerText.trim();
				var select_rank=e.parentElement.children[1].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-stickStory.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_title": select_title,
/* 						"admName": "第一个管理员", */
						"select_rank": select_rank
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('置顶成功！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
							start = 0;
							index = 1;
							showStorys();
						}else if(msg.type == "alredyStick"){
							layer.msg('已经是第一个了！',{
								icon: 6,
							    time: 1000, //20s后自动关闭
							  });
						} else {
							layer.msg('置顶失败！',{
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
				var select_id=e.parentElement.children[0].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-delStory.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_title": select_title,
/* 						"admName": "第一个管理员" */
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
							showStorys();
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
			
			//上线
			function upline(e) {
				var select_id=e.parentElement.children[0].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-uplineStory.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_title": select_title,
/* 						"admName": "第一个管理员" */
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('上线成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							showStorys();
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
			
			//下线
			function downline(e) {
				var select_id=e.parentElement.children[0].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-downlineStory.action",
					type: "post",
					data: {
						"select_id": select_id,
						"select_title": select_title,
/* 						"admName": "第一个管理员" */
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('下线成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							showStorys();
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
