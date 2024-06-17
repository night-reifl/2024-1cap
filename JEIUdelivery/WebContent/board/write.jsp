<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "user.mvc.*" %>
<%@page import= "com.store.mvc.*" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/write.css">
</head>
<body>
<jsp:include page="../templates/header.jsp" flush="false" />
<%
	UserDTO uDTO = (UserDTO)session.getAttribute("UserDTO");
	String userId = uDTO.getUserID();
	String userName = uDTO.getUserFname() + " " + uDTO.getUserLname();
	System.out.println("1"+userName);
	
	StoreDAO sDAO = new StoreDAO();
    List<StoreDTO> storeList = sDAO.getStore();
%>
	<hr>
    <h3 class="post-title2">글 작성</h3>
    <form id="writeFrm" action="../write.do" method="post" class="form2">
    	<input type="hidden" name="userId" value="<%= userId %>">
    	<input type="hidden" name="userName" value="<%= userName %>">
    	
        <div class="store-name"> 가게
        <select name="storeIDAndName" class="menu-select">
            <% for (StoreDTO store : storeList) { %>
                <option value="<%= store.getIndexNum() %>_<%= store.getName() %>"><%= store.getName() %></option>
            <% } %>
        </select>
        </div>
        <div class="closing-time"> 마감시간 <input type="time" name="timer" class="menu-select"></div>
        <div class="delivery-fee"> 배달비 <input type="text" name="delivery" class="menu-select"></div>
        <div class="bank-name"> 은행 <input type="text" name="bankName" class="menu-select"> </div>
        <div class="account-number"> 계좌번호 
            <input type="text" name="account" maxlength="16" class="menu-select">
        </div>
        <div class="delivery-type"> 배달종류
            <input type="radio" name="delitype" value="한집배달">한집배달
            <input type="radio" name="delitype" value="일반배달">일반배달
        </div>
        <div class="max-people"> 최대인원 
            <select name="maxPeople" class="menu-select">
                <option value="none"></option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
        </div>
        <input type="submit" value="글작성" class="comment-submit">
    </form>
    
    <a href="list.jsp" class="back-link">뒤로가기</a>
    <script src="../js/write.js"></script>
</body>
</html>
