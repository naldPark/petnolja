package com.petnolja.petsitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;
import com.petnolja.petsitter.model.vo.Reserv;

/**
 * Servlet implementation class ReserveVationController
 */
@WebServlet("/reserveVation.sit")
public class ReserveVationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveVationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		new PetsitterService().selectVation(userNo);
		
		ArrayList<Reserv> list = new PetsitterService().selectVation(userNo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/petsitter/reserveVation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
