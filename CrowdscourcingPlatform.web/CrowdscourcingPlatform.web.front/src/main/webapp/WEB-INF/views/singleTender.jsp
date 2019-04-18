<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>个人投标界面</title>
		<link href="3rd/Content/Layui-KnifeZ/css/layui.css" rel="stylesheet" />
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/footer.css">
		<style>
			.my-form {
				width: 520px;
				/*border-top: 2px solid #D8312A;*/
				margin-left: 20px;
				padding-top: 20px;
			}
			
			.div-logArea {
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
				width: 600px;
				height: 600px;
				/*margin-left: 200px;*/
				margin-left: auto;
				margin-right: auto;
				margin-top: 100px;
				border-radius: 10px;
			}
			.my-content{
/* 				border: 1px solid lightgray;
				width: 409px; 
				height:100px;*/
				min-height: 500px;
			}
			
		</style>
	</head>

	<body>
	<div class="my-content">
<!----------------------------------------------- 头部 ------------------------------------------------->
	<div class="fly-header layui-bg-black" style="white-space: nowrap">
			<div class="layui-container-logo">
				<a href="homePage.html" style="color: #FFB800;font-size: 22px;line-height: 56px;font-family:'华文细黑'">
				<img src="img/logo.png" />
				
				<span style="color: white;font-family: '微软雅黑';">开心</span>众包</a>
				
			</div>
			<div class="layui-container-one">
				<ul class="layui-nav my-ul" lay-filter="">
					
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

						<a href="javascript:;" class="a-text"><img src="${user.src}" class="layui-nav-img" id="imgHead">我</a>

						<dl class="layui-nav-child">
							<dd>
								<a href="personalCenter.html">个人中心</a>
							</dd>
							
							<dd>
								<a href="logining.html">退出</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
<!----------------------------------------------- 头部 ------------------------------------------------->
		<div class="div-logArea">
			<br>
			  <h1 align="center">竞标信息表</h1>

			<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">

			<div class="layui-form my-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label"  >投标人：</label>
					<div class="layui-input-block">
						<input id="in-need" lay-verify="required" class="layui-input" readonly="readonly" 
						  value=${user.name}>
					</div>
						
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">需求标题：</label>
					<div class="layui-input-block">
						<input id="in-title" lay-verify="required" class="layui-input" readonly="readonly"
						 value=${needTitleBudding}>
					</div>
				</div>
                 
				<div class="layui-form-item">
					<label class="layui-form-label">投标方案：</label>
					<div class="layui-input-block">
						<textarea id="in-content"></textarea>
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
						<button class="layui-btn" id="tender" lay-submit lay-filter="sent" needId=${needIdBudding}>立即提交</button>
						<input type="button" class="layui-btn layui-btn-primary" id="close" value="返回" onclick="refush()">
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
					height: '9%'
				});
				var index = layedit.build('in-content');
				/*form*/
				layui.use('form', function() {
					var form = layui.form;
					form.on('submit(sent)', function(data) {
						//新增投标信息
                        //需求id
                        var needId = $("#tender").attr("needId");
					    //投标
						var content = layedit.getContent(index).trim();//需求内容
						if(content==""){
							layer.msg('请填写投标方案',{
								icon: 2,
							    time: 1000, //1s后自动关闭
							  });
							return;
						}
											
						var accept =$("#accept-rule").prop("checked");//同意规则？
						if(accept==false){
							layer.msg('需同意一站式众包规则',{
								icon: 2,
							    time: 1000, //1s后自动关闭
							  });
							return;
						}
						
						
						  $.ajax({
							url: "buddingTenderSingle.action",
							type: "post",
							data: {
								"needId": needId,
								"content":content								

							},
							dataType: "json",
							success: function(msg) {
								var res = msg.res;
								if(res=="yes"){
									layer.msg('竞标成功！可到工作中心中查看！',{
										icon: 1,
									    time: 1000, //1s后自动关闭
									  });
									setTimeout(refush,"1000");
									
								}else if(res=="isBudded"){
									layer.msg('该标已经投过了！',{
										icon: 2,
									    time: 1000, //1s后自动关闭
									  });
									setTimeout(refush,"1000");
								}else if(res=="isMyselef"){
									layer.msg('自己的需求不能投哦！',{
										icon: 2,
									    time: 1000, //1s后自动关闭
									  });
									setTimeout(refush,"1000");
								}else{
									
									layer.msg('竞标失败！',{
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
		//跳转到需求界面去
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
			
		</script>
	</body>

</html>