<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
  request.setCharacterEncoding("UTF-8");
%>    

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">




		
$(document).on("click", "#uesr_id", function(){
	  var uesr_id=$(this).val();
	  console.log(uesr_id)
	  $.ajax({
			type : 'get',
			url : 'removeUser.do',
			data : {
				userId : uesr_id
			},
			success : function(data) {
				console.log(data)
				if (1 == (data)) {
					alert("삭제완료");
					window.location.reload(true);
				} else {
					alert("다시확인해주세요");
				};
			 }
		});
	});
			
           
		
</script>

<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>

<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>회원번호</b></td>
      <td><b>회원아이디</b></td>
      <td><b>회원비밀번호</b></td>
      <td><b>회원이름</b></td>
      <td><b>회원성별</b></td>
      <td><b>회원전화번호</b></td>
      <td><b>회원주소</b></td>
      <td><b>회원이메일</b></td>
      <td><b>회원유형</b></td>
      <td><b>회원상태</b></td>
      <td><b>회원가입일자</b></td>
      <td><b>수정일자</b></td>
      <td><b>수정</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="user" items="${userList}" >     
   <tr align="center">
      <td>${user.userNum}</td>
      <td>${user.userId}</td>
      <td>${user.userPwd}</td>
      <td>${user.userName}</td>
      <td>${user.userSex}</td>
      <td>${user.userPhone}</td>
      <td>${user.userAddress}</td>
      <td>${user.userEmail}</td>
      <td>${user.userType}</td>
      <td>${user.userStatus}</td>
      <td>${user.userJoindate}</td>
      <td>${user.userModdate}</td>
      <td><a href="upDateUserList.do?userId=${user.userNum}"><button>수정</button></a></td>
      <td><button id="uesr_id" value="${user.userId}">삭제하기</button></td>
    </tr>
  </c:forEach>
</table>
<a  href="">회원가입</h1></a>
</body>
</html>
