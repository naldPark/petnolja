package com.petnolja.petsitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.admin.model.vo.Calculate;
import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class CalculateMoneyController
 */
@WebServlet("/callist.sit")
public class CalculateMoneyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateMoneyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		Calculate c = new PetsitterService().selectNowCal(memId);
		ArrayList<Calculate> list = null;
		
		String date = request.getParameter("date");
		if(date == null) {
			list = new PetsitterService().selectCalList(memId);
			//System.out.println(date);	// 2021-02
		} else {
			list = new PetsitterService().selectCalList(memId, date);
		}
		
		
		request.setAttribute("c", c);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/petsitter/calculateMoney.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
