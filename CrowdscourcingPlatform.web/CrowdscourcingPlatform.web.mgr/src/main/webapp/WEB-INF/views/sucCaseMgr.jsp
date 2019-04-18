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
		<h1 align="center">成功案例配置</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">			
			<div class="md2 ">
				<button class="layui-btn layui-btn-sm " style="background-color:#F4A460" onclick='create()'>
					<i class='layui-icon layui-icon-add-1'>新增案例</i>
				</button>
			</div>
			<div class="md2 " style="margin-left:20px;">
				标题： <input type="text" class="layui-input my-input" id="check_title" placeholder="案例标题">
			</div>

			<div class="md2 " >
				案例内容： <input type="text" class="layui-input my-input" id="check_content" placeholder="案例内容">
			</div>

			<div class="md2"  >
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


<!-- 			<div class="md2 " >
				发布时间：&nbsp;<input type="text" class="layui-input my-input" id="check_time_from" placeholder="开始时间">
			</div>
			<div class="md2 " >
				至：<input type="text" class="layui-input my-input" id="check_time_to"
				 placeholder="结束时间">
			</div> -->

			<div class="md2 " >
				<button class="layui-btn layui-btn-sm " onclick="findStorys()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="story">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="120">
				<col width="550">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>标题</th>
					<th>内容</th>
					<th>雇主</th>
					<th>服务商</th>
					<th>联盟</th>
					<th>作品</th>
					<th>需求</th>
<!-- 					<th>发布时间</th> -->
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
/* 			//日期选择器
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
			}); */

			//分页参数(初始化的)
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件
			var check_title = $("#check_title").val().trim();
			var check_content = $("#check_content").val().trim();
			var check_state = $("#check_state").val().trim();
/* 			var check_time_from = $("#check_time_from").val().trim();
			var check_time_to = $("#check_time_to").val().trim(); */

			//分页初始化数据
			function showStorys() {
				$("#story").find(".row").remove();
				$.ajax({
					url: "initSucCase.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"title": check_title,
						"content": check_content,
						"state": check_state,
/* 						"check_time_from": check_time_from,
						"check_time_to": check_time_to */

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
						var caseList = msg.caseList;

						if (caseList.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						for (var i = 0; i < caseList.length; i++) {
							var sucCase = caseList[i];

							$("#story").append("<tr class='row'></tr>")
							var $tr = $("#story").find(".row").last();
	
							$tr.append("<td >" + sucCase.sucTitle + "</td>");
							if(sucCase.sucContent.length>7){
								$tr.append("<td >" + sucCase.sucContent.substring(0,7) + "...</td>");
							}else{
								$tr.append("<td >" + sucCase.sucContent + "</td>");
							}
							
							$tr.append("<td >" + sucCase.useName+ "</td>");
							$tr.append("<td >" + (sucCase.serName == null ? "—————" : sucCase.serName) + "</td>");
							$tr.append("<td >" + (sucCase.leaName == null ? "—————" : sucCase.leaName)+ "</td>");
							$tr.append("<td >" + (sucCase.worTitle == null ? "—————" : sucCase.worTitle) + "</td>");
							$tr.append("<td >" + (sucCase.neeTitle == null ? "—————" : sucCase.neeTitle) + "</td>");
/* 							alert(sucCase.sucState); */
							$tr.append("<td >" + (sucCase.sucState=='0'?'未上线':'已上线') + "</td>");
							$tr.append(
									"<td ><span style='display:none'>" + sucCase.sucContent + "</span>"+
									" <button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='askDel(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
									" <button class='layui-btn layui-btn-xs layui-btn-warm'   onclick='"+(sucCase.sucState=='0'?'askUpline(this)':'askDownline(this)')+"'>"+
									(sucCase.sucState=='0'? "<i class='layui-icon layui-icon-up'>&nbsp;上线</i>":"<i class='layui-icon layui-icon-down'>&nbsp;下线</i>")+"</button>"+
									" <button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#CD853F' onclick='stick(this)'><i class='layui-icon layui-icon-top'>&nbsp;置顶</i></button></td>"
								);
							$tr.append("<td style='display:none'>" + sucCase.sucId+ "</td>");
							$tr.append("<td style='display:none'>" + sucCase.sucRank+ "</td>");
						}
						
					},
					error: function() {
						layer.msg('请求失败！',{
							icon: 2,
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
				check_content = $("#check_content").val().trim();
				check_state = $("#check_state").val().trim();
/* 				check_time_from = $("#check_time_from").val().trim();
				check_time_to = $("#check_time_to").val().trim(); */
				
/* 				if(check_time_from.length>0 && check_time_to.length<=0){
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
				} */				
				
				layer.msg('查询成功！',{
					icon: 6,
				    time: 1000, //20s后自动关闭
				  });
				showStorys();
			}
			
			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例 
				//详情
				window.details = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['600px', '420px'],
						content: 'detailsSucCase.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data=new Array();
							//自己的数据存进去
							data[0]=e.parentElement.parentElement.children[0].innerText.trim();//标题
							data[1]=e.parentElement.children[0].innerText.trim();//内容
 /* 							data[2]=e.parentElement.parentElement.children[9].innerText.trim();//ID */
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
						area: ['600px', '420px'],
						content: 'updateSucCase.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data=new Array();
							//自己的数据存进去
							data[0]=e.parentElement.parentElement.children[0].innerText.trim();//标题
							data[1]=e.parentElement.parentElement.children[1].innerText.trim();//内容
 							data[2]=e.parentElement.parentElement.children[9].innerText.trim();//ID
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
						area: ['600px', '450px'],
						content: 'createSucCase.html', //iframe的url，no代表不显示滚动条
					});
				}
			});
			
			//置顶
			function stick(e) {
				var select_id=e.parentElement.parentElement.children[9].innerText.trim();
				var select_rank=e.parentElement.parentElement.children[10].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
/* 				alert(select_id+","+select_rank+","+select_title); */
				$.ajax({
					url: "do-stickSucCase.action",
					type: "post",
					data: {
						"id": select_id,
						"title": select_title,
						"rank": select_rank
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "success") {
							layer.msg('置顶成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							start = 0;
							index = 1;
							showStorys();
						}else if(msg.type == "alredyStick"){
							layer.msg('已经是第一个了！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						} else {
							layer.msg('置顶失败！',{
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
			
			function askDel(e){
				layer.confirm('确定要删除吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						del(e);
					}
				);
			}
			//删除案例
			function del(e) {
				var select_id=e.parentElement.parentElement.children[9].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-delSucCase.action",
					type: "post",
					data: {
						"id": select_id,
						"title": select_title,
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
			
			function askUpline(e){
				layer.confirm('确定要上线吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						upline(e);
					}
				);
			}
			
			//上线
			function upline(e) {
				var select_id=e.parentElement.parentElement.children[9].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-onlineSucCase.action",
					type: "post",
					data: {
						"id": select_id,
						"title": select_title,

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
			
			function askDownline(e){
				layer.confirm('确定要下线吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						downline(e);
					}
				);
			}
			
			//下线
			function downline(e) {
				var select_id=e.parentElement.parentElement.children[9].innerText.trim();
				var select_title=e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "do-offlineSucCase.action",
					type: "post",
					data: {
						"id": select_id,
						"title": select_title,

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
