package com.petnolja.memreserve.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.memreserve.service.MemReserveService;

/**
 * Servlet implementation class ReserveProceedController
 */
@WebServlet("/reserveProceed.mem")
public class ReserveProceedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveProceedController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		int sitterNo = Integer.parseInt(request.getParameter("sitterNo"));
		String startDate = request.getParameter("reserveStart");
		String endDate = request.getParameter("reserveEnd");
		int[] petList = Arrays.asList(request.getParameterValues("petNo")).stream().mapToInt(Integer::parseInt).toArray();
		
		System.out.println("유저넘버"+userNo);
		System.out.println("시터넘버"+sitterNo);
		System.out.println("예약시작"+startDate);
		System.out.println("예약끝"+endDate);
		for (int i = 0; i < petList.length; i++) {

			System.out.println(petList[i]);
				
		}
		
		new MemReserveService().reserveProceed(userNo, sitterNo, startDate, endDate, petList);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
