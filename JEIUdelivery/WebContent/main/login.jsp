<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login Page</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="./css/default.css"/>
        <link rel="stylesheet" type="text/css" href="./css/login.css"/>
    </head>
    
	<body>
<%
    String lo = (String)session.getAttribute("loginCheck");
	String userNames = (String) session.getAttribute("userName");
    if(lo != null) {
%>
<%= userNames %>님, 환영합니다.
<% } %>
    <jsp:include page="../templates/header.jsp" flush="false" />
            <section class="container-fluid justify-content-center bg-light" id="main-container">
            <form class="container" id="login-form" action="../Login.do" method="post">
                <div class="row">
                    <div class="col-md-12 mb-1">
                        <input type="text" class="form-control" id="id" name = "userID"placeholder="아이디 입력" required/>                    
                    </div>
    
                    <div class="col-md-12 mb-1">
                        <input type="password" class="form-control" id="pw" name="userPW"placeholder="비밀번호 입력" required>
                    </div>
    
                    <button class="btn btn-outline-primary btn-lg" type="submit" id="btn-login">로그인</button>

                </div>
            </form>
            
        </section>
		
		<footer>
		
		</footer>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>