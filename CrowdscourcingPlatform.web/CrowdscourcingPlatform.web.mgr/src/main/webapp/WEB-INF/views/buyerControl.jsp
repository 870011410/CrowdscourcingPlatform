<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="css/zjw.css">
	</head>

	<body>
		<br />
		<br />
		<h1 align="center">雇主管理</h1>
		<br />
		<br />

			<div class="layui-row">

				<div class="md2">
					注册时间：<input type="text" class="layui-input my-input" id="in-begin" placeholder="开始时间"> 至：
					<input type="text" class="layui-input my-input" id="in-end" placeholder="结束时间"> 用户名：
					<input type="text" class="layui-input my-input" id="in-name" placeholder="用户名">
				</div>
				<div class="md2">
					<button class="layui-btn layui-btn-sm" onclick="findBuyer()">
						<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
					</button>
				</div>
			</div>

		<br />
		<table class="layui-table ta-search" lay-size="lg" id="buyer">
			<colgroup>
				<col width="150">
				<col width="180">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="180">
				<col width="300">
			</colgroup>
			<thead>
				<tr class="layui-bg-green">
					<th>雇主名</th>
					<th>注册时间</th>
					<th>积分</th>
					<th>手机号</th>
					<th>邮箱</th>
					<th>用户状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				

			</tbody>
		</table>
		
		<div id="page" align="right" style="margin-right:50px"></div>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			window.onload=function(){
			
				initBuyer();
	
 			}
			layui.use(['laydate','layer'], function() {
				var laydate = layui.laydate; //执行一个laydate实例 
				var layer = layui.layer; //执行一个laydate实例 
				laydate.render({
					elem: '#in-begin',
					theme: 'molv' //指定元素

				});
			});
			layui.use('laydate', function() {
				var laydate = layui.laydate; //执行一个laydate实例 
				laydate.render({
					elem: '#in-end',
					theme: 'molv' //指定元素

				});
			});
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例  
			});
			//分页参数
			//从哪里开始
			var start = 0;
			//每页的条数
			var limit = 5;
			//当前页
			var index = 1;
			var begin=$("#in-begin").val().trim();
			var end=$("#in-end").val().trim();
			var name=$("#in-name").val().trim();
			//分页初始化数据
			function initBuyer(){
					$("#buyer").find(".row").remove(); 
					$.ajax({
						url:"initUser.action",
						type:"post",
						data:{
							"start":start,
							"limit":limit,
							"begin":begin,
							"end":end,
							"name":name,
							"type":0
						},
						dataType:"json",
						success:function (msg) {
							var count=msg.count;
							layui.use('laypage', function() {
								var laypage = layui.laypage;

								laypage.render({
									elem: 'page', 
									limit:limit,	//设置limit
									count:count, //设置count 从服务端得到
									curr:index, //设置当前页
									jump: function(obj, first) {
									
									//首次不执行
									if(!first) {
										start = (obj.limit*(obj.curr-1));
										index = obj.curr;
										initBuyer();
									}
								}
								});
							});
							
							var buyer=msg.user;
							
							if(buyer.length==0){
								layer.msg('未查到匹配的结果！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}
							for(var i=0;i<buyer.length;i++){
								var buy=buyer[i];
								
								
								$("#buyer").append("<tr class='row'></tr>")
								var $tr=$("#buyer").find(".row").last();
								var state="";
								if(buy.state==0){
									state="锁定";
								}
								if(buy.state==1){
									state="正常";
								}

								
								
								$tr.append("<td >"+buy.name+"</td>");
								$tr.append("<td >"+buy.createTime.substring(0,19)+"</td>");
								$tr.append("<td >"+buy.score+"</td>");
								$tr.append("<td >"+buy.phone+" </td>"); 
								$tr.append("<td >"+buy.email+" </td>"); 
								$tr.append("<td >"+state+" </td>"); 
								if(buy.state==1){
									$tr.append("<td ><button class='layui-btn layui-btn-xs layui-btn-danger' value='锁定' userId="+buy.id +"  onclick='askMotifyState(this)'><i class='layui-icon layui-icon-password'>&nbsp;锁定</i></button> "
											+"<button class='layui-btn layui-btn-xs ' style='background-color:#FF00FF' value='重置密码' userId="+buy.id +" onclick=' askResetPwd(this)'><i class='layui-icon layui-icon-refresh-3'>&nbsp;重置密码</i></button> </td>");
								}
								if(buy.state==0){
									$tr.append("<td width='120px'><button class='layui-btn layui-btn-xs' style='background-color:#838B8B' value='恢复' userId="+buy.id +" onclick='askMotifyState(this)'><i class='layui-icon layui-icon-auz'>&nbsp;恢复</i></button> "
											+"<button class='layui-btn layui-btn-xs ' style='background-color:#FF00FF' value='重置密码' userId="+buy.id +" onclick='askResetPwd(this)'><i class='layui-icon layui-icon-refresh-3'>&nbsp;重置密码</i></button> </td>");
									
								}

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
			//根据条件查询用户
			function findBuyer(){
				index=1;
				start=0;
				
				begin=$("#in-begin").val().trim();
				end=$("#in-end").val().trim();
				name=$("#in-name").val().trim();

				if((begin!=""&&end=="")||(begin==""&&end!="")){
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
				initBuyer();
				
			}
			
			//询问是否锁定/恢复
			function askMotifyState(e){
				var stateName=$(e).val();
				layer.confirm('确定要'+stateName+'吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						motifyState(e);
					}
				);
			}
			
			//启用，禁用，审核的方法
			function motifyState(e) {
				var state=$(e).val();
				var userId=$(e).attr("userId")
/* 				alert(userId); */
				//雇主名字
				var uname=$(e).parent().parent().children().eq(0).text();
				var num=-1;
				if(state=="锁定"){
					num=0;
				}
				if(state=="恢复"){
					num=1;
				}

				$.ajax({
					url:"motifyUserState.action",
					type:"post",
					data:{
						"state":num,
						"uname":uname,
						"userId":userId
					},
					dataType:"json",
					success:function (msg) {
						if(msg.type=="SUC"){
							//alert(state+"成功！");
							layer.msg(state+'成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							});
							initBuyer();
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
			
			//询问是否重置密码
			function askResetPwd(e){
				layer.confirm('确定要重置密码吗？', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						resetPwd(e);
					}
				);
			}
			//重置密码
			function resetPwd(e){
				var userId=$(e).attr("userId")
/* 				alert(userId); */
				//雇主名字
				var uname=$(e).parent().parent().children().eq(0).text();
				var num=-1;
				$.ajax({
					url:"resetPwd.action",
					type:"post",
					data:{
						
						"uname":uname,
						"userId":userId
					},
					dataType:"json",
					success:function (msg) {
						if(msg.type=="SUC"){
							layer.msg('重置密码成功！',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							});
							initBuyer();
						}else{
							layer.msg(msg.type,{
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