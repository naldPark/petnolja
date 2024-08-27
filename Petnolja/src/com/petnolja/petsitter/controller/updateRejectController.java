package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class updateRejectController
 */
@WebServlet("/updateReject.sit")
public class updateRejectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateRejectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		int resNo = Integer.parseInt(request.getParameter("resNo")); 
		String resStat = request.getParameter("resStat");
		String cancelRea = request.getParameter("cancelRea");
		
		int result = new PetsitterService().updateReject(userNo, resNo, resStat, cancelRea);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg","거절했다.");
			response.sendRedirect(request.getContextPath());
		
	}else {
		request.setAttribute("errorMsg", "거절을 실패했다.");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
