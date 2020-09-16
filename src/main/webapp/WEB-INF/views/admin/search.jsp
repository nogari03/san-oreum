<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>회원조회</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script type="text/javascript">
 	
 	
 	$(function msg(){ // 회원 수정 완료후 알림창
 		var upDate="<c:out value="${upDateMsg}" />";
 		console.log(upDate)
 		if(upDate==1){
 			alert("수정완료")
 		}
 	})
 	
 	</script>
   
</head>
<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>조회</h2>
    <form action="search.do" method="post">
        <select name="searchOption">
            <option value="userNum">전체검색</option>
            <option value="userName">이름</option>
            <option value="userId">아이디</option>
            <option value="userAddress">주소</option>
            <option value="UserEmail">email</option>
        </select>
        <input type="text" name="key_word" placeholder="조회내용을 입력하세요">
        <input type="submit" value="조회">
    </form>
    </div>
    </div>
    </div>
</div>

</body>
</html>