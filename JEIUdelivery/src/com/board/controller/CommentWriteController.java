package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.mvc.*;


@WebServlet("/commentWrite.do")
public class CommentWriteController extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String menuNameAndPrice = request.getParameter("menuAndprice");
		String[] parts = menuNameAndPrice.split("_");
		String menuName = parts[0];
		int menuPrice = Integer.parseInt(parts[1]);
		int boardIndex = Integer.parseInt(request.getParameter("boardIndex"));
		String author = request.getParameter("author");
		String userId = request.getParameter("userId");
		
		
		CommentDTO cDTO = new CommentDTO();
		
		cDTO.setAuthor(author);
		cDTO.setBoardIndex(boardIndex);
		cDTO.setMenu(menuName);
		cDTO.setPrice(menuPrice);
		cDTO.setUserId(userId);
		
		CommentDAO cDAO = new CommentDAO();
		cDAO.WriteComment(cDTO);
		
		response.sendRedirect("../JEIUdelivery/board/view.jsp?indexNum="+boardIndex);
		
		
	
	}

}
