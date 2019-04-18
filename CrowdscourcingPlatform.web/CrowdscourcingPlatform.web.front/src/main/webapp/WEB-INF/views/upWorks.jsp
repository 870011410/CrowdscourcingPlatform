<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<title>发布新作品</title>
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
				box-shadow: 0 0 20px rgba(0, 0, 0, .2)
				position: absolute;
				width: 600px;
				height: 750px;
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
						<a href="javascript:;"  class="a-text"><img src="${user.src}" class="layui-nav-img">我</a>
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
		<div class="div-logArea">
			<br>
			  <h1 align="center">作品发布</h1>
			<div class="features-header-line"></div>
			<div class="layui-form my-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label"  >作品类型：</label>
					<div class="layui-input-inline" style="width:300px">
						<input id="in-need" lay-verify="required" class="layui-input" readonly="readonly" 
						worktypeId=${worktypeId} value=${workTypeName} >
					</div>
					<label class="layui-form-label-col"  ><a href="postWorkSelectType.html"><i class="layui-icon layui-icon-edit"></i><span style="color:green">修改</span></a></label>
						
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">作品标题：</label>
					<div class="layui-input-block">
						<input id="in-title" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作品内容：</label>
					<div class="layui-input-block">
						<textarea id="in-content" ></textarea>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作品金额：</label>
					<div class="layui-input-block">
						<input id="in-money" lay-verify="required" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">作品图片：</label>
					<div class="layui-input-block">
						<div class="layui-upload-drag" id="img">
							<i class="layui-icon"></i>
							<p>点击上传，或将文件拖拽到此处</p>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item" >
					<label class="layui-form-label"></label>
						<div class="layui-input-inline" style="width:60px"  >
							<input type="checkbox" id="accept-rule" title="同意" lay-skin="primary">						              	   
						</div>
					<label class="layui-form-label-col"  ><a href="rulesCenter.html" style="color:blue">《一站式众包规则》</a></label>	   						   
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="upWorks" lay-filter="sent" onclick="checkSpan()">立即提交</button>
						<input type="button" class="layui-btn layui-btn-primary" id="close" onclick="retHome()" value="返回">
					</div>
				</div>
			</div>
		</div>
		<div><img id ="my-img" src=""></div>
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
			layui.use(['element','layer'], function() {
				var element = layui.element;
				var layer = layui.layer;

			});
			
			var checkRule = 0;
			layui.use(['layedit', 'layer', 'jquery', 'upload'], function() {
				var $ = layui.jquery;
				var	layer = layui.layer;
				var	layedit = layui.layedit;
				var upload = layui.upload;
				layedit.set({

					tool: [
						'strong', 'italic', 'underline', 'del', '|', 'fontFomatt', 'fontfamily', 'fontSize', 'fontBackColor', 'colorpicker', 'face', '|', 'table', 'customlink', 'fullScreen'
					],
					height: '30%'
				});
				var index = layedit.build('in-content');

				//拖拽上传
				
				upload.render({
					elem: '#img',
					bindAction: '#upWorks',
					url: 'upWorks.action',
					auto: false,
					before: function(obj) {
						
						this.data = {
							"title": $("#in-title").val(),
							"content": layedit.getContent(index),
							"money": $("#in-money").val(),
							"worktypeId": $("#in-need").attr('worktypeId'),
							"check":$("#accept-rule").prop("checked")
						}

					},
					done: function(msg,index,upload) {
						if(msg.type=="SUC"){
							layer.msg('发布作品成功！等待审核',{
								icon: 6,
							    time: 1000, //1s后自动关闭
							  });
							window.setTimeout(retHome,1000);	
						}else{
							
	 						layer.msg(msg.type,{
								icon: 5,
							    time: 1000, //1s后自动关闭
							  });
							window.setTimeout("location.reload()",1000);	
						}
						
					}
				});
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
			
			//返回首页
			function retHome(){
				location.href="homePage.html";
			}
			//判断非空
			function checkSpan(){
				
				if($(".layui-upload-choose").eq(0).text()==""){
					parent.layer.msg('请选择一个文件',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
				}
				
				
			}
		</script>
	</body>

</html>