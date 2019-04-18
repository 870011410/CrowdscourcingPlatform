<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>联盟管理</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="css/zjw.css">
	</head>

	<body>
		<br />
		<br />
		<h1 align="center">联盟管理</h1>
		<br />
		<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
		<br />
		<div class="layui-row  div-font">

			<div class="md2 ">
				联盟名称： <input type="text" class="layui-input my-input" id="leaName" placeholder="联盟名称">

			</div>
			
			<div class="md2 ">
				<form class="layui-form my-form" action="" id="in-type">
				
					<div class="layui-form-item">
					联盟盟主：
						<div class="layui-inline " style="width: 110px;">
							<select name="" lay-verify="required" id="se-type">
								<option value="-1">请选择</option>

							</select>
						</div>
					</div>
				</form>
			</div>

<!-- 		</div>

		<div class="layui-row  div-font"> -->

			<div class="md2 ">
				创建时间：&nbsp;<input type="text" class="layui-input my-input" id="in-begin" placeholder="开始时间">

			</div>
			<div class="md2 ">
				至：<input type="text" class="layui-input my-input" id="in-end" placeholder="结束时间">

			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findLea()">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>

		</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="file">
			<colgroup>
				<col width="200">
				<col width="120">
				<col width="180">
				<col width="150">
				<col width="150">
				<col width="350">

			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>联盟名称</th>
					<th>盟主</th>
					<th>发起时间</th>
					<th>联盟人数</th>
					<th>联盟状态</th>
					<th>操作</th>

				</tr>
			</thead>

		</table>

		<div id="page" align="right" style="margin-right:50px"></div>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			//导入form样式
			var form;
			layui.use('form', function() {
				form = layui.form;
				//动态生成下拉框
				initLeaMaster();
				initLeaMeg();
			});
			
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

			//动态生成盟主下拉框
			function initLeaMaster() {

				$.ajax({
					url : "initLeaMaster.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						var users = msg.users;

						for (var i = 0; i < users.length; i++) {

							$("#se-type").append(
									"<option value="+users[i].id+">"
											+ users[i].name + "</option>");

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
			
			//分页参数(初始化的)
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			//查询的条件
			//联盟名称
			var leaName = $("#leaName").val().trim();
			//时间区间头
			var sTime = $("#in-begin").val().trim();
			//时间区间尾
			var eTime = $("#in-end").val().trim();
			//盟主id
			var leaMasterId =-1;
// $("#in-type").val().trim();
			//分页初始化数据
			function initLeaMeg() {
				$("#file").find(".row").remove();
				$.ajax({
					url: "initLeaMeg.action",
					type: "post",
					data: {
						"start": start,
						"limit": limit,
						"leaName": leaName,
						"sTime": sTime,
						"eTime": eTime,
						"leaMasterId": leaMasterId
						

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
										initLeaMeg();
									}
								}
							});
						});
                         //数据的处理
						var leas = msg.leas;
                         //各个联盟的人数集合
                         var peoples = msg.counts;
						if(leas.length == 0) {
							layer.msg('未查到匹配的结果！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
						for(var i = 0; i < leas.length; i++) {
							var lea = leas[i];
                              //处理联盟的状态
                              var leaState = lea.state;
                         //定义显示的状态
                              var stateName = "";
                         //定义操作的内容
                         var ctrl="";
                            //根据不同的状态拥有不同的操作
                         if(leaState==0){
                        	 stateName="待审核";
                        	 ctrl="<button class='layui-btn layui-btn-xs layui-btn-warm' value='审核通过'  leaId=" +
								lea.id +" leaName= "+ lea.name +
								" onclick='audiPass(this)'><i class='layui-icon layui-icon-ok'>&nbsp;审核通过</i></button> "+
								"<button class='layui-btn layui-btn-xs layui-btn-warm' value='审核不通过'  leaId=" +
								lea.id +" leaName= "+ lea.name +
								" onclick='audiNotGo(this)'><i class='layui-icon layui-icon-close'>&nbsp;审核不通过</i></button> "
                         }else if(leaState==1){
                        	 stateName="正常运行";
                        	 ctrl="<button class='layui-btn layui-btn-xs' style='background-color:#F08080' value='查看详情'  leaId=" +
								lea.id +" leaName= "+ lea.name +
								" onclick='showDeti(this)'><i class='layui-icon layui-icon-align-center'>&nbsp;查看详情</i></button> "+
								"<button class='layui-btn layui-btn-xs layui-btn-danger' value='违规封杀'  leaId=" +
								lea.id +" leaName= "+ lea.name +
								" onclick='stopLea(this)'><i class='layui-icon layui-icon-password'>&nbsp;违规封杀</i></button> "
                         }else if(leaState==2){
                        	 stateName="审核不通过";
                        	 ctrl="";
                         }else{
                        	 stateName="已被封杀";
                        	 ctrl="<button class='layui-btn layui-btn-xs ' style='background-color:#838B8B' value='解除封杀'  leaId=" +
								lea.id +" leaName= "+ lea.name +
								" onclick='openLea(this)'><i class='layui-icon layui-icon-auz'>&nbsp;解除封杀</i></button> "
                         }
                       var peopleCount = peoples[i]+1;
							$("#file").append("<tr class='row'></tr>")
							var $tr = $("#file").find(".row").last();

							$tr.append("<td >" + lea.name + "</td>");
							$tr.append("<td >" + lea.userName + "</td>");
							$tr.append("<td >" + lea.createTime.substring(0,19) + "</td>");
							$tr.append("<td >" + peopleCount + " </td>");
							$tr.append("<td >" + stateName + " </td>");
							$tr.append("<td>"+ctrl+"</td>");
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
			//根据条件查询联盟
			function findLea() {
				
				count = 0;
				index = 1;
				start = 0;
				var leaName_temp = $("#leaName").val().trim();
				var leaMasterId_temp = $("#se-type").val().trim();
				var sTime_temp = $("#in-begin").val().trim();
				var eTime_temp = $("#in-end").val().trim();

				if ((sTime_temp == "" && eTime_temp != "")
						|| (sTime_temp != "" && eTime_temp == "")) {
					layer.msg('日期要选择一个时间段！',{
						icon: 0,
					    time: 1000, //1s后自动关闭
					  });
					return;
				}
				
				leaName =leaName_temp;
				leaMasterId = leaMasterId_temp;
				sTime = sTime_temp;
				eTime = eTime_temp;

				initLeaMeg();

			}
			//审核通过
			function audiPass(e){
				layer.confirm('确定同意联盟成立?', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						audiPassThis(e);
					}
				);
			}
			
			//审核通过
			function audiPassThis(e){
				
					//获得联盟id
					var leaId = $(e).attr("leaId");
					//联盟名字
					var leaName = $(e).attr("leaName");
					//处理内容
					var ctrlMeg = "审核联盟，同意"+leaName+"成立";
					//修改的联盟状态值
					var state = 1;
					
					$.ajax({
						url : "updateLeaState.action",
						type : "post",
						data : {
							"leaId":leaId,
							"ctrlMeg":ctrlMeg,
							"state":state
							
						},
						dataType : "json",
						success : function(msg) {
							//告知结果
							var res = msg.res;
							if(res==0){
								layer.msg('审核失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}else{
								layer.msg('审核成功！',{
									icon: 6,
								    time: 1000, //1s后自动关闭
								  });
								initLeaMeg();
							}
							
						},
						error : function() {
							layer.msg('请求失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
					});
					
				
				
			}
			//审核不通过
			function audiNotGo(e){
				layer.confirm('确定否决联盟成立??', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						audiNotGoThis(e);
					}
				);
			}
			
			//审核不通过
			function audiNotGoThis(e){
					//获得联盟id
					var leaId = $(e).attr("leaId");
					//联盟名字
					var leaName = $(e).attr("leaName");
					//处理内容
					var ctrlMeg = "审核联盟，不同意"+leaName+"成立";
					//修改的联盟状态值
					var state = 2;
					
					$.ajax({
						url : "updateLeaState.action",
						type : "post",
						data : {
							"leaId":leaId,
							"ctrlMeg":ctrlMeg,
							"state":state
							
						},
						dataType : "json",
						success : function(msg) {
							//告知结果
							var res = msg.res;
							if(res==0){
								layer.msg('审核失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}else{
								layer.msg('审核成功！',{
									icon: 6,
								    time: 1000, //1s后自动关闭
								  });
								initLeaMeg();
							}
							
						},
						error : function() {
							layer.msg('请求失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
					});
				
			}
			
			
			//封杀
			function stopLea(e){
				layer.confirm('确定封杀该联盟?', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						stopLeaThis(e);
					}
				);
			}
			//封杀		
			function stopLeaThis(e){
				
				
					//获得联盟id
					var leaId = $(e).attr("leaId");
					//联盟名字
					var leaName = $(e).attr("leaName");
					//处理内容
					var ctrlMeg = "封杀联盟"+leaName;
					//修改的联盟状态值
					var state = 3;
					
					$.ajax({
						url : "updateLeaState.action",
						type : "post",
						data : {
							"leaId":leaId,
							"ctrlMeg":ctrlMeg,
							"state":state
							
						},
						dataType : "json",
						success : function(msg) {
							//告知结果
							var res = msg.res;
							if(res==0){
								layer.msg('封杀失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}else{
								layer.msg('封杀成功！',{
									icon: 6,
								    time: 1000, //1s后自动关闭
								  });
								initLeaMeg();
							}
							
						},
						error : function() {
							layer.msg('请求失败！',{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
						}
					});
					
				
				
			}
			//解除封杀
			function openLea(e){
				layer.confirm('确定解封该联盟?', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						openLeaThis(e);
					}
				);
			}
			//解除封杀		
			function openLeaThis(e){
				
				
					//获得联盟id
					var leaId = $(e).attr("leaId");
					//联盟名字
					var leaName = $(e).attr("leaName");
					//处理内容
					var ctrlMeg = "解封封联盟"+leaName;
					//修改的联盟状态值
					var state = 1;
					
					$.ajax({
						url : "updateLeaState.action",
						type : "post",
						data : {
							"leaId":leaId,
							"ctrlMeg":ctrlMeg,
							"state":state
							
						},
						dataType : "json",
						success : function(msg) {
							//告知结果
							var res = msg.res;
							if(res==0){
								layer.msg('解封失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}else{
								layer.msg('解封成功！',{
									icon: 6,
								    time: 1000, //1s后自动关闭
								  });
								initLeaMeg();
							}
							
						},
						error : function() {
							layer.msg('请求失败！',{
								icon:5,
							    time: 1000, //1s后自动关闭
							  });
						}
					});
					
				
			}
			
			//弹出详情界面
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例 
				window.showDeti = function(e) {
					
					layer.open({
						type: 2,
						title: false,
						shade: [0],
						area: ['500px', '400px'],
						offset: '150px', //右下角弹出
						anim: 2,
						content: 'leaDetialMeg.html', //iframe的url，no代表不显示滚动条
						success: function(layero, index) {
							
							 var data = new Array();
							 //联盟id
							data[0] = $(e).attr("leaId"); //自己的数据存进去
                            //联盟名字
                            data[1] = $(e).attr("leaName");
							//盟主名字
							data[2] = e.parentElement.parentElement.children[1].innerText;
							
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