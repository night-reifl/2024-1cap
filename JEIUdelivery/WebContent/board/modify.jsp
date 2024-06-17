<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.lang.ClassNotFoundException"%>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page import= "java.util.Date" %>
<%@page import= "java.util.List" %>
<%@page import= "java.util.ArrayList" %>
<%@page import= "com.board.mvc.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/modify.css">
</head>
<body>
 <jsp:include page="../templates/header.jsp" flush="false" />
	
<%
	request.setCharacterEncoding("UTF-8");
    int indexNum = Integer.parseInt(request.getParameter("indexNum"));

    PostDAO pDAO = new PostDAO();
    PostDTO pDTO = new PostDTO();
    pDTO = pDAO.ViewPost(indexNum);

    String storeName = pDTO.getStoreName();
    String delivery = pDTO.getDelivery();
    String bankName = pDTO.getBankName();
    String account = pDTO.getAccount();
    String delitype = pDTO.getDelitype();
    String maxPeople = pDTO.getMaxPeople();

    Timestamp timestamp = pDTO.getDate();
    String timestampString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);

    Time timer = pDTO.getTimer();
    String timerString = new SimpleDateFormat("HH:mm:ss").format(timer);
%>
    <form action="../modify.do" method="post" class="form2">
        <input type="hidden" name="indexNum" value="<%= indexNum %>">
        <div class="store-name"> <%= storeName %> </div>
        <div class="closing-time"> 마감시간 <input type="time" name="timer" class="menu-select"></div>
        <div class="delivery-fee"> 배달비 <input type="text" name="delivery" value="<%= delivery %>" class="menu-select"></div>
        <div class="bank-name"> 은행 <input type="text" name="bankName" value="<%= bankName %>" class="menu-select"> </div>
        <div class="account-number"> 계좌번호 
            <input type="text" name="account" maxlength="16" value="<%= account %>" class="menu-select">
        </div>
        <div class="delivery-type"> 배달종류
            <input type="radio" name="delitype" value="한집배달" <%= "checked".equals(delitype) ? "checked" : "" %>>한집배달
            <input type="radio" name="delitype" value="일반배달" <%= "checked".equals(delitype) ? "checked" : "" %>>일반배달
        </div>
        <div class="max-people"> 최대인원 
            <select name="maxPeople" class="menu-select">
                <option value="none" <%= "none".equals(maxPeople) ? "selected" : "" %>></option>
                <option value="1" <%= "1".equals(maxPeople) ? "selected" : "" %>>1</option>
                <option value="2" <%= "2".equals(maxPeople) ? "selected" : "" %>>2</option>
                <option value="3" <%= "3".equals(maxPeople) ? "selected" : "" %>>3</option>
            </select>
        </div>
        <button type="submit" class="comment-submit">수정하기</button>
    </form>

</body>
</html>
