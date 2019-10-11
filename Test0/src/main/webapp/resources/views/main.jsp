<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${root}/css/reset.min.css" rel="stylesheet" type="text/css">
	<link href="${root}/css/style.css" rel="stylesheet" type="text/css">
	<title>Untitled Document</title>
</head>
<body>
<div class="box_right">
	<div class="tit f_bold">
		<img alt="icon" src="/resources/image/icon.gif"> 사원조회
	</div>
	<div class="float_r main_search">
		<select name="select">
			<option selected>::::: 전체 :::::</option>
		</select> 
		<input name="textfield" type="text" class="input"> <a href="#"><img alt="search" src="/resources/image/search.gif"></a>
	</div>
	<div class="main_box clear_b">
		<div class="main_tab main_top">
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">수정</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">인사기록카드</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">경력정보</a> 
			<img alt="all_icon" src="/resources/image/all_icon.gif"> <a href="#">근무정보</a>
		</div>
		<!-------------------------  리스트 ------------------------------>
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
			<tr>
				<td><input type="checkbox" name="checkbox" value="checkbox"></td>
				<td>${list.kor_name}</td>
				<td>${list.jumin_no}</td>
				<td>${list.sex}</td>
				<td>${list.tech_grd}</td>
				<td>${list.join_st}</td>
				<td>${list.enable}</td>
			</tr>
			</c:forEach>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox2" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox3" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox4" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox5" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox6" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox7" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox8" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox9" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox10" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
		</table>
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
