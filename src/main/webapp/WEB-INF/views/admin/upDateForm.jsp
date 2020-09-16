<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>회원가입</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">

    
    </script>


</head>
<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>회원가입</h2>
    <form action="upDate.do" method="post"> 
        <table class="table table-boardered">
        <c:forEach var="user" items="${upDateUser}" > 
         	<tr>
                <th>회원번호</th>
                <td><input type="text" class="form-control" name="userId" placeholder="${user.userNum}" disabled ></td>        
            </tr>
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" value="${user.userId}" name="userId" readonly></td>        
            </tr>
            <tr>
                <th>패스워드</th>
                <td><input type="password" class="pwd1" value="${user.userPwd}" name="userPwd" disabled></td>      
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" name="userName" value="${user.userName}"></td>      
            </tr>

            <tr>
                <th>이메일</th>
                <td><input type="text" class="form-control" name="userEmail"  value="${user.userEmail}"></td>       
            </tr>

            <tr>
                <th>주소</th>
                <td><input type="text" class="form-control" name="userAddress" value="${user.userAddress}"></td>       
            </tr>
             
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" name="userPhone" value="${user.userPhone}"></td>       
            </tr>
             <tr>
                <th>가입일자</th>
                <td><input type="text" class="form-control" name="userJoindate" value="${user.userJoindate}" disabled></td>       
            </tr>
            <tr>
                <th>수정일자</th>
                <td><input type="text" class="form-control" name="userModdate" value="${user.userModdate}" disabled></td>       
            </tr>
         
            <tr>
                <th>성별</th>
                <td>
                <input type="radio"  name="userSex" value="10">남성 &nbsp;&nbsp;
                <input type="radio"  name="userSex" value="20">여성 &nbsp;&nbsp;
                </td>
            </tr> 
            <tr>
            	<th>회원상태</th>
                <td>
                <input type="radio"  name="userStatus" value="10">휴먼 &nbsp;&nbsp;
                <input type="radio"  name="userStatus" value="20">활동중 &nbsp;&nbsp;
                </td>          
             </tr> 
             </c:forEach>
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="수정"> 
                </td>
            </tr>
        </table>
   </form> 
    </div>
    </div>
    </div>
</div>
</body>
</html>