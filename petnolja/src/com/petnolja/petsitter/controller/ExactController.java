package com.petnolja.petsitter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.admin.model.vo.Calculate;
import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class exactController
 */
@WebServlet("/exact.sit")
public class ExactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExactController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		Calculate c = new PetsitterService().selectNowCal(memId);
		
		request.setAttribute("c", c);
		request.getRequestDispatcher("views/petsitter/calculate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
