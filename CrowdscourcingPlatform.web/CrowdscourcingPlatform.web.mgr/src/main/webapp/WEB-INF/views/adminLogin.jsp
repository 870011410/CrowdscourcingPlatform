<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="3rd/layui/css/basic.css">
<link rel="stylesheet" href="3rd/layui/css/login.css">
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/basic.js"></script>

<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="js/particles.js"></script>
<title>一站式众包平台管理系统</title>
</head>
<body>
	<div class="pagewrap">

		<div class="main" id="screen">
			<div class="login-page dsj-login">
				<!-- <i class="ico ico-star1"></i>
    				<i class="ico ico-star2"></i>
    				<i class="ico ico-star3"></i>
    				<i class="ico ico-star4"></i>
    				<i class="ico ico-star5"></i> -->
				<!--<h3 class="platform-name">
    					<!--<i class="ico ico-logo"></i>-->
				<!--文档分享平台
    				</h3>---->
				<div class="login-block">
					<div class="login-pop">
						<div class="login-body clearfix">
							<div class="login-info">
								<div class="form-list">
									<center>
										<h1>管理员登入</h1>
									</center>
									<!--<div class="msg-error">
                                            <i class="btn btn-error"></i>
                                            用户名或密码错误
                                        </div>-->
								</div>
								<div class="form-list">
									<div class="li">
										<div class="ele-wrap">
											<input type="text" class="form-control" placeholder="请输入帐号"
												id="acc">
										</div>
									</div>
									<div class="li">
										<div class="ele-wrap">
											<input type="password" class="form-control"
												placeholder="请输入密码" id="pwd">
										</div>
									</div>

									<div class="li">
										<div class="ele-wrap">
											<a class="btn btn-blue" onclick="tologin()">登 录</a>


											<!--<select class="form-control">
														<option>请选择学历</option>
													</select>-->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="particles-js"></div>
		</div>
	</div>
	<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="3rd/layui/layui.js"></script>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});

		function tologin() {
			//发送文本框内容
			var acc = $("#acc").val();
			var pwd = $("#pwd").val();

			//发送一个ajax 请求  发送给loginservlet
			$.ajax({

				url : "adminLoginservice.action",
				type : "post",
				data : {
					"acc" : acc,
					"pwd" : pwd
				},
				dataType : "json",

				success : function(msg) {
					//回调函数
					/* alert(msg); */
					if (msg.type == "suc") {
						layer.msg('登录成功！', {
							icon : 6,
							time : 800, //800ms后自动关闭
						});
						window.setTimeout("window.location='MainFrame.html'", 800);
					}else{
						layer.msg('登录失败！', {
							icon : 5,
							time : 800, //800ms后自动关闭
						});						
					}
				},

				error : function() {
					layer.msg('请求失败',{
						icon: 5,
					    time: 1000, //1s后自动关闭
					  });
				}

			});
		}
	</script>
</body>

</html>
<script>
	$(function() {
		var winH = $(window).height();
		var starH = winH + 50;
		var starW = 998 / 998 * starH;
		$('.ico-star1').css({
			'height' : starH + 'px',
			'width' : starW + 'px'
		});
	});
</script>




