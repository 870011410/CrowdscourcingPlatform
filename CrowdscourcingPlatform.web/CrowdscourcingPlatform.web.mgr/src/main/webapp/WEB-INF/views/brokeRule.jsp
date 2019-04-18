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
		<h1 align="center">曝光台配置</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">
			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" style="background-color:#F4A460" onclick="addBrokeRule()">
					<i class='layui-icon layui-icon-add-1'>&nbsp;新增违规</i>
				</button>
			</div>
			<div class="md2 ">
				用户名字： <input type="text" class="layui-input my-input" id="in-name" placeholder="用户名">
			</div>

			<div class="md2 ">
				<form class="layui-form my-form">
					<div class="layui-form-item">
						规则类型：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="in-rule">
								<option value=""></option>
								
							</select>
						</div>
					</div>
				</form>
			</div>

			<div class="md2 ">
				<form class="layui-form my-form">
					<div class="layui-form-item">
						状态：
						<div class="layui-inline " style="width: 100px;">
							<select name="" lay-verify="required" id="in-state">
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

			<div class="md2 ">
				发布时间：&nbsp;<input type="text" class="layui-input my-input" id="in-begin" placeholder="开始时间">
			</div>
			<div class="md2 ">
				至：<input type="text" class="layui-input my-input" id="in-end" placeholder="结束时间">
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findBrokeRule()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="brokeRule">
			<colgroup>
				<col width="100">
				<col width="120">
				<col width="130">
				<col width="140">
				<col width="100">
				<col width="320">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>用户名</th>
					<th>规则类型</th>
					<th>违规内容</th>
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
				selectRuleType(form)

			});
			window.onload = function() {

				//查询文件
				initBrokeRule();

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
			var rule = $("#in-rule").val().trim();
			var state = $("#in-state").val().trim();

			//分页初始化数据
			function initBrokeRule() {
				$("#brokeRule").find(".row").remove();
				$.ajax({
					url: "initBrokeRule.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"name": name,
						"begin": begin,
						"end": end,
						"rule": rule,
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
										initBrokeRule();
									}
								}
							});
						});
						//数据的处理
						var brokeRuleDtos = msg.brokeRuleDtos;
					
						if(brokeRuleDtos.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						
						
						for(var i = 0; i < brokeRuleDtos.length; i++) {
							var bro = brokeRuleDtos[i];
							$("#brokeRule").append("<tr class='row'></tr>")
							var $tr = $("#brokeRule").find(".row").last();
							$tr.append("<td >" + bro.useName + "</td>");
							$tr.append("<td >" + bro.ruleTypeName + "</td>");
							$tr.append("<td >" + bro.ruleContent.substring(0, 8) + "...</td>");
							$tr.append("<td >" + bro.createTime.substring(0,19) + " </td>");
							$tr.append("<td >" + (bro.state == '0' ? '未上线' : '已上线') + "</td>");
							$tr.append(
 								"<td ><span style='display:none;'>" + bro.id + "</span><span style='display:none;'>" + bro.rank +
								"</span><span style='display:none;'>" + bro.ruleContent + "</span> " +
								"</span><span style='display:none;'>" + bro.ruleId + "</span> " + 
								" <button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#F08080;' onclick='details(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;详情</i></button> " +
								" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
								" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='askDel(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button>  " +								
								" <button class='layui-btn layui-btn-xs layui-btn-warm' onclick='upOrDown(this)'>"+
								(bro.state == '0' ? "<i class='layui-icon layui-icon-up'>&nbsp;上线</i>" : "<i class='layui-icon layui-icon-down'>&nbsp;下线</i>")+
								" </button>"+
								" <button class='layui-btn layui-btn-xs layui-btn-normal' style='background-color:#CD853F' onclick='stick(this)'><i class='layui-icon layui-icon-top'>&nbsp;置顶</i></button></td> "
							);
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
			function findBrokeRule() {
				count = 0;
				index = 1;
				start = 0;

				name = $("#in-name").val().trim();
				begin = $("#in-begin").val().trim();
				end = $("#in-end").val().trim();
				rule = $("#in-rule").val().trim();
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
				initBrokeRule();
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
						area: ['550px', '400px'],
						content: 'detailbrokeRule.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							data[0] = e.parentElement.parentElement.children[0].innerText.trim(); //自己的数据存进去
							data[1] = e.parentElement.parentElement.children[1].innerText.trim();
							data[2] = e.parentElement.children[2].innerText.trim();
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data);
						}

					});
				}
				//发布违规
				window.addBrokeRule = function() {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['550px', '450px'],
						content: 'addBrokeRule.html', //iframe的url，no代表不显示滚动条				

					});
				}
				
 				//修改
				window.update = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.2],
						area: ['550px', '400px'],
						content: 'updateBrokeRule.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							var data = new Array();
							data[0] = e.parentElement.children[2].innerText.trim();	//	内容
							data[1] = e.parentElement.children[0].innerText.trim();	//  违规记录表ID
							data[2] = e.parentElement.children[3].innerText.trim();	//  规则编号ID
							var body = layer.getChildFrame('body', index); //确定两个界面父子关系
							var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
							iframeWin.inputDataHandle(data);
						}

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
				var brokeRule_id = e.parentElement.children[0].innerText.trim();
				var name = e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "delBrokeRule.action",
					type: "post",
					data: {
						"brokeRule_id": brokeRule_id,
						"name": name,
						
					},
					dataType: "json",
					success: function(msg) {
						if (msg.type == "SUC") {
/* 							alert("修改违规记录成功！"); */
							layer.msg('删除成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							
							initBrokeRule();
						} else {
/* 							alert(msg.type); */
							layer.msg(msg.type,{
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
			//置顶
			function stick(e) {
				var brokeRule_id = e.parentElement.children[0].innerText.trim();
				var brokeRule_rank = e.parentElement.children[1].innerText.trim();
				var name = e.parentElement.parentElement.children[0].innerText.trim();
				$.ajax({
					url: "stickBrokeRule.action",
					type: "post",
					data: {
						"brokeRule_id": brokeRule_id,
						"brokeRule_rank": brokeRule_rank,
						"name": name,
					},
					dataType: "json",
					success: function(msg) {
						if(msg.type == "SUC") {
							layer.msg('置顶成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							start = 0;
							index = 1;
							initBrokeRule();
						} else{
/* 							alert(msg.type); */
							layer.msg(msg.type,{
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
			function upOrDown(e) {
				var brokeRule_id = e.parentElement.children[0].innerText.trim();
				var name = e.parentElement.parentElement.children[0].innerText.trim();
				var state =0;
				var stateName=e.children[0].innerText.trim();

				/* if($(e).val()=="上线"){ */
				if(stateName=="上线"){
					state=1
				}
				
				$.ajax({
					url: "upOrDownBrokeRule.action",
					type: "post",
					data: {
						"brokeRule_id": brokeRule_id,
						"name": name,
						"state": state,
						/* "stateName":$(e).val() */
						"stateName":stateName
					},
					dataType: "json",
					success: function(msg) {
						if(msg.type == "SUC") {
							/* alert($(e).val()+"违规记录成功！"); */
							layer.msg(stateName+'违规记录成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							initBrokeRule();
						} else {
							/* alert($(e).val()+"违规记录失败！"); */
							layer.msg(stateName+'违规记录失败！',{
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

			//获取规则类型下拉框
			function selectRuleType(form){
				$.ajax({
					url : "selectRuleType.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到规则类型信息
						var ruleTypes= msg.ruleTypes;
						
						for(var i=0;i<ruleTypes.length;i++){
							$("#in-rule").append("<option value="+ruleTypes[i].id+" >"+ruleTypes[i].name+"</option>");
							
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

		</script>
	</body>

</html>