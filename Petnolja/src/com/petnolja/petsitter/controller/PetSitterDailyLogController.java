package com.petnolja.petsitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterReviewService;
import com.petnolja.petsitter.model.vo.PetsitterReview;

/**
 * Servlet implementation class PetSitterDailyLogController
 */
@WebServlet("/PetSitterLog.me")
public class PetSitterDailyLogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetSitterDailyLogController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		}else {
		
		//int sitterNo = Integer.parseInt(request.getParameter("sitterNo"));
		int sitterNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		ArrayList<PetsitterReview> list = new PetsitterReviewService().selectReview(sitterNo); 
		
		request.setAttribute("sitterNo", sitterNo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/petsitter/PetsitterdailyLog.jsp").forward(request, response);
		
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
