<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<link rel="stylesheet" href="3rd/layui/css/global.css">
		<link rel="stylesheet" href="css/search.css">
		<link rel="stylesheet" href="css/footer.css">
		<style type="text/css">
			.project-list>.el-row {
				width: auto;
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-webkit-box-orient: horizontal;
				-webkit-box-direction: normal;
				-ms-flex-direction: row;
				flex-direction: row;
				-webkit-box-pack: center;
				-ms-flex-pack: center;
				justify-content: center;
				-ms-flex-wrap: nowrap;
				flex-wrap: nowrap;
				padding: 16px;
				margin: 16px 0
			}
			
			.project-list .row-shadow {
				background: #fff;
				border-radius: 3px;
				-webkit-box-shadow: 0 0 10px 0 rgba(0, 0, 0, .12), 0 0 10px 0 rgba(0, 0, 0, .12);
				box-shadow: 0 0 10px 0 rgba(0, 0, 0, .12), 0 0 10px 0 rgba(0, 0, 0, .12)
			}
			
			.project-list .row-shadow:hover {
				-webkit-box-shadow: 0 1px 14px 0 #999;
				box-shadow: 0 1px 14px 0 #999
			}
			
			.project-list {
				position: absolute;
				margin-left: 477px;
    			margin-top: 300px;
				width: 860px;
			}
			
			.col-1 {
				width: 21%;
			}
			
			.col-2 {
				width: 96%;
			}
			
			.project-list .project-img {
				width: 112px;
				height: 102px;
			}
			
			.el-col {
				float: left;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
			}
		</style>

		<style>
			.div-type {
				position: absolute;
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				width: 250px;
				height: 490px;
				margin-left: 188px;
				margin-top: 40px;
				border-radius: 2px;
			}
			
			.div-title {
				height: 50px;
				background: #63b5fb;
			}
		</style>
		<style>
			.apps-box {
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-webkit-box-orient: horizontal;
				-webkit-box-direction: normal;
				-ms-flex-flow: row wrap;
				flex-flow: row wrap;
				-webkit-box-pack: start;
				-ms-flex-pack: start;
				justify-content: flex-start;
				-webkit-box-align: center;
				-ms-flex-align: center;
				align-items: center;
				margin-left: 5px;
				padding-top: 14px;
			}
			
			.apps-box .app-item {
				-webkit-box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				cursor: pointer;
				border-radius: 3px;
				min-width: 100px;
				width: 100px;
				margin: 0px 10px;
				margin-bottom: 16px;
				padding: 0px 0;
			}
			
			.app-all {
				-webkit-box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				box-shadow: 0 1px 10px 0 rgba(0, 0, 0, .16);
				cursor: pointer;
				border-radius: 3px;
				min-width: 220px;
				width: 220px;
				margin: 0px 10px;
				margin-bottom: 16px;
				padding: 0px 0;
			}
			
			.app-name-all {
				display: inline-block;
				text-align: center;
				margin: 6px 0;
				height: auto;
				font-size: 18px;
				margin-left: 60px;
				font-family: "华文细黑";
			}
			
			.apps-box .app-item .app-name {
				display: inline-block;
				text-align: center;
				margin: 10px 0;
				height: auto;
				font-size: 12px;
			}
			
			.apps-box .app-icon {
				text-align: center;
				vertical-align: middle;
				display: inline-block;
				padding: 10px 6px;
				border-radius: 3px 0 0 3px;
			}
			
			.apps-box .app-icon img {
				height: 15px;
				width: 15px;
				border: none;
				display: block
			}
			
			.active {
				color: #2583f8
			}
			
			.div-input {
				position: absolute;
				-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				box-shadow: 0 0 20px rgba(0, 0, 0, .2);
				margin-top: 40px;
				margin-left: 476px;
				width: 862px;
				height: 50px;
			}
			
			.search-input {
				display: inline-block;
				height: 50px;
				font-size: 18px;
				font-family: "华文细黑";
				width: 700px;
				border: 0px;
			}
			
			.search-btn {
				display: inline-block;
				width: 158px;
				height: 50px;
				border: 0px;
				margin-top: -3px;
			}
		</style>
		<style>
			.workTitle {
				font-family: "微软雅黑";
				font-size: 18px;
			}
			
			.workTitle:hover {
				color: #01AAED;
				cursor: pointer;
			}
			
			.workMoney {
				display: inline-block;
				position: absolute;
				font-family: "华文细黑";
				font-size: 22px;
				right: 50px;
				color: red;
				font-weight: bold;
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
			
			.myBtn:hover {
				background-color: rgba(242, 45, 0, 0.8);
			}
			
			.workUser {
				margin-top: 10px;
				color: gray;
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
			
			.workdate {
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
			
			.sp-text {
				font-style: oblique;
				margin-top: 26px;
				margin-bottom: 6px;
				font-size: 13px;
				color: #151519;
				display: block;
				text-align: center;
			}
			.zero_img{
		   
		   width:600px;
		   margin-left:125px;
		   margin-top: 50px;
		   margin-bottom: 50px;
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

			<input type="text" class="layui-input search-input" id="title" placeholder="输入标题，可配合需求类型搜索" />
			<button class="layui-btn layui-btn-normal search-btn " onclick="search()"><i class="layui-icon layui-icon-search " style="font-size: 30px;line-height: 50px;"></i> </button>

		</div>
		<div class="project-list" id="project-list">

		</div>

		<div class="div-type">

			<img src="img/go.jpg" style="width: 248px; margin: 1px;" />
			<span class="sp-text">即刻，在平台上搭起积木</span>
			<button class="layui-btn  layui-btn-normal" style="margin-top: 15px;margin-left: 15px;height: 35px; width: 100px; display: inline;" onclick="postWork()">发布作品</button>
			<button class="layui-btn  layui-btn-normal" style="margin-top: 15px;margin-left: 15px;height: 35px; width: 100px; display: inline;" onclick="postNeed()">发布需求</button>
			<img src="img/cube.png" style="width: 248px; margin-top: 15px;" />
		</div>
	<div class="content">
		<div class="sc-box">
			<div class="sc-row search__box">
				<div class="search__item">
					<div class="item__left">
						<span class="sc-row-title search__title">服务类型：</span>
					</div>
					<div class="item__right">
						<div class="sc-row-options search__btn search__btn--mb"
							id="service_box">
							<span class="option btn__item active" onclick="chooseServ(this)">
								不限 </span>
						</div>
					</div>
				</div>
				<div class="search__item search__item--bottom">
					<div class="item__left">
						<span class="sc-row-title search__title">需求类型：</span>
					</div>
					<div class="item__right">
						<div class="sc-row-options search__btn" id="type_box">
							<span class="option btn__item active"> 不限 </span>
						</div>
					</div>
				</div>

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
				layui.use(['element', 'layer'], function() {
					var element = layui.element;
					var layer = layui.layer;

				});
				var form;
				layui.use('form', function() {
					form = layui.form;

				});
				//跳到发布需求界面
				function postNeed(){
					location.href="postNeedSelectType.html";
					
				}
				//跳到发布作品界面
				function postWork(){
					location.href="postWorkSelectType.html";
				}
				showServiceType();
				//显示服务类型
				function showServiceType(){
					
					$.ajax({
						url: "initServerType.action",
						type: "post",
						data: {},
						dataType: "json",
						success: function(msg) {
							var pictures = msg.picture;
							//清空
							$("#service_box").empty();
							$("#service_box").append("<span class='option btn__item active' value='-1' onclick='chooseServ(this)'>"
                              +"不限</span>");
							for(var i=0;i<pictures.length;i++){
								var picture = pictures[i];
								$("#service_box").append("<span class='option btn__item' value="
										+picture.id
										+" onclick='chooseServ(this)'>"
										+picture.name
			                              +"</span>");
								
							}
						},

						error: function() {
							layer.msg('请求失败！', {
								icon: 2,
								time: 1000, //1s后自动关闭
							});
						}
					});
				}
				//显示类型图标
				function selectTypeIcon(servId) {

					$.ajax({
						url: "selectNeedTypeWithServ.action",
						type: "post",
						data: {
							"servId":servId
							
						},
						dataType: "json",
						success: function(msg) {
							var needTypes = msg.needTypes;
							//清空
							$("#type_box").empty();
						$("#type_box").append("<span class='option btn__item active' value='-1' onclick='chooseType(this)'>"
                          +"不限</span>");

							for(var i = 0; i < needTypes.length; i++) {
								var type = needTypes[i];
								var icon = chooseImg(type.name);
								$("#type_box").append("<span class='option btn__item' value="
										+type.id
										+" onclick='chooseType(this)'>"
										+type.name
				                        +"</span>");

							}
						},

						error: function() {
							layer.msg('请求失败！', {
								icon: 2,
								time: 1000, //1s后自动关闭
							});
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

				//改变服务类型
				function chooseServ(e) {
				  var serv= $(e).parent().find("span");
				  for(var i=0;i<serv.length;i++){
					  serv.eq(i).attr("class","option btn__item");
				  }
                    $(e).attr("class","option btn__item active");
                    
                    //根据服务类型变化改变需求类型
                    var servId = $(e).attr("value");
                    if(servId==-1){
                    	//清空
						$("#type_box").empty();
						$("#type_box").append("<span class='option btn__item active' value='-1' onclick=''>"
                          +"不限</span>");
                    }else{
                    	//显示服务类型下的需求类型
                    	selectTypeIcon(servId);
                    }
				}

				//改变需求类型								
				function chooseType(e) {
					  var serv= $(e).parent().find("span");
					  for(var i=0;i<serv.length;i++){
						  serv.eq(i).attr("class","option btn__item");
					  }
	                    $(e).attr("class","option btn__item active");
	                    
					}
				
				
				
				
	//生成需求			
				
				//分页参数(初始化的)
				//从哪里开始
				var start = 0;
				//每页的条数
				var limit = 4;
				//当前页
				var index = 1;
				//查询的条件
				//需求标题
				var title = "";
				//服务类型id
				var servId = -1;
				//需求类型id集合
				var typeId = -1;
				 initShowNeed();
				//分页初始化数据(需求信息)
				function initShowNeed() {
					$("#project-list").empty();
					$.ajax({
						url: "initShowNeed.action",
						type: "post",
						data: {
							"start": start,
							"limit": limit,
							"title": title,
							"servId":servId,
							"typeId":typeId

						},
						dataType: "json",
						success: function(msg) {

							//数据的处理
							var needs = msg.needs;

							if(needs.length == 0) {
								/* layer.msg('未查到匹配的结果！', {
									icon: 2,
									time: 1000, //1s后自动关闭
								}); */
								$("#project-list").append("<img class='zero_img' src='img/empty.png'  >");
							}
							for(var i = 0; i < needs.length; i++) {
								var need = needs[i];
								var icon = chooseImg(need.nteName);
								$("#project-list").append("<div class='row-shadow el-row'>" +
									"<div class='el-col col-1'>" +
									"<img alt='' class='project-img' src=" + icon + " ></a>" +
									"</div>" +
									"<div class='el-col col-2'>" +
									"<div class='workTitle' needId=" +
									need.id +
									" onclick='showDeti(this)'" +
									">" +
									need.title +
									"<div class='workMoney'>" +
									"￥" + need.money +
									"</div>" +
									"</div>" +
									"<div class='workUser'>" +
									"<i class='layui-icon layui-icon-user'></i>&nbsp;&nbsp;&nbsp;" +
									need.userName +
									"<span style='margin-left: 20px;color:gray;'>" +
									"发布时间：" +
									need.createTime.substring(0, 19) +
									"</span>" +
									"</div>" +
									"<div class='workType'>" +
									"<div class='type'>需求</div>" +
									"<div class='neetype'>" +
									need.nteName +
									"</div>" +
									"<div class='workdate'>" + need.memo + "</div>" +
									"<div class='buy'>" +
									"<button class='layui-btn  layui-btn-sm myBtn' " +
									"style='width: 150px;font-size: 16px;' " +
									"needId=" + need.id + " userName=" + need.userName + " needTitle=" + need.title +
									" onclick='budding(this)'>投标</button>" +
									"</div>" +
									"</div>" +
									"</div>" +
									"</div>");

							}

							//返回回来的总条数
							var count = msg.count;
							if(count != 0) {
								$("#project-list").append("<div id='page' align='center'></div>");
							}
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
											initShowNeed();
										}
									}
								});
							});

						},
						error: function() {
							layer.msg('请求失败！', {
								icon: 2,
								time: 1000, //1s后自动关闭
							});
						}
					});
				}
				//根据条件查询需求
				function search() {
					count = 0;
					index = 1;
					start = 0;

					title = $("#title").val().trim();
					servId = $("#service_box").find(".active").eq(0).attr("value");
					typeId = $("#type_box").find(".active").eq(0).attr("value");
					initShowNeed();

				}

				//查看需求详情的
				function showDeti(e) {
					var needId = $(e).attr("needId");

					//将need选中的id保存到session中
					$.ajax({
						url: "saveNeedIdToSession.action",
						type: "post",
						data: {
							"needId": needId

						},
						dataType: "json",
						success: function(msg) {
							location.href = "needDeti.html";
						},
						error: function() {
							alert("请求失败！");
						}
					});
				}
				//投标
				function budding(e) {

					var needId = $(e).attr("needId");
					var userName = $(e).attr("userName");
					var needTitle = $(e).attr("needTitle");
					//竞标请求
					$.ajax({
						url: "buddingNeedFirst.action",
						type: "post",
						data: {
							"needId": needId,
							"userName": userName,
							"needTitle": needTitle
						},
						dataType: "json",
						success: function(msg) {
							var res = msg.res;
							if(res == "NotLogin") {
								//跳到登入界面
								location.href = "login.html";
							} else if(res == "NotEligible") {
								//跳到成为服务商界面
								location.href = "toProvider.html";
							} else if(res == "NotType") {
								//跳到选择类型界面
								location.href = "toProvider.html";
							} else if(res == "isLeaMaster") {
								//跳到是联盟投标还是服务商投标
								location.href = "myselefOrLea.html";
							} else if(res == "IsMyself") {
								layer.msg('这是您自己的需求！', {
									icon: 2,
									time: 1000, //1s后自动关闭
								});
							} else if(res == "budded") {
								layer.msg('该需求您已经投过标了！', {
									icon: 2,
									time: 1000, //1s后自动关闭
								});

							} else {

								//跳到服务商投标界面
								location.href = "singleTender.html";
							}

						},
						error: function() {
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