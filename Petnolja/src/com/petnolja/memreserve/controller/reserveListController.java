package com.petnolja.memreserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.memreserve.service.MemReserveService;
import com.petnolja.memreserve.vo.MemReserve;

/**
 * Servlet implementation class reserveListController
 */
@WebServlet("/reserveList.mem")
public class ReserveListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser= (Member)request.getSession().getAttribute("loginUser");
		ArrayList<MemReserve> reserveList = new MemReserveService().reserveList(loginUser.getMemNo());
		request.setAttribute("reserveList", reserveList);
		request.getRequestDispatcher("views/memreserve/reserveList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
