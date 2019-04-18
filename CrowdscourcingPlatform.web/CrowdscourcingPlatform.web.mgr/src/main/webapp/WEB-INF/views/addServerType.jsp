<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="3rd/layui/css/layui.css">
		<style>
			.my-form {
				width: 350px;
				/*border-top: 2px solid #D8312A;*/
				margin: auto;
				top: 80px;
				bottom: 0;
			}
		</style>
	</head>


	<body>
		<br />
		<br />
		<h1 align="center">新增服务</h1>
		<br />
		<br />
		<form class="layui-form my-form" >
			<div class="layui-form-item">
				<label class="layui-form-label">服务名称：</label>
				<div class="layui-input-block">
					<input type="text" id="name" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input" id="title" style="width: 210px;">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label la-size">服务图标：</label>
					<div class="layui-input-inline" style="width: 210px;">
						<select lay-verify="required" id="se-picture" lay-filter="se-filter">
							<option value=""></option>	
						</select>
					</div>
					<img src="" id="img-picture" style="height: 40px;">
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="sent">
						<i class="layui-icon layui-icon-auz">&nbsp;确定</i> 
					</button>
					<button class="layui-btn layui-btn-primary" id="close" value="返回" >
						<i class="layui-icon layui-icon-return">&nbsp;返回</i> 
					</button>
				</div>
			</div>

		</form>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
			window.onload=function(){
				
			}
			
			layui.use('form', function() {
				var form = layui.form;
				//显示服务图标下拉框
				selectPicture(form);
				//图片随下拉框变化
				form.on('select(se-filter)', function(data){
					 var option=$("#se-picture option:selected");
					 var url=option.attr('url');
					 if(!url){
						 url="";
					 }
					 $("#img-picture").attr('src',url);
					
				});
				//提交表单数据
				 form.on('submit(sent)', function(data){
					 var option=$("#se-picture option:selected");
					 //服务名字
					 var name=$("#name").val();
					 //图片id
					 var id=option.val();
					 $.ajax({
							url : "addServerType.action",
							type : "post",
							data : {
								"name":name,
								"id":id
								
							},
							dataType : "json",
							success : function(msg) {
								if(msg.type=="SUC"){
									parent.layer.msg('新增服务类型成功！',{
										icon: 6,
									    time: 1000, //1s后自动关闭
									  });
									
									parent.layer.close(index);
									parent.selectServerType();	
									
								}else{
									parent.layer.msg(msg.type,{
										icon: 5,
									    time: 1000, //1s后自动关闭
									  });
								}
							},
							error : function() {
								parent.layer.msg('请求失败！',{
									icon: 5,
								    time: 1000, //1s后自动关闭
								  });
							}
						}); 
					 return false;
				});
	
			});
			//返回功能
			var index = parent.layer.getFrameIndex(window.name);
			$('#close').click(function() {
				parent.selectServerType();
				parent.layer.close(index);
				
			});
			//获取服务图标下拉框
			function selectPicture(form){
				$.ajax({
					url : "selectPicture.action",
					type : "post",
					data : {},
					dataType : "json",
					success : function(msg) {
						//得到的服务图标信息
						var picture= msg.picture;
						for(var i=0;i<picture.length;i++){
							$("#se-picture").append("<option value="+picture[i].id+" url="+picture[i].url+">"+picture[i].name+"</option>");
							
						}
						form.render();
					},
					
					error : function() {
						parent.layer.msg('请求失败！',{
							icon: 5,
						    time: 1000, //1s后自动关闭
						  });
					}
				});
				
			}


			
		</script>
	</body>
<html>	
