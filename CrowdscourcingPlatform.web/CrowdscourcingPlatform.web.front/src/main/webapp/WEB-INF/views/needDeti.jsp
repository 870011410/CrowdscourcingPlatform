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
				height: 200px;
				
				
				overflow-y:scroll ;
				
			}
			/*隐藏滚动条*/
			.project-down::-webkit-scrollbar {display:none}
			.project-down-down{
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
				position: absolute;
				margin-left: 478px;
				margin-top: 515px;
				width: 860px;
				height: 200px;
				overflow-y:scroll ;
			}
			/*隐藏滚动条*/
			.project-down-down::-webkit-scrollbar {display:none}
			.project-down-down-down{
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2) position: absolute;
				position: absolute;
				margin-left: 478px;
				margin-top: 745px;
				width: 860px;
				height: 200px;
				overflow-y:scroll ;
			}
			.project-down-down-down::-webkit-scrollbar {display:none}
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
				height: 500px;
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
				font-family: "微软雅黑";
				font-size: 18px;
			}
			
			.workUser {
				margin-top: 10px;
				color:gray;
			}
			
			.workType {
				margin-top: 20px;
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
			.myBtn{
			display:inline-block;
			    position:absolute;
			    background-color:#FF5722;
				font-family: "华文细黑";
				font-size: 25px;
				right:84px;
				color: white;
				font-weight: bold;
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
			.workdate{
			display: inline-block;
				margin-left: 15px;
				height: 20px;
				width: 70px;
				background-color: #CDB5CD;
				line-height: 20px;
				text-align: center;
				color: white;
				border-radius: 2px;
			}
			.buy {
				position: absolute;
				display: inline-block;
				width: 150px;
				margin-left: 335px;
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
			.need-text{
				margin-top: 10px;
				margin-left: 10px;
				margin-right: 10px;
			}
			.tender-people{
				margin-top: 10px;
			}
			.tender{
			   display: inline-block;
				width: 100px;
				margin-top: 10px;
				
			}
			.tender:hover{
				cursor: pointer;
				
			}
/* 			.my-content{
			min-height: 1200px;
			} */
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
		<div class="div-input">
			<img src="img/needDeti.png" style="width: 30px; margin-top: -10px;margin-right: 10px;" />
			<div class="info">投标中心</div>
		</div>
		<div class="project-up">
			<div class="div-title">
				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-cart-simple "></i> 需求竞标
				</div>
			</div>
			<div class="workContent" id="needContent">
				
				</div>
			</div>
		</div>
		<div class="project-down-down-down">
			<div class="div-bottom">
				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-edit"></i> 竞标服务商
				</div>
				<div class="tender-people" id="people-box">
				
							
			</div>
			</div>
			<div class="need-text">
			</div>
		</div>
		<div class="project-down-down">
			<div class="div-bottom">
				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-edit"></i> 竞标要求
				</div>
			</div>
			<div class="need-text" id="need-demand">
			</div>
		</div>
		<div class="project-down">
			<div class="div-bottom">
				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-edit"></i> 需求描述
				</div>
			</div>
			<div class="need-text" id="need-describe">
			</div>
		</div>
		<div class="div-type">
			<div class="div-title">

				<div style=" padding-top: 12px;margin-left: 30px;color: white;font-family:'华文细黑';font-size: 18px;">
					<i class="layui-icon layui-icon-release "></i> 竞标流程
				</div>
				<div class="content">
					<div class="zb-normal-list-box">
						<ul style="padding: 0px;">
							<li class="zb-orderly-list"><span class="zb-orderly-mark">1</span>
								<p class="zb-normal-list-content">浏览项目需求，选择适合的</p>
							</li>
							<li class="zb-orderly-list"><span class="zb-orderly-mark">2</span>
								<p class="zb-normal-list-content">选择身份进入投标</p>
							</li>
							<li class="zb-orderly-list"><span class="zb-orderly-mark">3</span>
								<p class="zb-normal-list-content">理解需求，进行投标</p>
							</li>
							<li class="zb-orderly-list"><span class="zb-orderly-mark">4</span>
								<p class="zb-normal-list-content">按要求工期完成项目</p>
							</li>
							<li class="zb-orderly-list"><span class="zb-orderly-mark">5</span>
								<p class="zb-normal-list-content">提交项目，交易完成</p>
							</li>
						</ul>
							<img src="img/needDiteMy.png" style="width: 198px; margin-top: 50px;" />
					</div>
				</div>
			</div>
	</div>

<!--------------------------------------------------------------------底部------------------------------------------------------------------>
<div class="fly-footer" style="margin-top:1000px;">

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

				});
				 var form;
				layui.use('form', function() {
					form = layui.form;

				});
				showNeedDeti();
				
				function showNeedDeti(){
					$.ajax({
						url : "selectNeedDetiWithNeedId.action",
						type : "post",
						data : {
						},
						dataType : "json",
						success : function(msg) {
							var need = msg.needDeti;
							var icon = chooseImg(need.nteName);
							$("#needContent").append(
							"<div class='el-col col-1'>"
							+"<img alt='' class='project-img' src="+icon+" ></a>"
						    +"</div>"
						    +"<div class='el-col col-2'>"
							+"<div class='workTitle' needId="
							+need.id
							+">"
                            +need.title
							+"<div class='workMoney'>"
							+"￥"	+need.money
							+"</div>"
							+"</div>"
							+"<div class='workUser'>"
							+"<i class='layui-icon layui-icon-user' id='userName' "
							+" userName="+need.userName
							+">"
							+"</i>&nbsp;&nbsp;&nbsp;"
							+need.userName
							+"<span style='margin-left: 20px;color:gray;'>"
							+"发布时间："
							+need.createTime.substring(0,19) 
							+"</span>"
							+"</div>"
							+"<div class='workType'>"
							+"<div class='type'>需求</div>"
							+"<div class='neetype'>"
							+need.nteName
							+"</div>"
							+"<div class='workdate'>"+need.memo+"</div>"
							+"<div class='buy'>"
							+"<button class='layui-btn  layui-btn-sm myBtn' "
							+"style='width: 150px;font-size: 16px;' "
							+"needId="+need.id+" userName="+need.userName+" needTitle="+need.title
							+" onclick='budding(this)'>投标</button>"
							+"</div>"
							+"</div>"
                            +"</div>");
							
							//需求描述
							$("#need-describe").append(need.content);
							//需求要求
							$("#need-demand").append(need.demand);
							//显示投标服务商
							showTenderPeopleWithNeedId();
						},
						error : function() {
							alert("请求失败！");
						}
					});
					
					
				}
				//显示投标服务商
				function showTenderPeopleWithNeedId(){
					$.ajax({
						url : "showTenderPeopleWithNeedId.action",
						type : "post",
						data : {
						},
						dataType : "json",
						success : function(msg) {
							var tenders = msg.tenders;
							for(var i=0;i<tenders.length;i++){
								var tender = tenders[i];
								var name = tender.userName;
								var handImg = tender.userImg;
								if(tender.userName==undefined){
									name=tender.leaName+"(联盟)";
									handImg = tender.leaUrl;
								}
								if(handImg==undefined){
									
									handImg ="img/need/wenhao.png";
								}
							$("#people-box").append("<div class='tender' align='center' needId="
									+tender.needId
									+" userId="
									+tender.userId
									+" leaId="
									+tender.leaId
									+" bidId="
									+tender.bidId
									+" onclick='showTenderPeolpeDeti(this)' >"
									+"<div id=''>"
									+"<img src='"
									+handImg
									+"' width='50px'/>"
							        +"<br>"
						            +name
									+"</div>"
									+"</div>");
							}
							
						},
						error : function() {
							alert("请求失败");
						}
					});
				}
				
				//弹出层
				layui.use('layer', function() {
					var layer = layui.layer;//执行一个laydate实例 
					//详情
					window.showTenderPeolpeDeti = function(e) {
						//判断投标人是联盟还是服务商
						var leaId = $(e).attr("leaId").trim();
						var userId = $(e).attr("userId").trim();
						//id
						var id = userId;
						//url
						var jumpUrl="tenderDetiPeople.html";
						
						if(leaId!="undefined"){
							id = leaId;
							jumpUrl="tenderDetiLeague.html";
							}
						//发布人名
						var userName = $("#userName").attr("userName");
						layer.open({
							type: 2,
							title: false,
							shade: [0.2],
							area: ['620px', '670px'],
							content: jumpUrl, //iframe的url，no代表不显示滚动条
							success: function(layero, index) {
								var data=new Array();
								data[0]=leaId;//自己的数据存进去
								data[1]=userId;
								data[2]=userName;
								data[3]=$(e).attr("bidId");
								var body=layer.getChildFrame('body',index);//确定两个界面父子关系
								var iframeWin=window[layero.find('iframe')[0]['name']];//子页面对象
								iframeWin.inputDataHandle(data);
							}

						});
					}
				})
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
				
				 //投标
				function budding(e){
					
					 var needId=$(e).attr("needId");
					 var userName=$(e).attr("userName");
					 var needTitle = $(e).attr("needTitle");
					 //竞标请求
					 $.ajax({
							url : "buddingNeedFirst.action",
							type : "post",
							data : {
								"needId":needId,
								"userName":userName,
								"needTitle":needTitle
							},
							dataType : "json",
							success : function(msg) {
								var res = msg.res;
								if(res=="NotLogin"){
									//跳到登入界面
									location.href="login.html";
								}else if(res=="NotEligible"){
									//跳到成为服务商界面
									location.href="toProvider.html";
								}else if(res=="NotType"){
									//跳到选择类型界面
									location.href="toProvider.html";
								}else if(res=="isLeaMaster"){
									//跳到是联盟投标还是服务商投标
									location.href="myselefOrLea.html";
								}else if(res=="IsMyself"){
									layer.msg('这是您自己的需求！',{
										icon: 2,
									    time: 1000, //1s后自动关闭
									  });
								}else if(res=="budded"){
									layer.msg('该需求您已经投过标了！',{
										icon: 2,
									    time: 1000, //1s后自动关闭
									  });
									
								}else{
									//跳到服务商投标界面
									location.href="singleTender.html";
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