<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/page4.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<link href="${root}/css/reset.min.css" rel="stylesheet" type="text/css">
	<link href="${root}/css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>Untitled Document</title>
</head>
<script type="text/javascript">
 
$(document).ready(function(){
	
	 $("#mybtn").on("click",function(){
	 	var $frm = $('.boardUpdate :input');
		var param = $frm.serialize();
			
		alert(param);  
		$.ajax({
		    url : "/view",
		    dataType: "json",
		    type: "GET",
		    data : param,
		    success: function(data, textStatus, jqXHR)
		    {
				alert("작성완료");
				var jumin = data.result.jumin_no;
				var tel = data.result.tel;
				var birth = data.result.birth_ymd;
// 				alert(data.sucess);
				$("input[name='user_no']").val(data.result.user_no);
				$("input[name='kor_name']").val(data.result.kor_name);
				$("input[name='eng_name']").val(data.result.eng_name);
				$("input[name='han_name']").val(data.result.han_name);
				$("input[name='jumin_no']").val(jumin.substr(0,6));
				$("input[name='jumin_no']").val(jumin.substr(7,12));
				$("input[name='birth_ymd']").val(birth.substr(0,4));
				$("input[name='birth_ymd']").val(birth.substr(4,2));
				$("input[name='birth_ymd']").val(birth.substr(6,6));
				$("input[name='sex']").val(data.result.sex);
				$("input[name='tel']").val(tel.substr(0,3));
				$("input[name='tel']").val(tel.substr(3,4));
				$("input[name='tel']").val(tel.substr(7,9));
				$("input[name='join_st']").val(data.result.join_st);
				$("input[name='tech_grd']").val(data.result.tech_grd);
				$("input[name='enable']").val(data.result.enable);
				$("#myModal").modal();
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    }
		});
		
	}); 
});
</script>
<body >
<div class="modal "></div>
<div class="box_right boardUpdate">
	<div class="tit f_bold">
		<img alt="icon" src="/resources/image/icon.gif"> 사원조회
	</div>
	<div class="float_r main_search">
		<select >
			<option selected>::::: 전체 :::::</option>
		</select> 
		<input type="text" class="input"> <a href="#"><img alt="search" src="/resources/image/search.gif"></a>
	</div>
	<div class="main_box clear_b">
		<div class="main_tab main_top">
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="view" data-toggle="modal" id="mybtn">수정</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">인사기록카드</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">경력정보</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">근무정보</a>
		</div>
		<!-------------------------  리스트 ------------------------------>
		<form action="/view" class="frm">
		<table>
			<tr>
				<th width="35px"></th>
				<th width="85px">이름</th>
				<th width="153px">주민번호</th>
				<th width="91px">성별</th>
				<th width="91px">기술등급</th>
				<th width="91px">입사유형</th>
				<th width="94px">근무여부</th>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<c:forEach var="list" items="${listArticle}">
				<input value="${list.kor_name}" type="hidden">
				<input value="${list.jumin_no}" type="hidden" >
				<input value="${list.sex}" type="hidden">
				<input value="${list.join_st}" type="hidden" >
				<input value="${list.enable}" type="hidden">
			<tr>
				<td><input type="checkbox" name="user_no" value="${list.user_no}" id="checkbox1"></td>
				<td>${list.kor_name}</td>
				<td>${list.jumin_no}</td>
				<c:if test="${list.sex==1}">
				<td>남자</td>
				</c:if>
				<c:if test="${list.sex ==0}">
				<td>여자</td>
				</c:if>
				<td>${list.tech_grd}</td>
				<c:if test="${list.join_st==0}">
				<td>정규직</td>
				</c:if>
				<c:if test="${list.join_st==1}">
				<td>계약직</td>
				</c:if>
				<c:if test="${list.enable ==0}">
				<td>근무</td>
				</c:if>
				<c:if test="${list.enable ==1}">
				<td>퇴사</td>
				</c:if>
				
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			</c:forEach>
		</table>
		</form>
		<div class="main_paging">
			<a href="#"><img alt="prev_more" src="/resources/image/prev.gif"></a>
			<a href="#"><img alt="prev" src="/resources/image/pre.gif"></a>
			&nbsp; 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 &nbsp;
			<a href="#"><img alt="next" src="/resources/image/next.gif"></a>
			<a href="#"><img alt="next_more" src="/resources/image/next_.gif"></a>
		</div>
		<!-------------------------  리스트 ------------------------------>
		<div class="main_tab main_bottom">
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">수정</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">인사기록카드</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">경력정보</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">근무정보</a>
		</div>
	</div>
</div>
</body>
</html>
