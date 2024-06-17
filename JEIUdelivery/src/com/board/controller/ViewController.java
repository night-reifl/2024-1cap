package com.board.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.board.mvc.*;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int indexNum = Integer.parseInt(request.getParameter("indexNum"));
		
		PostDAO pDAO = new PostDAO();
		PostDTO pDTO = new PostDTO();
		
		pDTO = pDAO.ViewPost(indexNum);
		
		request.setAttribute("pDTO", pDTO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("view.jsp");
        dispatcher.forward(request, response);
	}

	


}
