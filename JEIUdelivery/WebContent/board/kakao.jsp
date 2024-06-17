<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import= "com.board.mvc.*" %>
<%
	request.setCharacterEncoding("UTF-8");	
	CommentDAO cDAO = new CommentDAO();
	
	int index = Integer.parseInt(request.getParameter("index"));
	String name = (String)request.getParameter("name");
	String email = (String)request.getParameter("email");
	String phone = (String)request.getParameter("phone");
	String address = "��õ";
	String stotalPrice = (String)request.getParameter("totalPrice");
	int totalPrice = Integer.parseInt(stotalPrice);
	String product = (String)request.getParameter("product");
	
	System.out.println("name: "+name);
	System.out.println("email: "+email);
	System.out.println("phone: "+phone);
	System.out.println("address: "+address);
	System.out.println("stotalPrice: "+stotalPrice);
	System.out.println("totalPrice: "+totalPrice);
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

 <script>
 $(function(){
     var IMP = window.IMP; // ��������
     IMP.init('imp00866258'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
     var msg;
     
     IMP.request_pay({
         pg : 'kakaopay',
         pay_method : 'card',
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : 'KH Books ���� ����',
         amount : <%=totalPrice%>,
         buyer_email : '<%=email%>',
         buyer_name : '<%=name%>',
         buyer_tel : '<%=phone%>',
         buyer_addr : '<%=address%>',
         buyer_postcode : '123-456',
         //m_redirect_url : 'http://www.naver.com'
     }, function(rsp) {
         if ( rsp.success ) {
             //[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
             jQuery.ajax({
                 url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� �������ּ���
                 type: 'POST',
                 dataType: 'json',
                 data: {
                     imp_uid : rsp.imp_uid
                     //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                 }
             }).done(function(data) {
                 //[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                 if ( everythings_fine ) {
                     msg = '������ �Ϸ�Ǿ����ϴ�.';
                     msg += '\n����ID : ' + rsp.imp_uid;
                     msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                     msg += '\���� �ݾ� : ' + rsp.paid_amount;
                     msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
                     
                     alert(msg);
                 } else {
                     //[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                     //[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                 }
             });
             //������ �̵��� ������
     		<% 
     			cDAO.UpdatePayed(index);
     		%>
             location.href = "<%=request.getContextPath()%>/main/index.jsp";
             
         } else {
             msg = '������ �����Ͽ����ϴ�.';
             msg += '�������� : ' + rsp.error_msg;
             //���н� �̵��� ������
             location.href="<%=request.getContextPath()%>/main/index.jsp";
             alert(msg);
         }
     });
     
 });
    </script> 

    

    

</body>
</html>