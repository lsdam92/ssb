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
		// �ѱ��Է¸��� ��ũ��Ʈ
		$j("#userId").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $j(this).val();
				$j(this).val(v.replace(/[^a-z0-9]/gi,''));
			}
		});
		// �ѱ۸��Է� ��ũ��Ʈ
		$j("#userName").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $j(this).val();
				$j(this).val(v.replace(/[a-z0-9]/gi,''));
			}
		});
		// ���ڸ� �Է°���
		$j("#userPhone2").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $j(this).val();
				$j(this).val(v.replace(/[^0-9]/gi,''));
			}
		});
		$j("#userPhone3").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $j(this).val();
				$j(this).val(v.replace(/[^0-9]/gi,''));
			}
		});
		
		//PostNo �Է½�
		$j("#userAddr1").on("change keyup paste", function () {
		    var output;
		    var input = $j("#userAddr1").val();
		    input = input.replace(/[^0-9]/gi, '');
		    var area = input.substr(0, 3);
		    var pre = input.substr(3, 4);
		    if (area.length < 3) {
		        output = area;
		    } else if (area.length == 3 && pre.length < 4) {
		        output = area + "-" + pre;
		    }
		    console.log(output);
		    $j("#userAddr1").val(output);
		});
		

		$j("#join").on("click",function(){
			var $frm = $j('.memberJoin :input');
			var param = $frm.serialize();
			
			var phone2 = $j("#userPhone2").val();
			var phone3 = $j("#userPhone3").val();

			if($j("#userId").val().trim().length == 0){
				alert("id�� �Է����ּ���.");
				$j("#userId").focus();
			} else if($j("#userPw").val().trim().length == 0){
				alert("��й�ȣ�� �Է����ּ���.");
				$j("#userPw").focus();
			} else if($j("#passck").val().trim().length == 0){
				alert("��й�ȣ Ȯ�ζ��� �Է����ּ���.");
				$j("#passck").focus();
			} else if($j("#userName").val().trim().length == 0){
				alert("�̸��� �Է����ּ���.");
				$j("#userName").focus();
			} else if(phone2.trim().length == 0){
				alert("�ڵ�����ȣ�� �Է����ּ���.");
				$j("#userPhone2").focus();
			}else if(phone2.trim().length < 4){
				alert("�ڵ�����ȣ 4�ڸ��� �Է����ּ���.");
				$j("#userPhone2").focus();
			}else if(phone3.trim().length < 4){
				alert("�ڵ�����ȣ 4�ڸ��� �Է����ּ���.");
				$j("#userPhone3").focus();
			}else if(phone3.trim().length == 0) {
				alert("�ڵ�����ȣ�� �Է����ּ���.");
				$j("#userPhone3").focus();
			}else if(isNaN(phone2)) {
				alert("�ڵ�����ȣ�� ���ڸ� �Է°����մϴ�.");
				$j("#userPhone2").focus();
			}else if(isNaN(phone3)) {
				alert("�ڵ�����ȣ�� ���ڸ� �Է°����մϴ�.");
				$j("#userPhone3").focus();
			}else  if(idck==0){
	            alert('���̵� �ߺ�üũ�� ���ּ���');
	        }else  if($j("#userAddr1").val().trim().length <7){
	            alert('�����ȣ ���� xxx-xxx�� �����ּ���');
	        }else {
				$j.ajax({
				    url : "/board/joinAction.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
						alert("ȸ�����ԿϷ�");
						
						alert("�޼���:"+data.success);
						
						location.href = "/board/boardList.do?pageNo=1";
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("����");
				    }
				});
			}
		});
		
		$j("#userId").keyup(function () {
			idck = 0;
		});
		
		$j("#idck").click(function() {
	        
	        //userid �� param.
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
	                    alert("���̵� �����մϴ�. �ٸ� ���̵� �Է����ּ���.");
	                    
	                
	                } else if(userid == ''){
	                	
	                	 $j("#userId").focus();
	                	alert("���̵� �Է��ϼ���");
	                	
	                }else {
	                    $j("#userPw").focus();
	                    alert("��밡���� ���̵��Դϴ�.");
	                    //���̵� �ߺ����� ������  idck = 1 
	                    idck = 1;
	                    
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
	    });
		
		// password ���� - ����ǥ����
		// ����, Ư������, ������ ������6~12�ڸ� �̳��� ��й�ȣ�� ���
		var passtypecnt = 1;
		var passwordRule = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{6,11}$/;
		
		// password ���� üũ
		$j("#userPw").keyup(function(){
			var pass = $j(this).val();
			var passck = $j("#passck").val();
			
			if(pass.trim().length == 0){			
				$j("#passtypecheck").css('color', 'tomato');
				$j("#passtypecheck").text('*��й�ȣ�� �Է����ּ���.');
			} else if(!passwordRule.test(pass)){
				passtypecnt = 1;
				$j("#passtypecheck").css('color', 'tomato');
				$j("#passtypecheck").html('*��й�ȣ�� Ư������+����+���ڸ� ������ 6~12�ڸ��Դϴ�.');
			}else{
				passtypecnt = 0;
				$j("#passtypecheck").css('color', 'steelblue');
				$j("#passtypecheck").html('*��� ������ ��й�ȣ �Դϴ�.');
			}
		});
		
		var passsamecnt = 1;
		
		// passwordȮ�� ��ġ ����
		$j("#passck").keyup(function(){
			var pass = $j("#userPw").val();
			var passck = $j(this).val();
			
			if(passck.trim().length == 0){			
				$j("#passsamecheck").css('color', 'tomato');
				$j("#passsamecheck").text('*��й�ȣ�� �Է����ּ���.');
			}else if(pass != passck){
				passsamecnt = 1;
				$j("#passsamecheck").css('color', 'tomato');
				$j("#passsamecheck").text('*��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���.');
				return false;
			} else {
				passsamecnt = 0;
				$j("#passsamecheck").css('color', 'steelblue');
				$j("#passsamecheck").html('*��й�ȣ�� ��ġ�մϴ�.');			
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
						<input name="userId" type="text"  value="${memberVo.userId}" id="userId" maxlength="15">
						<input name="idck" type="button" value="�ߺ�Ȯ��" id="idck">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						PW
						</td>
						<td width="300">
						<input name="userPw" type="password" value="${memberVo.userPw}" id="userPw" maxlength="12"> 
						<div id="passtypecheck">��й�ȣ�� �Է��ϼ���.</div>
						</td>
					</tr>
					<tr>
						<td align="center">
						PW CHECK
						</td>
						<td>
						<input type="password" id="passck" maxlength="12">
						<div id="passsamecheck">*��й�ȣ�� �Է����ּ���.</div>
						</td>
					</tr>
					<tr>
						<td align="center">
						NAME
						</td>
						<td>
						<input name="userName" type="text"  value="${memberVo.userName}" id="userName" maxlength="4">
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
						- <input name="userPhone2" type="text" value="${memberVo.userPhone2}" style="width: 50px;" id="userPhone2"maxlength="4"> - 
							<input name="userPhone3" type="text" value="${memberVo.userPhone3}"style="width: 50px;" id="userPhone3" maxlength="4"> 
						</td>
					</tr>
					<tr>
						<td align="center">
						POSTNO
						</td>
						<td>
						<input name="userAddr1" type="text" value="${memberVo.userAddr1}" id="userAddr1" maxlength="7">
						</td>
					</tr>
					<tr>
						<td align="center">
						ADDRESS
						</td>
						<td>
						<input name="userAddr2" type="text"value="${memberVo.userAddr2}" maxlength="65">
						</td>
					</tr>
					<tr>
						<td align="center">
						COMPANY
						</td>
						<td>
						<input name="userCompany" type="text"  value="${memberVo.userCompany}" maxlength="30">
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