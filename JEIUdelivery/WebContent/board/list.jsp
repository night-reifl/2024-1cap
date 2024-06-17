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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/list.css">
    
    
</head>
<body>
<jsp:include page="../templates/header.jsp" flush="false" />
<div class='container'>

    <h3 class='title'>공동주문 게시판</h3>
	<div class="container1">
    <ul>
	<% 
		PostDAO pDAO = new PostDAO();
		int countPost = pDAO.CountPost();
     %>
    	<li>현재 <span class='span1'><%= countPost %>개의 글</span>이 주문을 진행중이에요.</li>
    	<li>게시글은 시간이 적게남은 순으로 표시됩니다.</li>
    </ul>
    
<%
    String loginCheck = (String) session.getAttribute("loginCheck");
    if (loginCheck != null) {
%>
    <a class='abtn1' href="write.jsp">주문 글 등록하기</a>						
<%
    } else {
%>      
	<div>글 등록은 로그인 후 이용가능합니다.</div>
<%
    }
%>  
	</div>
    
        
    <%
        List<PostDTO> pDTOList = new ArrayList<>();
 		pDTOList = pDAO.ListPost();
             
     %>
<div class="posts-container">
        <% for (PostDTO pDTO : pDTOList) { %>
            <div class="post-box">
                <div class="post-profile">
                    <span class="post-author"><%=pDTO.getName() %></span>
                </div>
                <div class="post-content">
                    <div class="post-title">　<%= pDTO.getStoreName() %></div>
                    <div class="post-info">
                        <span class="post-timer"><%= new SimpleDateFormat("HH:mm:ss").format(pDTO.getTimer()) %> 분까지 </span>
                    </div>
				    <div class="delivery-info">
				        <span class="post-type"><%= pDTO.getDelitype() %></span>
				        <span class="post-delivery">기본 배달료: <%= pDTO.getDelivery() %> 원</span>
				    </div>
<%
    if (loginCheck != null) {
%>
    <button class='abtn2' data-index="<%= pDTO.getIndexNum() %>">주문 신청하기</button>
<%
    } else {
%>      
	<div>주문 신청은 로그인 후 이용가능합니다.</div>
<%
    }
%>  
                </div>
            </div>
        <% } %>
   </div>


</div>
    <script src="../public/js/list.js"></script>
     <script src="../js/main.js"></script>
</body>
<!-- 모달 구조 -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="modal-body">여기에 내용이 로드됩니다.</p>
  </div>
</div>
</html>