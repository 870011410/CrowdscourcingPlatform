<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>作品详情</title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/footer.css">		
	</head>
	<style type="text/css">
		.project-up {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			position: absolute;
			margin-left: 478px;
			margin-top: 41px;
			width: 860px;
			height: 215px;
		}
		
		.project-down {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			position: absolute;
			margin-left: 478px;
			margin-top: 285px;
			width: 860px;
			height: 380px;
		}
		
		.col-1 {
			width: 21%;
		}
		
		.col-2 {
			width: 79%;
		}
		
		.project-up .project-img {
			width: 150px;
			height: 110px;
		}
		
		.el-col {
			float: left;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
		}
	</style>
	
	<style>
		.div-type {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			position: absolute;
			width: 250px;
			height: 380px;
			margin-left: 188px;
			margin-top: 285px;
			
		}
		.div-type-one{
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
			position: absolute;
			width: 250px;
			height: 136px;
			margin-left: 188px;
			margin-top: 120px;
			
		}
		
		.div-title {
			height: 50px;
			background: #63b5fb;
		}
	</style>
	<style>
		.div-input {
			-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			box-shadow: 0 0 20px rgba(0, 0, 0, .2);
			position: absolute;
			margin-top: 40px;
			width: 250px;
			margin-left: 188px;
			height: 52px;
			text-align: center;
		
			background-color: #63b5fb;
		}
		
		.info {
			display: inline-block;
			margin-top: 10px;
			font-size: 25px;
			color: white;
			font-family: "华文细黑";
		}
	</style>
	<style>
		.workTitle {
			font-family: "华文细黑";
			font-size: 20px;
		}
		
		.workMoney {
		    display:inline-block;
		    position:absolute;
			font-family: "华文细黑";
			font-size: 22px;
			right:50px;
			color: red;
			font-weight: bold;
		}
		
		.workUser {
			margin-top: 10px;
		}
		
		.workType {
			margin-top: 20px;
		}
		
		.type {
			display: inline-block;
			height: 20px;
			width: 50px;
			background-color: #FF5722;
			line-height: 20px;
			text-align: center;
			color: white;
			border-radius: 2px;
		}
		
		.neetype {
			display: inline-block;
			margin-left: 15px;
			height: 20px;
			width: 70px;
			background-color: #009688;
			line-height: 20px;
			text-align: center;
			color: white;
			border-radius: 2px;
		}
		
		.buy {
			position: absolute;
			display: inline-block;
			width: 150px;
			margin-left: 383px;
			margin-top: -5px;
		}
		
		.workContent {
			margin: 19px 19px;
		}
		
		.div-bottom {
			height: 50px;
			background: #63b5fb;
		}
		
		.zb-orderly-mark {
			position: absolute;
			top: 0;
			width: 20px;
			height: 20px;
			color: #ffffff;
			line-height: 20px;
			text-align: center;
			display: block;
			background: #7abfff;
			border-radius: 10px;
			margin-top: 6px;
		}
		
		.zb-normal-list-content {
			line-height: 32px;
			margin-left: 30px;
			margin-right: 0;
		}
		
		.zb-orderly-list {
			position: relative;
		}
		
		.content {
			padding: 16px 16px;
		}
		.div-img{
			margin-top: 20px;
		}
		.div-img .workImg{
			height: 204px;
    		width: 219px;		
		}
		.work-text{
			margin-top: 10px;
			margin-left: 10px;
			margin-right: 10px;
		}
		.myBtn {
			display: inline-block;
			position: absolute;
			background-color: #FF5722;
			font-family: "华文细黑";
			font-size: 25px;
			right: 50px;
			color: white;
			font-weight: bold;
			}
	</style>

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
		<div class="div-input">
			<img src="img/mySale.png" style="width: 30px; margin-top: -10px;margin-right: 10px;" />
			<div class="info">交易中心</div>
		</div>
		<div class="project-up">
			<div class="div-title">
				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-cart-simple "></i> 购买作品
				</div>
			</div>
			
			<div class="workContent" id="workContent">
				<!--JS动态生成  -->
			</div>
			
		</div>
		<div class="project-down">
			<div class="div-bottom">
				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-edit"></i> 作品简介
				</div>
			</div>
			<div class="work-text" id="work-describe">
				</div>
		</div>
		<div class="div-type-one">
				<img src="img/sale.png" style="width: 300px; margin-left: -30px;margin-top: -17;" />
		</div>
		<div class="div-type">
			<div class="div-title">

				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-picture "></i> 作品图片
				</div>
				<div class="content">
					<div class="div-img">
						<img class="workImg" id="work-img" src="" />
						
					</div>
					<p style="margin-top: 40px;">作品图展示，购买后，可下载作品</p>
				</div>
			</div>
			</div>
<!--------------------------------------------------------------------底部------------------------------------------------------------------>
<div class="fly-footer" style="margin-top:700px;">

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
	
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script type="text/javascript" src="js/isLogin.js"></script>
		<script>
			layui.use(['element','layer'], function() {
				var element = layui.element;
				var layer = layui.layer;

			});
			showNeedDeti();
			function showNeedDeti(){
				$.ajax({
					url : "selectWorkDetiWithWorkId.action",
					type : "post",
					data : {
					},
					dataType : "json",
					success : function(msg) {
						var work = msg.workDto;
						var icon = chooseImg(work.neeName);
						$("#workContent").append(
						"<div class='el-col col-1'>"
						+"<img alt='' class='project-img' src="+icon+" ></a>"
					    +"</div>"
					    +"<div class='el-col col-2'>"
						+"<div class='workTitle' workId="
						+work.id
						+">"
                        +work.title
						+"<div class='workMoney'>"
						+"￥"	+work.money
						+"</div>"
						+"</div>"
						+"<div class='workUser'>"
						+"<i class='layui-icon layui-icon-user'></i>&nbsp;&nbsp;&nbsp;"
						+work.useName
						+"<span style='margin-left: 20px;color:gray;'>"
						+"发布时间："
						+work.createTime.substring(0,19) 
						+"</span>"
						+"</div>"
						+"<div class='workType'>"
						+"<div class='type'>作品</div>"
						+"<div class='neetype'>"
						+work.neeName
						+"</div>"
						+"<div class='buy'>"
						+"<button class='layui-btn  layui-btn-sm myBtn' "
						+"style='width: 150px;font-size: 16px;' "
						+"workId="+work.id+" userName="+work.useName+" workTitle="+work.title+" workMoney="+work.money 
						+" workState="+work.state+" onclick='buyWork(this)'>立即购买</button>"
						+"</div>"
						+"</div>"
                        +"</div>");
						
						//需求描述
						$("#work-describe").append(work.content);
						//需求要求
						$("#work-img").attr("src",work.src);
					},
					error : function() {
						alert("请求失败！");
					}
				});
				
				
			}
			
			 //判断需求的文字信息 选择图标
    		function chooseImg(str){
			var textDb = ["机械设计","硬件开发","游戏开发","漫画设计","动画设计","景观园林","效果图","电商经营","电商营销","电商运营","展厅服务","家装服务","公装服务","产品/UI","移动开发","网站建设","特色营销","地推","媒介投放","名片广告","VI","LOGO","手机","通讯","H5","HTML","微信","企业","WEB","web",
				"桌面","嵌入式","游戏","培训","链","智能","数据","物联网","云",
				"java","软件","影视","电影","视频","动画","营销","金融","电商",
				"工程","设计","技术","开发","服务"];
			var imgDb = ["img/needType/jixiesheji.png","img/needType/yingjiankaifa.png","img/needType/youxikaifa.png","img/needType/manhuasheji.png","img/needType/donghuasheji.png","img/needType/jingguanyuanling.png","img/needType/xiaoguotu.png","img/needType/dianshangjinying.png","img/needType/dianshangyingxiao.png","img/needType/dianshangyunying.png","img/needType/zhangtingfuwu.png","img/needType/jiazhuangfuwu.png","img/needType/gongzhuangfuwu.png","img/needType/cahngpingui.png","img/needType/yidongkaifa.png","img/needType/wangzhanjianshe.png","img/needType/tesheyinxiao.png","img/needType/ditiu.png","img/needType/meijietoufang.png","img/needType/pingpaisheji.png","img/needType/vi.png","img/needType/logo.png","img/need/ste1.png","img/need/ste1.png","img/need/434.png","img/need/434.png",
				"img/need/435.png","img/need/436.png","img/need/437.png","img/need/437.png",
				"img/need/439.png","img/need/440.png","img/need/441.png","img/need/443.png",
				"img/need/445.png","img/need/446.png","img/need/447.png",
				"img/need/448.png","img/need/449.png","img/need/java.png","img/need/ruanjian.png",
				"img/need/yinshi.png","img/need/yinshi.png","img/need/yinshi.png","img/need/yinshi.png",
				"img/need/yingxiao.png","img/need/yingxiao.png","img/need/dianshang.png",
				"img/need/438.png","img/need/442.png","img/need/442.png","img/need/kaifa.png","img/need/fuwu.png"];
			for(var i=0;i<textDb.length;i++){
				if(str.indexOf(textDb[i]) != -1 ){
					return imgDb[i];
				}
			}
			
			return "img/need/wenhao.png";
		}
    		 //购买商品
    		 function buyWork(e){
    			 var workMoney = $(e).attr("workMoney");
				layer.confirm('确定购买吗？</br>余额为：'+"${user.money}"+'元</br>需消费：'+workMoney+'元', {
					  btn: ['确定','取消'] //按钮
					}, function(){
						layer.closeAll('dialog'); 
						
						okBuyWork(e); 
					}
				);
			}
			function okBuyWork(e){
				
				 var workId=$(e).attr("workId");
				 var userName=$(e).attr("userName");
				 var workTitle = $(e).attr("workTitle");
				 var workMoney = $(e).attr("workMoney");
				 var workState = $(e).attr("workState");
		
				 $.ajax({
						url : "buyWork.action",
						type : "post",
						data : {
							"workId":workId,
							"userName":userName,
							"workTitle":workTitle,
							"workMoney":workMoney,
							"workState":workState
						},
						dataType : "json",
						success : function(msg) {
							var res = msg.res;
							if(res=="NotLogin"){
								//跳到登入界面
								location.href="login.html";
							}else if(res=="IsMyself"){
								//余额不足
								layer.msg('不能购买自己作品！',{
									icon: 2,
								    time: 1000, //1s后自动关闭
								  });
							}else if(res=="noMoney"){
								//余额不足
								layer.confirm('抱歉，您的余额不足。' ,{
					 						 btn: ['前往充值','立即取消'] //按钮
								}, function(){
										layer.closeAll('dialog'); 
										window.location.href='personalCenter.html';
									}
								);
							
								
							}else if(res=="noUp"){
								layer.msg('商品未处于上架状态！',{
									icon: 2,
								    time: 1000, //1s后自动关闭
								  });
							}else if(res=="SUC"){
								
								layer.msg('购买成功！',{
									icon: 1,
								    time: 1000, //1s后自动关闭
								  });
								window.setTimeout("location.reload()",1000);	
							}
							else{
								layer.msg('购买失败！',{
									icon: 2,
								    time: 1000, //1s后自动关闭
								  });
							}
							
						},
						error : function() {
							alert("请求失败！");
						}
					});
				
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