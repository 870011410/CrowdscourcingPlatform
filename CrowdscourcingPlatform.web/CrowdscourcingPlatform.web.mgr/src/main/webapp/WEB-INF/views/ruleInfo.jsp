<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>规则中心配置</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<link rel="stylesheet" href="css/zjw.css">
</head>

<body>
	<br />
	<br />
	<h1 align="center">规则中心配置</h1>

	<br />
	<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
	<br />
	<div class="layui-row  div-font">

		<div class="md2 ">
			<button class="layui-btn layui-btn-sm"
				style="background-color: #F4A460" onclick="createRule()">
				<i class='layui-icon layui-icon-add-1'>&nbsp;新增规则</i>
			</button>
		</div>

		<div class="md2 " style="margin-left: 20px;">
			规则内容：
			<input type="text" class="layui-input my-input" id="search-content" placeholder="规则内容" >

		</div>

		<div class="md2 ">
			<form class="layui-form my-form" action="" id="">
				<div class="layui-form-item">
					规则类型：
					<div class="layui-inline " style="width: 100px;">
						<select name=""  id="search-type">
							<option value=""></option>
						</select>
					</div>
				</div>
			</form>
		</div>

		<div class="md2 ">
			<form class="layui-form my-form" action="" id="">
				<div class="layui-form-item">
					状态：
					<div class="layui-inline " style="width: 100px;">
						<select name=""  id="search-state" >
							<option value=""></option>
							<option value="0">未上线</option>
							<option value="1">已上线</option>
						</select>
					</div>
				</div>
			</form>
		</div>

		<div class="md2 ">
			<button class="layui-btn layui-btn-sm" onclick="findRules()">
				<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
			</button>
		</div>

	</div>



	<br />
	<table class="layui-table ta-search" lay-size="lg" id="table_rule"
		lay-filter="demoEvent">
		<colgroup>
			<col width="95">
			<col width="140">
			<col width="200">
			<col width="90">
			<col width="120">
			<col width="250">

		</colgroup>
		<thead>
			<tr class="layui-bg-green">
				<th style="text-align: center">序号</th>
				<th style="text-align: center">规则类型</th>
				<th style="text-align: center"
					lay-data="{field:'sign', width:'50%', event: 'setSign', style:'cursor: pointer;'}">规则内容</th>
				<th style="text-align: center">扣分
				</td>
				<th style="text-align: center">状态</th>
				<th style="text-align: center">操作
				</td>
				<th style="display: none; text-align: center;">规则ID</th>
				<th style="display: none; text-align: center;">规则类型ID</th>

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
				searchRule();
				
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
							$("#search-type").append("<option value="+ruleTypes[i].id+" >"+ruleTypes[i].name+"</option>");
							
						}
						form.render();
					},
					
					error : function() {
						alert("请求失败！");
					}
				});
				
			}
	
	//删除规则的方法
	function deleteRule(e){
		var ruleId=e.parentElement.parentElement.children[6].innerText.trim();
//		alert("规则ID："+ruleId);
		layer.open({
			  content: '确定删除这条规则吗？'
			  ,btn: ['确定', '取消']
			  ,yes: function(index, layero){
			    //按钮【按钮一】的回调
					$.ajax({
						url: "do-deleteRule.action",
						type: "post",
						data: {
							"id": ruleId,
						},
						dataType: "json",
						success: function(msg) {
							if (msg.index>0) {
								searchRule();
								layer.msg('删除规则成功！',{icon: 6,time: 1000});
								
							}else{
								layer.msg('删除规则失败！',{icon: 5,time: 1000});
							}

						},
						error: function() {
							layer.msg('请求失败！',{icon: 5});
						}
					});
			  }
			  ,no: function(index, layero){
			    //按钮【按钮二】的回调
			    //return false 开启该代码可禁止点击该按钮关闭
			  }
			});
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
				area: ['500px', '450px'],
				content: 'updateRule.html', //iframe的url，no代表不显示滚动条
				success: function(layero, index) {
					var data = new Array();
					//将父页面的数据存进去
					data[0] = e.parentElement.parentElement.children[7].innerText.trim();//规则类型ID
					data[1] = e.parentElement.parentElement.children[2].innerText.trim();//规则内容					
					data[2] = e.parentElement.parentElement.children[6].innerText.trim();//规则ID
					data[3] = e.parentElement.parentElement.children[3].innerText.trim();//扣分
					var ruleState=e.parentElement.parentElement.children[4].innerText.trim();//规则状态
					if(ruleState=="未上线"){
						data[4] =0;//规则状态ID
					}else{
						data[4] =1;//规则状态ID
					}
					var body = layer.getChildFrame('body', index); //确定两个界面父子关系
					var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
					iframeWin.inputDataHandle(data);
				}

			});

		}
		
		//新增资讯
		window.createRule = function() {
			layer.open({
				type: 2,
				title: false,
				shade: [0.2],
				area: ['500px', '450px'],//iframe的url
				content: 'createRule.html', //iframe的url，no代表不显示滚动条				

			});
		}
 	}); 
			
			//分页参数(初始化的)
			//从哪里开始
 			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件
			var search_content = $("#search-content").val().trim();
			var search_type = $("#search-type").val().trim();
			var search_state = $("#search-state").val().trim();

			//分页初始化数据
			function searchRule(){
				
				$("#table_rule").find(".row").remove();
				$.ajax({
					url: "do-searchRuleInfo.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"content": search_content,
						"rteId": search_type,
						"state": search_state,
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
										searchRule();
									}
								}
							});
						});
						
						//数据的处理
						var ruleList = msg.ruleList;

						if (ruleList.length == 0) {
							layer.msg('未查询到匹配的结果！',{icon: 5,time: 1000});
						}
						for (var i = 0; i < ruleList.length; i++) {
							var ruleCenter = ruleList[i];

							$("#table_rule").append("<tr class='row'></tr>")
							var $tr = $("#table_rule").find(".row").last();
	
							$tr.append("<td >" +(i+1)+ "</td>");
							$tr.append("<td >" + ruleCenter.rteName + "</td>");
/* 							if(ruleCenter.content.length>10){
								$tr.append("<td >" + ruleCenter.content.substring(0, 10)+ "...</td>");
							}else{
								$tr.append("<td >" + ruleCenter.content+"</td>");
							} */
							$tr.append("<td >" + ruleCenter.content+"</td>");
							$tr.append("<td >" + ruleCenter.score+ "</td>");
							if(ruleCenter.state==0){
								
								$tr.append("<td >未上线</td>");
								$tr.append(
										"<td >"+
										" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='deleteRule(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-warm'   onclick='askChange(this)'><i class='layui-icon layui-icon-up'>&nbsp;上线</i></button></td>"
									);
							}else{
								$tr.append("<td >已上线</td>");
								$tr.append(
										"<td >"+
										" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='deleteRule(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-warm'   onclick='askChange(this)'><i class='layui-icon layui-icon-down'>&nbsp;下线</i></button></td>"
									);
							}
							$tr.append("<td style='display: none;'>" + ruleCenter.id+ "</td>");
							$tr.append("<td style='display: none;'>" + ruleCenter.rteId+ "</td>");
							
						}
					},
					error: function() {
						layer.msg('请求失败！',{icon: 5});
					}
				});
			}
			
			//根据条件查询规则
			function findRules() {
//				alert("进入条件查询");
				count = 0;
				index = 1;
				start = 0;
				
				search_content = $("#search-content").val().trim();
				search_type = $("#search-type").val().trim();
				search_state = $("#search-state").val().trim();
//				alert("内容："+search_content+"类型："+search_type+"状态："+search_state);
				searchRule();
			}
			
			function askChange(e){
				layer.confirm('确定要修改吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						changeRuleState(e);
					}
				);
			}
			
			//规则的发布&取消发布
			function changeRuleState(e){	
				var ruleId=e.parentElement.parentElement.children[6].innerText.trim();				
				var ruleState=e.parentElement.parentElement.children[4].innerText.trim();
				var state;
				if(ruleState=="未上线"){
					state=1;
				}else{
					state=0;
				}				
//				alert("修改ID:"+ruleId+"，状态："+ruleState);
				$.ajax({
					url: "do-changeRuleState.action",
					type: "post",
					data: {
						"id":ruleId,
						"state":state
					},
					dataType: "json",
					success: function(msg) {
//						alert("这是传回来的index"+msg.index);
						if (msg.index>0) {
							if(ruleState=="未上线"){
								e.parentElement.parentElement.children[4].innerText="已上线";
								e.parentElement.parentElement.children[5].innerHTML=
										"<td >"+
										" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='deleteRule(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-warm'   onclick='askChange(this)'><i class='layui-icon layui-icon-down'>&nbsp;下线</i></button></td>";
								layer.msg('上线成功！',{icon: 6,time: 2000});
							}else{
								e.parentElement.parentElement.children[4].innerText="未上线";
								e.parentElement.parentElement.children[5].innerHTML=
										"<td >"+
										" <button class='layui-btn layui-btn-xs layui-btn-normal' onclick='update(this)'><i class='layui-icon layui-icon-edit'>&nbsp;修改</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-danger' onclick='deleteRule(this)'><i class='layui-icon layui-icon-delete'>&nbsp;删除</i></button> " +
										" <button class='layui-btn layui-btn-xs layui-btn-warm' onclick='askChange(this)'><i class='layui-icon layui-icon-up'>&nbsp;上线</i></button></td>";
								layer.msg('下线成功！',{icon: 6,time: 2000});
							}

						}else{
							layer.msg('修改失败！',{icon: 5,time: 2000});
						}

					},
					error: function() {
						layer.msg('请求失败！',{icon: 5});
					}
				});
			}		
			
			

		</script>
</body>

</html>