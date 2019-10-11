<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="/WEB-INF/views/page4.jsp" %>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${root}/css/reset.min.css" rel="stylesheet" type="text/css">
	<link href="${root}/css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>Untitled Document</title>
</head>
<body>
<div class="box_left">
	<div class="left_top"></div>
	<div class="left_cont">
		<ul class="left_menu">
			<li><img alt="icon" src="/resources/image/left_icon.gif"> 기본정보
				<ul>
					<li><a href="#myModal" data-toggle="modal" id="mybtn">- 등록</a></li>
				</ul>
			</li>
			<li><img alt="icon" src="/resources/image/left_icon.gif"> 직원명부</li>
			<li><img alt="icon" src="/resources/image/left_icon.gif"> 퇴직자현황</li>
			<li><img alt="icon" src="/resources/image/left_icon.gif"> 예비인력정보</li>
			<li><img alt="icon" src="/resources/image/left_icon.gif"> 거래처정보
				<ul>
					<li>- 등록</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="left_bottom"></div>
	<div class="left_search">
		<label class="left_label"><img alt="icon" src="/resources/image/left_icon.gif"> 경력검색</label>
		<input name="textfield" type="text" class="left_flat" size="9" maxlength="14"> 
		<a href="#"><img alt="search" src="/resources/image/search.gif"></a>
	</div>
</div>
</body>
</html>
