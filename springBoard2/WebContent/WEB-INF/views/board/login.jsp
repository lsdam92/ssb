<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
	//로그인 요청
		$j("#login").click(function(){
			
			var $frm = $j('.loginForm :input');
			var param = $frm.serialize();
			
			alert(param);
		
			 if($j("#userId").val().trim().length == 0){
				alert("id를 입력해주세요.");
			} else if($j("#userPw").val().trim().length == 0){
				alert("비밀번호를 입력해주세요.");
			} else {
				$j(".loginForm").attr("method", "POST").attr("action", "/board/loginAction.do").submit();
			} 
		});
	});
	
</script>
<body>
<form class="loginForm" method="" action="">
	<table align="center">
		<tr>
			<td align="left">
				<a href="/board/boardList.do">List</a>
				<a href="/board/join.do">Join</a>
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						ID
						</td>
						<td width="300">
						<input name="userId" type="text"  value="${memberVo.userId}" id="userId">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						PW
						</td>
						<td width="300">
						<input name="userPw" type="password" value="${memberVo.userPw}" id="userPw"> 
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="#none" id="login">Login</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>