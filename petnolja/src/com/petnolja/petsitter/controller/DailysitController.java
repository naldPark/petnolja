package com.petnolja.petsitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.pet.model.vo.Log;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class dailysitController
 */
@WebServlet("/dailysit.sit")
public class DailysitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailysitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		new PetsitterService().selectDaily(userNo);
		
		ArrayList<Log> list = new PetsitterService().selectDaily(userNo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/petsitter/serviceDailySit.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
