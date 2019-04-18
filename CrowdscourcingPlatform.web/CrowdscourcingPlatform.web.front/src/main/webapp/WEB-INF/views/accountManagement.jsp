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
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

.div-font div {
	font-size: 13px;
	display: inline;
	
}

.my-input {
	width: 120px;
	display: inline;
}

.btn {
	margin-top: 10px;
}

.layui-input, .layui-select, .layui-textarea {
	
    height: 26px;
    line-height: 26px;
   
    baccount-width: 1px;
    baccount-style: solid;
    background-color: #fff;
    baccount-radius: 2px;
    font-size: 12px;
    

}

.md2 {
	/* width: 16.66666667%; */
	margin-left: 25px;
	display: inline-block;
}

.layui-btn-xs i {
	font-size: 11px !important;
}

.layui-table td, .layui-table th {
	position: relative;
	padding: 9px 15px;
	min-height: 17px;
	line-height: 17px;
	font-size: 12px;
}

.layui-table[lay-size=lg] td, .layui-table[lay-size=lg] th {
	padding: 10px 30px;
}

.layui-table td, .layui-table th {
	position: relative;
	padding: 9px 15px;
	min-height: 17px;
	line-height: 17px;
	font-size: 12px;
}
</style>
</head>

<body>


	<div class="layui-row  div-font" style="margin-left: 20px;margin-top: 20px;">
		<div class="md2 ">
			需求/作品标题： <input type="text" class="layui-input my-input"
				style="width: 80px;" id="check_title">
		</div>

		<div class="md2 ">
			交易方： <input type="text" class="layui-input my-input"
				style="width: 80px;" id="check_name">
		</div>

		<div style = "margin-top:10px;">
			<div class="md2 ">
				更新时间：&nbsp;<input type="text" class="layui-input my-input"
					id="check_time_from" placeholder="开始时间" style="width: 80px;">
			</div>
			<div class="md2 ">
				至：<input type="text" class="layui-input my-input" id="check_time_to"
					placeholder="结束时间" style="width: 80px;">
			</div>

			<div class="md2 ">
				<button class="layui-btn layui-btn-sm" onclick="findAccounts()" style="width:86px;background: #63b5fb;">
					<i class='layui-icon layui-icon-search'>&nbsp;查询</i>
				</button>

			</div>
		</div>
	</div>

	<br />
	<table class="layui-table ta-search" lay-size="lg" id="account" style="width:90%;">
		<colgroup>
			<col width="140">
			<col width="140">
			<col width="120">
			<col width="120">
			<col width="200">
		</colgroup>
		<thead>
			<tr style="background-color: #63b5fb; color:white;">
				<th>需求/作品标题</th>
				<th>交易方</th>
				<th>金额</th>
				<th>状态</th>
				<th>更新时间</th>
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
			//查询订单
			showAccounts();
		}
		//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#check_time_from',
				theme : 'molv' //指定元素

			});
		});
		//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#check_time_to',
				theme : 'molv' //指定元素
			});
		});

		//分页参数(初始化的)
		//从哪里开始
		var start = 0;
		//每页的条数
		var limit = 10;
		//当前页
		var index = 1;
		//查询的条件
		var check_name = $("#check_name").val().trim();
		var check_title = $("#check_title").val().trim();
		var check_time_from = $("#check_time_from").val().trim();
		var check_time_to = $("#check_time_to").val().trim();

		//分页初始化数据
		function showAccounts() {
			$("#account").find(".row").remove();
			$.ajax({
				url : "do-showBuyerAccounts.action",
				type : "post",
				data : {
					"start" : start,
					"limit" : limit,
					"check_name" : check_name,
					"check_title" : check_title,
					"check_time_from" : check_time_from,
					"check_time_to" : check_time_to,
					"useId" : "${user.id}"
				},
				dataType : "json",
				success : function(msg) {
					//返回回来的总条数
					var count = msg.count;
					//页码的处理
					layui.use('laypage', function() {
						var laypage = layui.laypage;

						laypage.render({
							//分页模块的id
							elem : 'page',
							limit : limit, //设置limit
							count : count, //设置count 从服务端得到
							curr : index, //设置当前页
							jump : function(obj, first) {

								//首次不执行
								if (!first) {
									start = (obj.limit * (obj.curr - 1));
									index = obj.curr;
									showAccounts();
								}
							}
						});
					});
					//数据的处理
					var accounts = msg.accounts;

					if (accounts.length == 0) {
						layer.msg('未查到匹配的结果！', {
							icon : 5,
							time : 1000, //20s后自动关闭
						});
					}

					for (var i = 0; i < accounts.length; i++) {
					
						var acc = accounts[i];
						var state="";
						var money="";
						if(acc.state==1){
							state="交易完成"
							money=acc.money;
						}
						if(acc.state==2){
							state="预支付"
							money=acc.money;
						}
						if(acc.state==3){
							state="收到退款"
							money="+"+acc.money;
						}
						$("#account").append("<tr class='row'></tr>")
						var $tr = $("#account").find(".row").last();

						$tr.append("<td >"
								+ (acc.worTitle == null ? acc.neeTitle
										: acc.worTitle) + "</td>");
						$tr.append("<td >"
								+ (acc.serName == null ? acc.leaName
										: acc.serName) + "</td>");
						$tr.append("<td >" + money + " </td>");
						$tr.append("<td >" + (state)
								+ " </td>");
						$tr.append("<td >" + acc.updateTime.substring(0,16) + "</td>");
					}
				},
				error : function() {
					layer.msg('请求失败！', {
						icon : 2,
						time : 1000, //20s后自动关闭
					});
				}
			});
		}
		//根据条件查询文档
		function findAccounts() {
			count = 0;
			index = 1;
			start = 0;

			check_name = $("#check_name").val().trim();
			check_title = $("#check_title").val().trim();
			check_time_from = $("#check_time_from").val().trim();
			check_time_to = $("#check_time_to").val().trim();

			if ((check_time_from != "" && check_time_to == "")
					|| (check_time_from == "" && check_time_to != "")) {
				layer.msg('日期信息填写不完整！', {
					icon : 1,
					time : 1000, //1s后自动关闭
				});
				return;
			}
			layer.msg('查询成功！', {
				icon : 1,
				time : 1000, //20s后自动关闭
			});
			showAccounts();
		}
	</script>
</body>

</html>
