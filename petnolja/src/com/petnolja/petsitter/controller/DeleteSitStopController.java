package com.petnolja.petsitter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class deleteSitStopController
 */
@WebServlet("/deleteSitStop.sit")
public class DeleteSitStopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSitStopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		String stopradio = request.getParameter("stopRadio");
		String deReason = request.getParameter("deReason");
		
		int result = new PetsitterService().stopSitter(userNo, stopradio, deReason);
		
		if(result > 0) {
				request.getSession().setAttribute("alertMsg","펫시터 서비스가 종료됐습니다.");
				response.sendRedirect(request.getContextPath());
			
		}else {
			request.setAttribute("errorMsg", "펫시터서비스 중지가 실패하였습니다.");
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
