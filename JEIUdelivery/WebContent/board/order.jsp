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
<title>Order Page</title>
<link rel="stylesheet" type="text/css" href="../css/order.css">
</head>
<body>
 <jsp:include page="../templates/header.jsp" flush="false" />
 <%
    UserDTO uDTO = (UserDTO)session.getAttribute("UserDTO");
    String userId = uDTO.getUserID();
    
    CommentDAO cDAO = new CommentDAO();
    List<CommentDTO> cDTOList = new ArrayList<>();
    
    int index = 1;
    
    PostDAO pDAO = new PostDAO();
    List<PostDTO> pDTOList = new ArrayList<>();
    pDTOList = pDAO.ViewOrders(userId);
%>
 
 <div class="order-container">
    <% for (PostDTO pDTO : pDTOList) { 
        boolean payed = cDAO.Payed(pDTO.getIndexNum());
        
        if (!payed) {
            continue;
        }
        cDTOList = cDAO.ListComment(pDTO.getIndexNum());
    %>
    <div class="order-card">
        <div class="order-header">
            <h2>주문서 <%= index %></h2>
        </div>
        <div class="order-details">
            <p class="store-name">가게: <%= pDTO.getStoreName() %></p>
            <p class="amount-due">받아야할 돈: <%= cDAO.GetCost(pDTO.getIndexNum(), pDTO.getDelivery()) %>원</p>
        </div>
        <div class="order-items">
            <p>메뉴: 
                <% for (CommentDTO cDTO : cDTOList) { %>
                    <span class="menu-item"><%= cDTO.getMenu() %></span>
                <% } %>
            </p>
        </div>
        <div class="order-complete">
            <a href="delete.jsp?indexNum=<%= pDTO.getIndexNum() %>">완료</a>
        </div>
    </div>
    <% 
        index++;
    } %>
 </div>
 <hr>
 
</body>
</html>
