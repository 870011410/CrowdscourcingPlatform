<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/footer.css">
		<style type="text/css">
			.project-type-box {
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-webkit-box-align: center;
				-ms-flex-align: center;
				align-items: center;
				-webkit-box-pack: center;
				-ms-flex-pack: center;
				justify-content: center;
				text-align: center;
				margin-bottom: 140px;
			}
			
			.project-type-box .item {
				border-radius: 3px;
				background: #fff;
				width: 400px;
				min-height: 400px;
				-webkit-box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				margin: 0 30px;
				cursor: pointer;
			}
			
			.project-type-box .item:hover {
				-webkit-box-shadow: 0 0 10px #2093ff;
				box-shadow: 0 0 10px #2093ff;
			}
			
			.project-type-box .item .type-icon {
				display: block;
				width: 400px;
				border-radius: 50px;
			}
			
			.project-type-box .item .type-title {
				display: block;
				font-size: 24px;
				margin-top: 10px;
				background: #eeeeee;
				padding: 5px;
			}
			
			.project-type-box .item .type-desc {
				line-height: 22px;
				font-size: 13px;
				padding: 0 16px;
				display: block;
				text-align: center;
				margin-top: 16px
			}
			
			.loading {
				margin-top: 30px
			}
			
			.loading .el-loading-spinner .el-loading-text {
				margin: 20px 0 0 -25px;
				width: 100px
			}
			
			.col-md-12 {
				position: relative;
				min-height: 1px;
				padding-right: 15px;
				padding-left: 15px;
				text-align: center;
				margin-top: 40px;
				margin-bottom: 80px;
			}
			
			.features-header-line {
				height: 3px;
				margin: 0 auto;
				border-left: 120px solid #ddd;
				border-right: 120px solid #ddd;
				background-color: #0c8484;
				width: 120px;
				margin-top: 15px;
			}
			
			.icon {
				width: 200px;
				height: 200px;
				text-align: center;
				-webkit-box-shadow: 0px 14px 30px -15px rgba(0, 0, 0, 0.75);
				-moz-box-shadow: 0px 14px 30px -15px rgba(0, 0, 0, 0.75);
				box-shadow: 0px 14px 30px -15px rgba(0, 0, 0, 0.75);
				margin-bottom: 30px;
				margin: 0 auto 30px auto;
				border-radius: 50%;
				display: table;
				background: #efefef;
				margin-top: 30px;
			}
		</style>
	</head>

	<body style="margin-top: 60px;">
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
						<a href="javascript:;" class="a-text"><img src="${user.src}" class="layui-nav-img">我</a>
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
		<div class="col-md-12">
			<p style="font-size: 24px;">成为服务商</p>
			<div class="features-header-line"></div>
		</div>
		<div class="project-type-box">

			<div class="item">
				<span class="icon">
				<img src="${user.src}" style="width: 200px;height: 200px;border-radius: 50%;" />
				</span>
				<span class="type-title">服务商</span>
				<span class="type-desc">发布商品，竞标需求，获取技术服务收益</span>
				<button class="layui-btn  layui-btn-normal" style="margin: 20px;height: 35px; width: 220px;" onclick="beProvider()">立即入驻</button>

			</div>

		</div>

		<!--底部-->
		<!--底部-->
		<div class="fly-footer">
			<p align="center">
				2018 &copy;JF1806出品</a>
			</p>
			<div class="zbj-footer-warp-v1">
				<div class="zbj-footer-cutting-line"></div>
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
							<li class="menu-text">帮助中心</li>
							<li>
								<a href="" target="_blank">新手指南</a>
							</li>
							<li>
								<a href="" target="_blank">常见问题</a>
							</li>
							<li>
								<a href="" target="_blank">规则中心</a>
							</li>
							<li>
								<a d href="" target="_blank">意见建议反馈</a>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script type="text/javascript" src="js/isLogin.js"></script>
		<script>
			layui.use(['element', 'layer'], function() {
				var element = layui.element;

			});
			var form;
			layui.use('form', function() {
				form = layui.form;

			});
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
			
			//成为服务商
			//弹出层
			layui.use('layer', function() {
				var layer = layui.layer; //执行一个laydate实例 
				//修改
				window.beProvider = function(e) {
					layer.open({
						type: 2,
						title: false,
						shade: [0.8],
						area: ['1000px', '500px'],
						content: 'providerTypeConfig.html', //iframe的url，no代表不显示滚动条
					});

				}
			});
		</script>
	</body>

</html>