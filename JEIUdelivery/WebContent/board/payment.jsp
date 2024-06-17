<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import= "com.board.mvc.*" %>
<%@page import= "java.util.Date" %>
<%@page import= "java.util.List" %>
<%@page import= "java.util.ArrayList" %>
<%@page import= "user.mvc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/payment.css">
</head>
<body>
 <jsp:include page="../templates/header.jsp" flush="false" />

<%
 	UserDTO uDTO = (UserDTO)session.getAttribute("UserDTO");
	String userId = uDTO.getUserID();
	String userName = uDTO.getUserFname() + " " + uDTO.getUserLname();
	PostDAO pDAO = new PostDAO();
	PostDTO pDTO = new PostDTO();
	
	CommentDAO cDAO = new CommentDAO();
	List<CommentDTO> cDTOList = new ArrayList<>();
	cDTOList = cDAO.GetComment(userId);
	
	int index=1;
%>

<div class="order-container">
<% for (CommentDTO cDTO : cDTOList) {
	pDTO = pDAO.ViewPost(cDTO.getBoardIndex());
%>
 <div class="order-item">
 <form action="kakao.jsp" method="post" class="order-form">
	<input type="hidden" name="name" value="<%= userName %>">
	<input type="hidden" name="email" value="<%= uDTO.getUserEmail() %>">
	<input type="hidden" name="phone" value="<%= uDTO.getUserTel() %>">
	<input type="hidden" name="totalPrice" value="<%= cDAO.GetPay(cDTO.getBoardIndex(), pDTO.getDelivery(), userId) %>">
	<input type="hidden" name="product" value="<%= cDTO.getMenu() %>">
	<input type="hidden" name="index" value="<%= cDTO.getIndex() %>">
	
	<div class="order-header">�ֹ����� <%= index %></div>

	<div class="order-store" align="left">���� : <%= cDTO.getStoreName() %></div>

	<div class="order-total" align="right">������ �� : <%= cDAO.GetPay(cDTO.getBoardIndex(), pDTO.getDelivery(), userId) %>��</div>

	<div class="order-menu">�޴� : <%= cDTO.getMenu() %></div>
	<button id="kakaoBtn" type="submit" class="order-button">�����ϱ�</button>				
</form>
</div>
<%
	index++;
}
%>
</div>
<hr>
</body>
</html>
