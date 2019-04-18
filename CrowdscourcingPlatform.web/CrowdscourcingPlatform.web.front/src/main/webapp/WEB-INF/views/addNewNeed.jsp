<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>发布新需求</title>
		<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/footer.css">
		<style>
			.my-form {
				width: 520px;
				/*border-top: 2px solid #D8312A;*/
				margin-left: 26px;
				padding-top: 30px;
			}
			
			.div-logArea {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
				width: 600px;
				height: 800px;
				margin-left: auto;
				margin-right: auto;
				margin-top: 50px;
				
			}
			.my-content{
				min-height: 500px;
			}
			.features-header-line {
				height: 3px;
				margin: 0 auto;
				border-left: 188px solid #ddd;
				border-right: 188px solid #ddd;
				background-color: #0c8484;
				width: 120px;
				margin-top: 15px;
			}
		</style>
	</head>

<body style="margin-top: 60px;">
	<div class="my-content">
		<div class="fly-header layui-bg-black" style="white-space: nowrap">
			<div class="layui-container-one">
				<ul class="layui-nav my-ul" lay-filter="">
					<li class="layui-nav-item">
						<a href="homePage.html" class="a-text">首页</a>
					</li>
					<li class="layui-nav-item ">
						<a href="postNeedSelectType.html" class="a-text">发布需求</a>
					</li>
					<li class="layui-nav-item">
						<a href="postWorkSelectType.html" class="a-text">发布作品</a>
					</li>
					<li class="layui-nav-item">
						<a href="community.html" class="a-text">社区</a>
					</li>
				</ul>
			</div>
			<div class="layui-container-two">
				<ul class="layui-nav my-ul">
					<li class="layui-nav-item">
						<a href="workTable.html" class="a-text">工作中心</a>
					</li>
					<li class="layui-nav-item">
						<a href="leagueCenter.html" class="a-text">联盟中心</a>
					</li>
					<li class="layui-nav-item" id="is-login" user="${user.id}">
						<a href="javascript:;"  class="a-text"><img src="${user.src}" class="layui-nav-img">我</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="personalCenter.html">个人中心</a>
							</dd>
							
							<dd>
								<a href="javascript:;">退了</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<div class="div-logArea">
			<br>
			  <h1 align="center">需求发布</h1>

			<div class="features-header-line"></div>

			<div class="layui-form my-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label"  >需求类型：</label>
					<div class="layui-input-inline" style="width:300px">
						<input id="in-need" lay-verify="required" class="layui-input" readonly="readonly" 
						needTypeId=${needtypeId} value=${needTypeName} >
					</div>
					<label class="layui-form-label-col"  ><a href="postNeedSelectType.html"><i class="layui-icon layui-icon-edit"></i><span style="color:green">修改</span></a></label>
						
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">需求标题：</label>
					<div class="layui-input-block">
						<input id="in-title" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">需求内容：</label>
					<div class="layui-input-block">
						<textarea id="in-content"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">需求要求：</label>
					<div class="layui-input-block">
						<input id="in-require" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">周期：</label>
					<div class="layui-input-inline" style="width: 200px;">
						<input id="in-week" lay-verify="required" class="layui-input">
					</div>
					<div class="layui-input-inline" style="width:100px" >
						<select name="week" lay-verify="required" id="week-type">
							<option value="1">天</option>
							<option value="2">周</option>
							<option value="3">月</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">预算：</label>
					<div class=" layui-input-inline" style="width: 200px;">
						<input id="in-money" lay-verify="required" class="layui-input">
					</div>
					<label class="layui-form-label-col">&nbsp;&nbsp;元</label>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">截止投标：</label>
					<div class=" layui-input-inline" style="width: 200px;">
						<input id="in-end" lay-verify="required" class="layui-input" readonly="readonly" placeholder="选择投标截止时间">
					</div>
				</div>
				 
				<div class="layui-form-item" >
				<label class="layui-form-label"></label>
						<div class="layui-input-inline" style="width:60px">
						<input type="checkbox" id="accept-rule" title="同意" lay-skin="primary">
						              	   
						   </div>
				<label class="layui-form-label-col"  ><a href="rulesCenter.html" style="color:blue">《一站式众包规则》</a></label>	   
						   
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="upWorks" lay-submit lay-filter="sent">立即提交</button>
						<input type="button" class="layui-btn layui-btn-primary" id="close" onclick="retHome()" value="返回">
					</div>
				</div>
			</div>
		</div>
		<div><img id="my-img" src=""></div>
	</div>
<!--------------------------------------------------------------------底部------------------------------------------------------------------>
<div class="fly-footer">

	<div class="zbj-footer-warp-v1">
		
		<div class="zbj-footer-width-ctrl">
			<div class="zbj-footer-friend-links">
				<ul class="zbj-footer-friend-tab" id="zbjFooterTab">

					<li class="zbj-footer-friend-li">
						<span class="zbj-footer-tab-name" data-linkid="zbjindex2018-footer-friendlink-0-tab" title="友情链接">友情链接</span>
						<div class="zbj-footer-tab-panel" id="panel">
							
						</div>
					</li>

				</ul>

			</div>
			<div class="div-help">
				<ul class="menu vertical menu-ul">
					<li class="menu-text">项目中心</li>
					<li>
						<a href="" target="_blank">发布作品</a>
					</li>
					<li>
						<a href="" target="_blank">搜索作品</a>
					</li>
					<li>
						<a href="" target="_blank">发布需求</a>
					</li>
					<li>
						<a d href="" target="_blank">搜索需求</a>
					</li>
				</ul>
			</div>
			<div class="div-help-two">
				<ul class="menu vertical menu-ul">
					<li class="menu-text">帮助中心</li>
					<li>
						<a href="" target="_blank">新手指南</a>
					</li>
					<li>
						<a href="" target="_blank">常见问题</a>
					</li>
					<li>
						<a href="rulesCenter.html" target="_blank">规则中心</a>
					</li>
					<li>
						<a d href="" target="_blank">意见建议反馈</a>
					</li>
				</ul>
			</div>
			<div class="div-help-three">
				<ul class="menu vertical menu-ul">
					<li class="menu-text">技术咨询</li>
					<li>
						<span >电话：10086</span>
					</li>
					<li>
						<span >QQ：10086</span>
					</li>
					<li>
						<span >微信：zjw6666</span>
					</li>
					<li>
						<span >
						<i class="layui-icon layui-icon-cellphone" style="font-size: 25px;"></i> 
						&nbsp;&nbsp;&nbsp;
						<i class="layui-icon layui-icon-login-wechat" style="font-size: 25px;"></i> 
						&nbsp;&nbsp;&nbsp;
						<i class="layui-icon layui-icon-login-qq" style="font-size: 25px;"></i> 
						</span>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
	<div class="zbj-footer-cutting-line">
		
	</div>
	<p style="margin-top: 10px;font-size: 13px;text-align: center;">
		2018 &copy;JF1806郑家伟组出品
	</p>
</div>
<!---------------------------------------------------------------------------底部-------------------------------------------------------------->

		<script src="3rd/Content/Layui-KnifeZ/layui.js"></script>
		<script src="3rd/Content/ace/ace.js"></script>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="js/isLogin.js"></script>
		<script>
		//导入form样式
		layui.use('element', function() {
					var element = layui.element;
	
		});
			
			//日期选择器
		layui.use('laydate', function() {
			var laydate = layui.laydate; //执行一个laydate实例 
			laydate.render({
				elem : '#in-end',
				theme : 'molv',//指定元素
				min: 1 //1天后


			});
		});
			layui.use(['layedit', 'layer', 'jquery'], function() {
				var $ = layui.jquery;
				var layer = layui.layer;
				var layedit = layui.layedit;
				layedit.set({

					tool: [
						'strong', 'italic', 'underline', 'del', '|', 'fontFomatt', 'fontfamily', 'fontSize', 'fontBackColor', 'colorpicker', 'face', '|', 'table', 'customlink', 'fullScreen'
					],
					height: '90%'
				});
				var index = layedit.build('in-content');

				/*form*/
				layui.use('form', function() {
					var form = layui.form;
					form.on('submit(sent)', function(data) {
						

						var needTypeId = $("#in-need").attr("needtypeId"); //需求类型id
						var title = $("#in-title").val().trim();//需求标题
						var content = layedit.getContent(index).trim();//需求内容
						if(content==""){
							layer.msg('请填写需求内容',{
								icon: 2,
							    time: 1000, //1s后自动关闭
							  });
							return;
						}
						var require = $("#in-require").val().trim();//需求要求
						var weekDay =$("#in-week").val().trim();//周期数
						//判断周期
						
						if(/^[0-9]+$/.test(weekDay)){

						}else{
							layer.msg('周期必须是正整数！',{
								icon: 2,
							    time: 1000, //1s后自动关闭
							  });
						return;
						}
						var weekType= $("#week-type").val().trim();//日期单位
						var weekDate = "";//周期
						if(weekType==1){
							weekDate=weekDay+"天";
						}else if(weekType==2){
							weekDate=weekDay+"周";
						}else{
							weekDate=weekDay+"月";							
						}
						var money = $("#in-money").val().trim();//预算
						//判断金额
						if(/^\d+(\.\d{1,2})?$/.test(money)){

							}else{
								layer.msg('金额必须是数字且最多有两个小数点！',{
									icon: 2,
								    time: 1000, //1s后自动关闭
								  });
							return;
							}
						var endTime = $("#in-end").val().trim();//截止投标时间						
						var accept =$("#accept-rule").prop("checked");//同意规则？
						if(accept==false){
							layer.msg('需同意一站式众包规则',{
								icon: 2,
							    time: 1000, //1s后自动关闭
							  });
							return;
						}
						
						
						
						  $.ajax({
							url: "addNewNeed.action",
							type: "post",
							data: {
								"needTypeId": needTypeId,
								"title":title,
								"content":content,
								"require":require,
								"weekDate":weekDate,
								"money":money,
								"endTime":endTime

							},
							dataType: "json",
							success: function(msg) {
								var res = msg.res;
								if(res=="yes"){
									layer.msg('发布需求成功！',{
										icon: 1,
									    time: 1000, //1s后自动关闭
									  });
									setTimeout(refush,"1000");
									
								}else if(res=="check"){
									layer.msg('输入数据有误！',{
										icon: 2,
									    time: 1000, //1s后自动关闭
									  });
								}else{
									layer.msg('发布需求失败！',{
										icon: 2,
									    time: 1000, //1s后自动关闭
									  });
								}
							},

							error: function() {
								layer.msg('请求失败！',{
									icon: 2,
								    time: 1000, //1s后自动关闭
								  });
							}
						}); 
					});

				});
			})
			
		function refush(){
				location.href="showNeed.html";
			}
			
			//动态生成友情链接
			function initLinker() {
				$.ajax({
					url : "initLinker.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						
						var linker = msg.linker;
						
						var panel = $("#panel");
						
						panel.empty();
						
						for (var i = 0; i < linker.length; i++) {
							
							var lin = linker[i];
							panel.append("<a href="+lin.link +">"+lin.name+"</a>");
						}					 
					},
					error : function() {
						alert("请求失败！");
					}
				});
			}
			initLinker();
			
			function retHome(){
				location.href="homePage.html";
			}
		</script>
	</body>

</html>