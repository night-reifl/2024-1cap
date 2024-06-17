package com.board.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.board.mvc.*;
import java.sql.Time;
import java.io.PrintWriter;


@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		
		String postTimStr = request.getParameter("timer");
		String postDel = request.getParameter("delivery");
		String postBank = request.getParameter("bankName");
		String postAcc = request.getParameter("account");
		String postDelTy = request.getParameter("delitype");
		String postMax = request.getParameter("maxPeople");
		int indexNum = Integer.parseInt(request.getParameter("indexNum"));
		
		if (
	        postTimStr == null || postTimStr.trim().isEmpty() ||
	        postDel == null || postDel.trim().isEmpty() ||
	        postBank == null || postBank.trim().isEmpty() ||
	        postAcc == null || postAcc.trim().isEmpty() ||
	        postDelTy == null || postDelTy.trim().isEmpty() ||
	        postMax == null || postMax.trim().isEmpty()) {

			response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('입력 값이 올바르지 않습니다. 빈칸 모두 입력하세요.');</script>");
            out.println("<script>history.back();</script>");
            out.close();
	        return;
	    }
		
		Time postTim = Time.valueOf(postTimStr + ":00");
		
		PostDTO pDTO = new PostDTO();

        pDTO.setTimer(postTim);
        pDTO.setDelivery(postDel);
        pDTO.setBankName(postBank);
        pDTO.setAccount(postAcc);
        pDTO.setDelitype(postDelTy);
        pDTO.setMaxPeople(postMax);

        PostDAO pDAO = new PostDAO(); 
        pDAO.ModifyPost(pDTO, indexNum);
        
        response.sendRedirect("../JEIUdelivery/board/list.jsp");
	}

}
