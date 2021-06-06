package com.petnolja.sitter.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.sitter.model.service.SitterService;

/**
 * Servlet implementation class reserveListcontroller
 */
@WebServlet("/reserveList.sit")
public class ReserveListcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveListcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		request.setCharacterEncoding("UTF-8");
		if(m == null) {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());	
		} else if(m.getAuthSitter()==null||!m.getAuthSitter().equals("Y")){
			request.getSession().setAttribute("alertMsg", "권한이 없습니다");
			response.sendRedirect(request.getContextPath());
		} else { 
			
			int[] count = new SitterService().selectReserveList(m.getMemNo());
			
			request.setAttribute("count", count);
			request.getRequestDispatcher("views/petsitter/reserve.jsp").forward(request, response);
		
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
