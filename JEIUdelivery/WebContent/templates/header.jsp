<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/default.css"/>
</head>
<body>
	<div class="container-fluid" id="heading">
            <h1 class="display-1 text-center">JEIU DELIVERY</h1>
    </div>

    <header class="sticky-top">
        <div class="container-fluid" id="header">
            <nav class="navbar navbar-expand-md navbar-dark" id="h-nav">
                <div class="container">

                    <a class="navbar-brand" href="../main/index.jsp" >JEIU</a>
                    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarScroll">
                        <span class="navbar-toggler-icon"></span>
                    </button>
    
                    <div class="collapse navbar-collapse" id="navbarScroll">
                        <div class="navbar-nav">
                            <a class="nav-item nav-link" href="../main/about.jsp">About</a>
                            <a class="nav-item nav-link" href="../board/list.jsp">Board</a>
                        
                        <%
    String loginCheck = (String) session.getAttribute("loginCheck");
    if (loginCheck != null) {
%>
                        <a class="nav-item nav-link" href="../board/order.jsp">주문서</a>
                        <a class="nav-item nav-link" href="../board/payment.jsp">결제하기</a>
                        </div>
						<div class="navbar-nav" style="margin-left : auto">
                            <a class="nav-item nav-link" href="../main/logout.jsp">Logout</a>

                        </div>
<%
    } else {
%>      
						</div>
						<div class="navbar-nav" style="margin-left : auto">
                            <a class="nav-item nav-link" href="../main/login.jsp">Login</a>
                            <a class="nav-item nav-link" href="../main/join.jsp">Join</a>
                        </div>
                        
<%
    }
%>                   
                </div>
            </nav>
        </div>
    </header>
</body>
</html>