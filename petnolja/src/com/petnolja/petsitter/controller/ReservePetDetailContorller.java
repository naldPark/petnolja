package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.pet.model.vo.Pet;
import com.petnolja.petsitter.model.service.PetsitterService;
import com.petnolja.petsitter.model.vo.Detail;

/**
 * Servlet implementation class ReservePetDetailContorller
 */
@WebServlet("/reservepet.sit")
public class ReservePetDetailContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservePetDetailContorller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());	
		}else { 
			int petNo = Integer.parseInt(request.getParameter("pno"));
			Pet pr =  new PetsitterService().selectPetDetail(petNo);
			
			request.setAttribute("inpo", pr);
		
		request.getRequestDispatcher("views/petsitter/reservePetDetail.jsp").forward(request, response);
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
