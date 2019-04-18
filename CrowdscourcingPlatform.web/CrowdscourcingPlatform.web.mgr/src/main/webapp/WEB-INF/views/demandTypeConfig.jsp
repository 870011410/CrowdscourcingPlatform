<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>需求类型配置</title>
<link rel="stylesheet" href="3rd/layui/css/layui.css">
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
   margin-top: 10px;
}
.mycol:hover {
     cursor:pointer;
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, .2);
	box-shadow: 0 0 20px rgba(0, 0, 0, .2);
}
.doc-icon-name{

    margin-top: 15px;
    margin-bottom: 10px;
}
</style>
</head>

<body>
	<br />
	<br />
	<h1 align="center">需求类型配置</h1>
	<br />
	<hr class="layui-bg-gray" style="width: 70%; margin-left: 15%;">
	<br />
	<!-- 显示已经配置的类型位置 -->
	<div class="layui-row  div-font">

		<div class="layui-col-md10 layui-col-md-offset1" id="needTypeCase">

			<!-- 每一个的需求类型（动态生成） -->
			<!-- <div class="layui-col-md3">
				<i class="layui-icon layui-icon-component center-icon"
					style="font-size: 50px; text-align: center;"></i>
				<div class="doc-icon-name"
					style="text-align: center; font-size: 25px">测试的</div>
			</div> -->


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

	

	

	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//导入form样式
		var form;
		layui.use('form', function() {
			form = layui.form;
			

		});
		
		selectNeedType();
		//查询已经配置的需求（作品）类型
		function selectNeedType() {

			$.ajax({
						url : "selectNeedType.action",
						type : "post",
						data : {},
						dataType : "json",
						success : function(msg) {
							//返回回来的分配类型数据集合
							var needTypes = msg.needTypes;
							//拿到用来装类型的div
							var needTypeCase = $("#needTypeCase");
							//清空
							$("#button").empty();
							needTypeCase.empty();
							//循环插入配置的需求类型数据
							for (var i = 0; i < needTypes.length; i++) {
								var icon=chooseImg(needTypes[i].name);
								needTypeCase.append("<div class='layui-col-md2 mycol'>"
										+"<div class='layui-anim layui-anim-scale' align='center'>"
												+ "<br><img src="+icon+
                	                          " width='60px'  height='60px' />"
												+ "<div class='doc-icon-name' "+
            			                  "style='text-align: center; font-size: 17px'>"
												+ needTypes[i].name + "</div>"
												+"</div>"
												+ "</div>");
							}
							//延迟一下显示按钮
							setTimeout(addBtn,300);
					        
							  

							
						},
						error : function() {
							layer.msg('请求失败',{
								icon: 5,
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
		
		
		//弹出层
		layui.use('layer', function() {
			var layer = layui.layer; //执行一个laydate实例 
			window.myOpen = function() {
				layer.open({
					type: 2,
					title: false,
					shade: [0.2],
					area: ['500px', '400px'],
					offset: '150px', //右下角弹出
					anim: 2,
					content: 'addNewNeedType.html', //iframe的url，no代表不显示滚动条
					success: function(layero, index) {
						/* var data = new Array();
						data[0] = $("#title").val(); //自己的数据存进去

						var body = layer.getChildFrame('body', index); //确定两个界面父子关系
						var iframeWin = window[layero.find('iframe')[0]['name']]; //子页面对象
						iframeWin.inputDataHandle(data); */

					}
				});

			}
		});
		//刷新界面的方法
		function refushJp(){
			selectNeedType();
		}
		//添加按钮
		 function addBtn() {
			 //添加按钮
			 
				$("#button").append("<div class='layui-anim layui-anim-scale'>"
						+"<button class='layui-btn layui-btn-fluid' "+
						" style='background-color:#F4A460' onclick='myOpen()'><i class='layui-icon layui-icon-add-1'>&nbsp;新增类型</i></button>"+"</div>");
		   }
	</script>
</body>

</html>