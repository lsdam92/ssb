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
// 		alert("${msg}")

	// 한글입력막기 스크립트
		$j("#userId").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $j(this).val();
				$j(this).val(v.replace(/[^a-z0-9]/gi,''));
			}
		});
	//로그인 요청
		$j("#login").click(function(){ 
			
			var $frm = $j('.loginForm :input');
			var param = $frm.serialize();
			
			 if($j("#userId").val().trim().length == 0){
				 $j("#userId").focus();
				alert("id를 입력해주세요.");
			} else if($j("#userPw").val().trim().length == 0){
				$j("#userPw").focus();
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
						<input name="userId" type="text"   value="${memberVo.userId}" id="userId">
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
					<tr>
						<td width="300" colspan="2">
						<c:if test="${msg != null}">
							<div>*id또는 비밀번호가 일치하지 않습니다.</div>
						</c:if>
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