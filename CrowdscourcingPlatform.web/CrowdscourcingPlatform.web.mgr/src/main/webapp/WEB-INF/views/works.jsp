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
		<h1 align="center">作品管理</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">

			<div class="md2 ">
				服务商名： <input type="text" class="layui-input my-input" id="in-name" placeholder="服务商名">
			</div>

			<div class="md2 ">
				<form class="layui-form my-form">
					<div class="layui-form-item">
						作品状态：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="in-state">
								<option value=""></option>
								<option value="0">未上架</option>
								<option value="1">已上架</option>
							</select>
						</div>
					</div>
				</form>
			</div>


			<div class="md2 ">
				上架时间：&nbsp;<input type="text" class="layui-input my-input" id="in-begin" placeholder="开始时间">
			</div>
			<div class="md2 ">
				至：<input type="text" class="layui-input my-input" id="in-end" placeholder="结束时间">
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findWork()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>
				

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="work">
			<colgroup>
				<col width="140">
				<col width="140">
				<col width="130">
				<col width="140">
				<col width="100">
				<col width="130">
				<col width="250">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>服务商名</th>
					<th>作品标题</th>
					<th>作品类型</th>
					<th>上架时间</th>
					<th>金额</th>
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
				initWork();

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

			//分页参数(初始化的)
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件
			var name = $("#in-name").val().trim();
			var begin = $("#in-begin").val().trim();
			var end = $("#in-end").val().trim();
			var state = $("#in-state").val().trim();

			//分页初始化数据
			function initWork() {
				$("#work").find(".row").remove();
				$.ajax({
					url: "initWork.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"name": name,
						"begin": begin,
						"end": end,
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
										initWork();
									}
								}
							});
						});
						//数据的处理
						var workDtos = msg.workDtos;
					
						if(workDtos.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						
						
						for(var i = 0; i < workDtos.length; i++) {
							var wor = workDtos[i];
							var stateName="";
							if(wor.state==9){
								stateName="待审核"
							}
							if(wor.state==10){
								stateName="审核不通过"
							}
							if(wor.state==0){
								stateName="已下架"
							}
							if(wor.state==1){
								stateName="已上架"
							}
							if(wor.state==2||wor.state==5){
								stateName="交易中"
							}
							if(wor.state==3){
								stateName="交易成功"
							}
							if(wor.state==8){
								stateName="已删除"
							}
							$("#work").append("<tr class='row'></tr>")
							var $tr = $("#work").find(".row").last();
							$tr.append("<td >" + wor.useName + " </td>");
							$tr.append("<td >" + wor.title + " </td>");
							$tr.append("<td >" + wor.neeName+ " </td>");
							$tr.append("<td >" + wor.updateTime.substring(0,19) + " </td>");
							$tr.append("<td >" + wor.money + " </td>");
							$tr.append("<td >" + stateName+ " </td>");
							if(wor.state==9){
								$tr.append("<td >"
										+"</span><span style='display:none;'>" + wor.content + "</span> "
										+" <button class='layui-btn layui-btn-xs ' style='background-color:#F08080' workType="+wor.neeName+" value='详情' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> "
										+"<button class='layui-btn layui-btn-xs layui-bg-green'"
										+" value='审核通过'  userId="+wor.id +"  onclick='askMotifyState(this)'><i class='layui-icon layui-icon-auz'>&nbsp;审核通过</i></button> "
										+"<button class='layui-btn layui-btn-xs layui-btn-danger'"
										+" value='审核不通过'  userId="+wor.id +"  onclick='askMotifyState(this)'><i class='layui-icon layui-icon-password'>&nbsp;审核不通过</i></button> "
										+" </td>");
							}else if(wor.state==1){
								$tr.append("<td>"
										+"<div style='display:none;'>" + wor.content + "</div> " 
										+" <button class='layui-btn layui-btn-xs ' style='background-color:#F08080' workType="+wor.neeName+" value='详情' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> "
										
										+" </td>");
								
							}else if(wor.state==0){
								$tr.append("<td>"
										+"<div style='display:none;'>" + wor.content + "</div> " 
										+" <button class='layui-btn layui-btn-xs ' style='background-color:#F08080' workType="+wor.neeName+" value='详情' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> "
										
										+" </td>");
							}else{
								$tr.append("<td>"
										+"<div style='display:none;'>" + wor.content + "</div> " 
										+" <button class='layui-btn layui-btn-xs ' style='background-color:#F08080' workType="+wor.neeName+" value='详情' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> "
										+" </td>");
							}
								
							
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
			function findWork() {
				count = 0;
				index = 1;
				start = 0;

				name = $("#in-name").val().trim();
				begin = $("#in-begin").val().trim();
				end = $("#in-end").val().trim();
				state = $("#in-state").val().trim();
				

				if((begin != "" && end == "") || (begin == "" && end != "")) {
					layer.msg('日期信息填写不完整！',{
						icon: 0,
					    time: 1000, //1s后自动关闭
					  });
					return;
				}
				layer.msg('查询成功！',{
					icon: 6,
				    time: 1000, //1s后自动关闭
				  });
				initWork();
			}
			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例 
				//详情
				window.details = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.1],
						area: ['600px', '420px'],
						content: 'detailWork.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							data[0] = e.parentElement.parentElement.children[0].innerText.trim(); //自己的数据存进去
							data[1] = $(e).attr("workType");
							data[2] = e.parentElement.children[0].innerHTML;
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data); 
						}

					});
				}						 		
			});
			
			
			function askMotifyState(e){
				layer.confirm('确定要通过吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						motifyState(e);
					}
				);
			}
			//审核
			function motifyState(e) {
				var state=$(e).val();
				var workId=$(e).attr("userId")
				
				//雇主名字
				var uname=$(e).parent().parent().children().eq(0).text();
				
				var num=-1;
				if(state=="审核通过"){
					num=1;
				}
				if(state=="审核不通过"){
					num=10;
				}
				
				
				$.ajax({
					url:"motifyWorkState.action",
					type:"post",
					data:{
						"state":num,
						"uname":uname,
						"workId":workId
					},
					dataType:"json",
					success:function (msg) {
						if(msg.type=="SUC"){
							layer.msg(state+'成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							initWork();
						}else{
							layer.msg(state+'失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}

					},
					error:function(){
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