<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>发布需求选择类型界面</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
<link rel="stylesheet" href="3rd/layui/css/global.css">
<link rel="stylesheet" href="css/footer.css">
<style>
.ta-search {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.div-font div {
	/* border: 1px solid black; */
	
}

.my-input {
	width: 120px;
	display: inline;
}

.center-icon {
	display: block;
	width: 50px;
	margin-left: auto;
	margin-right: auto;
}
/*添加需求类型的小界面  */
.add-need-type {
	background-color: #e2e2e2;
	text-align: center;
	font-size: 25px;
}
/* 文本框限制 */
.myText {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
}


.addNeedJf {
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	right: auto;
	left: auto;
	top: 120px;
	/*  overflow: hidden;  */
	z-index: 3;
	position: fixed;
	display: none; 
}
.mycol{
   
   height: 199px;
}
.mycol:hover {
     cursor:pointer;
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
	box-shadow: 0 0 20px rgba(0, 0, 0, .2);
}
.my-content{
	min-height: 660px;
}
.my-head{
	opacity: 0.8;
	background-image: url(img/title.jpg);
	height: 150px;
	width: 90%;
	margin-left: auto;
	margin-right: auto ;
}
.my-head-text{
    position: absolute;
    width: 433px;
    margin-left: 560px;
    margin-top: -93px;
    /* margin-right: auto; */
    font-size: 35px;
}
.circle {
	width: 100px;
	height: 100px;
	border: 1px solid #009688;
	margin: 0px auto;
	border-radius: 50%;
	text-align: center
}
.mycol:hover .div-text {
	margin-top: 13px;
	height: 40px;
	line-height: 40px;
	background-color: #63b5fb;
}
.mycol:hover span {
	display: inline !important;
	color: white;
	font-size: 17px;
}
</style>
</head>


<body style="margin-top: 60px;">
<div class="my-content">
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
	<br />
	<br />
	<div class="my-head">
		
	</div>
	<div >
		<h1 class="my-head-text">选择作品的类型，进行发布</h1>
	</div>
	
	<!-- 显示已经配置的类型位置 -->
	
	<div class="layui-row  div-font" style="padding-top: 25px;">

		<div class="layui-col-md10 layui-col-md-offset1" id="needTypeCase">

		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="layui-row">
<!--按钮位置  -->
		<div class="layui-col-md2 layui-col-md-offset5" id="button">
			
		</div>
	</div>
</div>
			<!----------------------------------底部---------------------------------------->
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
		<!----------------------------------底部---------------------------------------->

	

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script type="text/javascript" src="js/isLogin.js"></script>
		<script>
			//导入form样式
			layui.use(['element', 'layer'], function() {
				var element = layui.element;
				var layer = layui.layer;

			});
			var form;
			layui.use('form', function() {
				form = layui.form;

			});

			selectNeedType();
			//查询已经配置的需求（作品）类型
			function selectNeedType() {

				$.ajax({
					url: "selectNeedType.action",
					type: "post",
					data: {},
					dataType: "json",
					success: function(msg) {
						//返回回来的分配类型数据集合
						var needTypes = msg.needTypes;
						//拿到用来装类型的div
						var needTypeCase = $("#needTypeCase");
						//清空
						needTypeCase.empty();
						//循环插入配置的需求类型数据
						for(var i = 0; i < needTypes.length; i++) {
							var icon = chooseImg(needTypes[i].name);
							needTypeCase.append("<div onclick='chooseNeedType(this)' class='layui-col-md2 mycol' needId=" +
								needTypes[i].id +
								" needName=" + needTypes[i].name +
								">" +
								"<div class='layui-anim layui-anim-scale' align='center'>" +
								"<br><div class='circle'><img src=" +
								icon +
								" style='width: 60px; height: 60px;margin-top: 20px;' /></div>" +
								"<div class='doc-icon-name' " +
								"style='text-align: center; font-size: 17px;margin-top:8px'>" +
								needTypes[i].name +
								"</div>" 
								+" <div class='div-text'>"
								+" <span style='display: none;'>"
								+" <i class='layui-icon layui-icon-next' style='font-size: 17px;line-height: 40px;'>&nbsp;进入发布</i>"
								+" </span>"
								+" </div>"
								+" </div>" +
								"</div>");
						}

					},
					error: function() {
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

			//点击对应的类型后跳转到添加需求界面
			function chooseNeedType(item) {

				//选中的需求类型id
				var worktypeId = $(item).attr("needId");
				//选中的需求类型
				var workTypeName = $(item).attr("needName");
				//带着需求类型信息跳转到添加需求界面

				$.ajax({
					url: "jumpUpWorksWithNeedType.action",
					type: "post",
					data: {
						"worktypeId": worktypeId,
						"workTypeName": workTypeName

					},
					dataType: "json",
					success: function(msg) {
						location.href = "upWorks.html";
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