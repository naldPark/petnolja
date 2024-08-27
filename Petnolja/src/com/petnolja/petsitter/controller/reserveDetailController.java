package com.petnolja.petsitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.memreserve.model.service.MemReserveService;
import com.petnolja.memreserve.model.vo.MemReserve;
import com.petnolja.pet.model.vo.Pet;
import com.petnolja.petsitter.model.dao.PetsitterDao;
import com.petnolja.petsitter.model.service.PetsitterService;
import com.petnolja.petsitter.model.vo.Detail;

/**
 * Servlet implementation class reserveDetailController
 */
@WebServlet("/reserveDetail.sit")
public class reserveDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reserveDetailController() {
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
			long resNo = Long.parseLong(request.getParameter("rno"));
			Detail mr =  new PetsitterService().selectDetail(resNo);
			
			request.setAttribute("info", mr);
		
		request.getRequestDispatcher("views/petsitter/reserveDetail.jsp").forward(request, response);
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
