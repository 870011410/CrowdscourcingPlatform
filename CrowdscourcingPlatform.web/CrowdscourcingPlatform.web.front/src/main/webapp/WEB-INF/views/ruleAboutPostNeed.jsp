<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>需求发布规则</title>
</head>
<body>
	<div id="rules">
	</div>
		<script type="text/javascript" src="3rd/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="3rd/layui/layui.js"></script>
		<script>
		
		
		
		showRules();
		//分页初始化数据
		function showRules() {
			
			$("#rules").find(".row").remove();
			$
					.ajax({
						url : "do-showRulesAboutPostNeed.action",
						type : "post",
						data : {
						},
						dataType : "json",
						success : function(msg) {
							var ruleList=msg.ruleList;
							for (var i = 0; i < ruleList.length; i++) {
								var oneRule = ruleList[i];
								var num=changeNum(i);
								$("#rules").append("<div class='row' style='margin-left:40px;margin-right:40px;'></div>")
								var $div = $("#rules").find(".row").last();
								$div.append("<span style='font-size:18px;line-height: 30px;'>第"+num+"条</span><br>");
								$div.append("<span style='font-size:15px;line-height: 35px;display:block;text-indent:2em;'>"+oneRule.content+ "</span>");
							}
						},
						error : function() {
							layer.msg('请求失败！', {
								icon : 5,
								time : 1000, //1s后自动关闭
							});
						}
					});
		}
	
		function changeNum(i){
			i=i+1;
			var num;
			if(i==1){
				num='一';
			}else if(i==2){
				num='二';
			}else if(i==3){
				num='三';
			}else if(i==4){
				num='四';
			}else if(i==5){
				num='五';
			}else if(i==6){
				num='六';
			}else if(i==7){
				num='七';
			}else if(i==8){
				num='八';
			}else if(i==9){
				num='九';
			}else if(i==10){
				num='十';
			}else if(i==11){
				num='十一';
			}else if(i==12){
				num='十二';
			}else if(i==13){
				num='十三';
			}else if(i==14){
				num='十四';
			}else if(i==15){
				num='十五';
			}else if(i==16){
				num='十六';
			}else if(i==17){
				num='十七';
			}else if(i==18){
				num='十八';
			}else if(i==19){
				num='十九';
			}else if(i==20){
				num='二十';
			}else if(i==21){
				num='二十一';
			}else if(i==22){
				num='二十二';
			}else if(i==23){
				num='二十三';
			}else if(i==24){
				num='二十四';
			}else if(i==25){
				num='二十五';
			}
			return num;
		}
		
		</script>
</body>
</html>