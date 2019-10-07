<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var idck= 0;
	$j(document).ready(function(){
		
		
		$j("#join").on("click",function(){
			var $frm = $j('.memberJoin :input');
			var param = $frm.serialize();
			
			var phone2 = $j("#userPhone2").val();
			var phone3 = $j("#userPhone3").val();
			alert(param);
			if($j("#userId").val().trim().length == 0){
				alert("id를 입력해주세요.");
				$j("#userId").focus();
			} else if($j("#userPw").val().trim().length == 0){
				alert("비밀번호를 입력해주세요.");
				$j("#userPw").focus();
			} else if($j("#passck").val().trim().length == 0){
				alert("비밀번호 확인란을 입력해주세요.");
				$j("#passck").focus();
			} else if($j("#userName").val().trim().length == 0){
				alert("이름을 입력해주세요.");
				$j("#userName").focus();
			} else if(phone2.trim().length == 0){
				alert("핸드폰번호를 입력해주세요.");
				$j("#userPhone2").focus();
			} else if(phone3.trim().length == 0) {
				alert("핸드폰번호를 입력해주세요.");
				$j("#userPhone3").focus();
			}else if(isNaN(phone2)) {
				alert("핸드폰번호는 숫자만 입력가능합니다.");
				$j("#userPhone2").focus();
			}else if(isNaN(phone3)) {
				alert("핸드폰번호는 숫자만 입력가능합니다.");
				$j("#userPhone3").focus();
			}else  if(idck==0){
	            alert('아이디 중복체크를 해주세요');
	        }else {
			$j.ajax({
			    url : "/board/joinAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("회원가입완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
			}
		});
		$j("#idck").click(function() {
	        
	        //userid 를 param.
	        var userid =  $j("#userId").val(); 
	        
	        $j.ajax({
	            async: true,
	            type : 'POST',
	            data : userid,
	            url : "/board/idCheck.do",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt > 0) {
	                    
	                    $j("#userId").focus();
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    
	                
	                } else {
	                    $j("#userPw").focus();
	                    alert("사용가능한 아이디입니다.");
	                    //아이디가 중복하지 않으면  idck = 1 
	                    idck = 1;
	                    
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
	    });
		
		// password 형식 - 정규표현식
		// 숫자, 특수문자, 영문자 포함한6~12자리 이내의 비밀번호만 허용
		var passtypecnt = 1;
		var passwordRule = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{6,11}$/;
		
		// password 형식 체크
		$j("#userPw").keyup(function(){
			var pass = $j(this).val();
			var passck = $j("#passck").val();
			
			if(pass.trim().length == 0){			
				$j("#passtypecheck").css('color', 'tomato');
				$j("#passtypecheck").text('*비밀번호를 입력해주세요.');
			} else if(!passwordRule.test(pass)){
				passtypecnt = 1;
				$j("#passtypecheck").css('color', 'tomato');
				$j("#passtypecheck").html('*비밀번호는 특수문자+영문+숫자를 포함한 6~12자리입니다.');
			}else{
				passtypecnt = 0;
				$j("#passtypecheck").css('color', 'steelblue');
				$j("#passtypecheck").html('*사용 가능한 비밀번호 입니다.');
			}
		});
		
		var passsamecnt = 1;
		
		// password확인 일치 여부
		$j("#passck").keyup(function(){
			var pass = $j("#userPw").val();
			var passck = $j(this).val();
			
			if(passck.trim().length == 0){			
				$j("#passsamecheck").css('color', 'tomato');
				$j("#passsamecheck").text('*비밀번호를 입력해주세요.');
			}else if(pass != passck){
				passsamecnt = 1;
				$j("#passsamecheck").css('color', 'tomato');
				$j("#passsamecheck").text('*비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
				return false;
			} else {
				passsamecnt = 0;
				$j("#passsamecheck").css('color', 'steelblue');
				$j("#passsamecheck").html('*비밀번호가 일치합니다.');			
			}
		});
	});
	

</script>
<body>
<form class="memberJoin">
	<table align="center">
		<tr>
			<td align="left">
				<a href="/board/boardList.do">List</a>
				<a href="/board/login.do">Login</a>
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
						<input name="idck" type="button" value="중복확인" id="idck">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						PW
						</td>
						<td width="300">
						<input name="userPw" type="password" value="${memberVo.userPw}" id="userPw"> 
						<div id="passtypecheck">비밀번호를 입력하세요.</div>
						</td>
					</tr>
					<tr>
						<td align="center">
						PW CHECK
						</td>
						<td>
						<input type="password" id="passck">
						<div id="passsamecheck">*비밀번호를 입력해주세요.</div>
						</td>
					</tr>
					<tr>
						<td align="center">
						NAME
						</td>
						<td>
						<input name="userName" type="text"  value="${memberVo.userName}" id="userName">
						</td>
					</tr>
					<tr>
						<td align="center">
						PHONE
						</td>
						<td>
							<select name="userPhone1">
								<c:forEach items="${phoneList}" var="list">
									<option  value="${list.codeName}">${list.codeName}
								</c:forEach>
							</select>
						- <input name="userPhone2" type="text" value="${memberVo.userPhone2}" style="width: 50px;" id="userPhone2"> - 
							<input name="userPhone3" type="text" value="${memberVo.userPhone3}"style="width: 50px;" id="userPhone3"> 
						</td>
					</tr>
					<tr>
						<td align="center">
						POSTNO
						</td>
						<td>
						<input name="userAddr1" type="text" value="${memberVo.userAddr1}">
						</td>
					</tr>
					<tr>
						<td align="center">
						ADDRESS
						</td>
						<td>
						<input name="userAddr2" type="text"value="${memberVo.userAddr2}">
						</td>
					</tr>
					<tr>
						<td align="center">
						COMPANY
						</td>
						<td>
						<input name="userCompany" type="text"  value="${memberVo.userCompany}">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="#none" id="join">Join</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>