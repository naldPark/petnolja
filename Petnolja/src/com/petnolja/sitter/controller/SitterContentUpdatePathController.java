package com.petnolja.sitter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.sitter.model.service.SitterService;

/**
 * Servlet implementation class SitterContentEnrollPathController
 */
@WebServlet("/updatePath.sitn")
public class SitterContentUpdatePathController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterContentUpdatePathController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());

		} else { 
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
			Petsitter info= new SitterService().selectSitterContent(userNo);

			String[] pics= new SitterService().selectSitterPics(userNo);
			request.setAttribute("info", info);
			request.setAttribute("pics", pics);
			request.getRequestDispatcher("views/petsitter/sitterContentUpdateForm.jsp").forward(request, response);
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
