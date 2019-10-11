<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<link href="${root}/css/reset.min.css" rel="stylesheet" type="text/css">
	<link href="${root}/css/style.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>Untitled Document</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	 $("#update").on("click",function(){
	 	var $frm = $('#regitForm :input');
		var param = $frm.serialize();
			
		alert(param);  
		$.ajax({
		    url : "/viewUpdate.do",
		    dataType: "json",
		    type: "POST",
		    data : param,
		    success: function(data, textStatus, jqXHR)
		    {
				alert("작성완료");
				alert(data.success);
				
				location.href="list";
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    }
		});
		
	}); 
});
</script>
<body>
<script type="text/javascript">

</script>
<div class="box_right modal fade modal-content" id="myModal" 
  style="position: fixed;left: 10%;
  top: 5%;
  width: 50%;
  height: 90%;">
	<div class="tit f_bold">
		<img alt="icon" src="/resources/image/icon.gif"> 사원 기본 정보 수정
	</div>
	<div class="page_menu f_bold">
		<ul class="li_left">
			<li><a href="#">교육정보</a></li>
			<li>|</li>
			<li><a href="#">자격증. 보유기술정보</a></li>
			<li>|</li>
			<li><a href="#">프로젝트 정보</a></li>
			<li>|</li>
			<li><a href="#">경력정보</a></li>
			<li>|</li>
			<li><a href="#">근무정보</a></li>
		</ul>
	</div>
	<form action="" id="regitForm">
	<div class="page_box">
		<div class="page_in float_h">
			<div class="picture_pr float_l"><img alt="증명사진" src=""></div>
			<div class="page_mar2 float_l">
				<div class="page_mar1">
					<label class="page4_1">한글이름 : </label>
					 <input type="text" name="kor_name" value="${board.kor_name}">
				</div>
				<div class="page_mar1">
					<label class="page4_1">영문이름 : </label>
					<input type="text" name="eng_name">
				</div>
				<div class="page_mar1">
					<label class="page4_1">한문이름: </label>
					<input type="text" name="han_name">
				</div>
				<div class="page_mar1">
					<label class="page4_1">주민등록번호 : </label>
					<input type="text" name="jumin_no" value="${board.jumin_no}"> - <input name="jumin_no" type="text" size="7" maxlength="7" value="${board.jumin_no}">
							<input name="user_no" type="hidden" value="${board.user_no }">
				</div>
			</div>
		</div>
		<div class="page_in clear_b">
			<div class="page_line page_mar1">
				<label class="page4_1">사진파일명 : </label>
				<input name="sajin_nm" type="text" size="40" value=""> <font color="#FF0000"><img src="/resources/image/bt_search.gif" width="49" height="18"></font>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">생년월일 : </label>
				<input type="text" name="birth_ymd" value="" size="8"> 년 <input name="birth_ymd" type="text" size="5"> 월 <input name="birth_ymd" type="text" size="5"> 일 ( <input type="radio" name="birth_rn" value="1"> 양력 <input type="radio" name="birth_rn" value="0"> 음력 )
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">성별 : </label>
				<input type="radio" name="sex" value="1" checked="checked"> 남자 <input type="radio" name="sex" value="0"> 여자
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">결혼유무 : </label>
				<input type="radio" name="marry_yn" value="1"> 미혼 <input type="radio" name="marry_yn" value="0"> 기혼
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">년차 : </label>
				<input name="work_year" type="text" size="10" value="${board.work_year}">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">급여 지급유형 : </label>
				<select name="join_st">
					<option value="1">월급</option>
				</select>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">희망직무 : </label>
				<select name="hope_work">
					<option value="1">SI</option>
					<option value="2">SM</option>
				</select>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">입사유형 : </label>
				<select name="select4">
					<option>정규직</option>
					<option>계약직</option>
				</select>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">주소 : </label>
				<input name="addr" type="text" size="10"> <input name="textfield333" type="text" size="40">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">연락처 : </label>
				<input name="tel" type="text" size="10" value="${board.tel }"> - <input name="tel" type="text" size="10" value="${board.tel2 }"> - <input name="tel" type="text" size="10" value="${board.tel3 }">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">이메일 : </label>
				<input name="email" type="text" size="20">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">기술등급 : </label>
				<input  name="tech_grd" type="text" size="20" value="${board.tech_grd}">
			</div>
			<div class="page_mar1">
				<label class="page4_1">주량 : </label>
				<input name="alc_qt" type="text" size="20">
			</div>
		</div>
		<div class="btn_all">
			<button type="button" id="update"><img alt="remove" src="/resources/image/bt_remove.gif"></button>
			<button type="button" id="cancel"><img alt="cancel" src="/resources/image/bt_cancel.gif"></button>
		</div>
	</div>
	</form>
</div>
</body>
</html>