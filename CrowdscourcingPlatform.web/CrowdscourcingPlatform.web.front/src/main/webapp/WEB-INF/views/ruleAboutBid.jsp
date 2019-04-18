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
						url : "do-showRulesAboutBid.action",
						type : "post",
						data : {
						},
						dataType : "json",
						success : function(msg) {
							var ruleList=msg.ruleList;
							for (var i = 0; i < ruleList.length; i++) {
								var oneRule = ruleList[i];

								$("#rules").append("<div class='row' style='margin-left:40px;margin-right:40px;'></div>")
								var $div = $("#rules").find(".row").last();
								$div.append("<span style='font-size:15px;'>第（"+(i+1)+"）条</span><br>");
								$div.append("<span style='font-size:13px;display:block;text-indent:2em;'>"+oneRule.content+ "</span>");
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
	
		
		
		</script>
</body>
</html>