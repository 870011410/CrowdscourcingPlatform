//检测用户是否登入
			isLogin();
			function isLogin(){
				if($("#is-login").attr("user")==""){
					//没登入
					$("#is-login").empty();
					$("#is-login").append("<a href='login.html' class='a-text'>登入</a>");
				}
				
				
			}