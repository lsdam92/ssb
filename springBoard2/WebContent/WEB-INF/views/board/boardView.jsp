<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#delete").on("click",function(){
			var $frm = $j('.boardUpdate :input');
			var param = $frm.serialize();
			
			alert(param);
			
			$j.ajax({
			    url : "/board/boardDelete.do",
			    dataType: "json",
			    type: "GET",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("삭제완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	

</script>
<form action="" class="boardUpdate">
<body>
	<table align="center">
		<tr>
			<td>
				<table border ="1">
					<tr>
						<td width="120" align="center">
						Number
						</td>
						<td width="400">
						<input name="boardNum" type="hidden" value="${board.boardNum}">
						${board.boardNum}
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
						<input name="boardType" type="hidden" value="${board.comCodeVo.codeId}">
						${board.comCodeVo.codeName}
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						${board.boardTitle}
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td>
						${board.boardComment}
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
				<a href="/board/${board.boardType}/${board.boardNum}/boardUpdate.do">Update</a>
				<a href="/board/boardDelete.do" id="delete">Delete</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>