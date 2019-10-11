<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Untitled Document</title>
</head>

<frameset cols="180,*" frameborder="NO" border="0" framespacing="0">
  <frame src="${root}/left" name="leftFrame" scrolling="NO" noresize>
  <frame src="${root}/list" name="mainFrame">
</frameset>
<noframes><body>

</body></noframes>
</html>