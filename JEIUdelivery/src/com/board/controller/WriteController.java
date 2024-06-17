package com.board.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.board.mvc.*;
import java.sql.Time;
import java.io.PrintWriter;


@WebServlet("/write.do")
public class WriteController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1 파라미터 받기
		request.setCharacterEncoding("UTF-8");
		
		String storeIDAndName = request.getParameter("storeIDAndName");
		String[] parts = storeIDAndName.split("_");
		int postStIndex = Integer.parseInt(parts[0]);
		String postStName = parts[1];
		String postTimStr = request.getParameter("timer");
		String postDel = request.getParameter("delivery");
		String postBank = request.getParameter("bankName");
		String postAcc = request.getParameter("account");
		String postDelTy = request.getParameter("delitype");
		String postMax = request.getParameter("maxPeople");
		String postId = request.getParameter("userId");
		String postAuthor = request.getParameter("userName");
		
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
		
		pDTO.setStoreName(postStName);
		pDTO.setStoreIndex(postStIndex);
        pDTO.setTimer(postTim);
        pDTO.setDelivery(postDel);
        pDTO.setBankName(postBank);
        pDTO.setAccount(postAcc);
        pDTO.setDelitype(postDelTy);
        pDTO.setMaxPeople(postMax);
        pDTO.setId(postId);
        pDTO.setName(postAuthor);

        PostDAO pDAO = new PostDAO(); 
        int indexNum = pDAO.WritePost(pDTO);
        
        response.sendRedirect("../JEIUdelivery/board/view.jsp?indexNum="+indexNum);
		
	}

}
