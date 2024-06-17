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
<%@page import= "user.mvc.*" %>
<%@page import= "com.store.mvc.*" %>


<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/view.css">
</head>
<body>
    
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
    int maxPeople = Integer.parseInt(pDTO.getMaxPeople());
    String author = pDTO.getName();
    String id = pDTO.getId();
    int storeIndex = pDTO.getStoreIndex();

    Timestamp timestamp = pDTO.getDate();
    String timestampString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);

    Time timer = pDTO.getTimer();
    String timerString = new SimpleDateFormat("HH:mm:ss").format(timer);
%>

<h3 class="post-title2">게시글</h3>
<form id="viewFrm" method="get">
    <input type="hidden" name="indexNum" value="<%= indexNum %>">
    <div class="store-name">가게: <%= storeName %></div>
    <div class="closing-time">마감시간: <%= timerString %></div>
    <div class="delivery-fee">배달비: <%= delivery %></div>
    <div class="delivery-type">배달종류: <%= delitype %></div>
    <div class="max-people">최대인원: <%= maxPeople %></div>
<%
    UserDTO uDTO = (UserDTO)session.getAttribute("UserDTO");
    String userId = uDTO.getUserID();
    String userName = uDTO.getUserFname() + " " + uDTO.getUserLname();
    if (userId.equals(id)) {
%>
    <button id="modifyBtn" type="submit" formaction="modify.jsp">수정</button>	
    <button id="modifyBtn" type="submit" formaction="list.jsp">뒤로가기</button>						
    <button id="deleteBtn" type="submit" formaction="delete.jsp">삭제</button>
<%
    } else {
%>      
    <button id="modifyBtn" type="submit" formaction="list.jsp">뒤로가기</button>				
<%
    }
%>  
</form><hr>

<%
    CommentDAO cDAO = new CommentDAO();
    List<CommentDTO> cDTOList = new ArrayList<>();
    cDTOList = cDAO.ListComment(indexNum);
    int i = 0;
%>

<table class="comment-table">
    <tbody>
        <tr>
            <th colspan="2">댓글</th>
        </tr>
        <% for (CommentDTO cDTO : cDTOList) { %>
        <tr>
            <td class="comment-author" align="left"><%= cDTO.getAuthor() %></td>
        <% if (userId.equals(cDTO.getUserId())) { %>
            <td class="comment-delete" align="right"><a href="commentDelete.jsp?indexNum=<%= indexNum %>">삭제</a></td>
        <% } %>
        </tr>
        <tr>
            <td class="comment-content" align="left"><%= cDTO.getMenu() %>, <%= cDTO.getPrice() %></td>
        
            <td class="comment-date" align="right"><%= cDTO.getDate() %></td>
        </tr>
        <% i++; } %>
    </tbody>		
</table><br>

<%
    if (!userId.equals(id) && i < maxPeople) {
        MenuDAO mDAO = new MenuDAO();
        List<MenuDTO> menuList = mDAO.getMenu(storeIndex);
%>
    <form class='form2' method="post" action="../commentWrite.do">
        <table>
            <tbody>
                <tr>
                    <td>
                        <input type="hidden" name="author" value="<%= userName %>">
                        <input type="hidden" name="userId" value="<%= userId %>">
                        <input type="hidden" name="boardIndex" value="<%= indexNum %>">
                        <select name="menuAndprice" class="menu-select">
                        <% for (MenuDTO menus : menuList) { %>
                            <option value="<%= menus.getMenu() %>_<%= menus.getPrice() %>"><%= menus.getMenu() %> <%= menus.getPrice() %></option>
                        <% } %>
                        </select>									
                    </td>
                </tr>
            </tbody>
        </table>
        <input type="submit" value="댓글 쓰기" class="comment-submit">
    </form>
<%
    }
%>	
</body>
</html>
