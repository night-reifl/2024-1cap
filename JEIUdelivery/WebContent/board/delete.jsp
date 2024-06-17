<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import= "com.board.mvc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int indexNum = Integer.parseInt(request.getParameter("indexNum"));
	PostDAO pDAO = new PostDAO();
	pDAO.DeletePost(indexNum);

	response.sendRedirect("list.jsp");

%>
</body>
</html>