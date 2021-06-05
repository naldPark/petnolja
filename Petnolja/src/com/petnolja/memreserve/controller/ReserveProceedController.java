package com.petnolja.memreserve.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.petnolja.memreserve.model.service.MemReserveService;
import com.petnolja.memreserve.model.vo.ReserveContent;

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

		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		}else { 
			
		
			request.setCharacterEncoding("UTF-8");
			int sitterNo = Integer.parseInt(request.getParameter("sitterNo"));
			String startDate = request.getParameter("reserveStart");
			String endDate = request.getParameter("reserveEnd");
			String petList = String.join(",", request.getParameterValues("petNo"));
			
			// 당일/1박 위탁방식
			String careDay = "데이";
			if(!startDate.equals("endDate")) {careDay="1박";}
	
			// 몇박인지 확인
	        LocalDate dBefore = LocalDate.parse(startDate, DateTimeFormatter.ISO_LOCAL_DATE);
	        LocalDate dAfter = LocalDate.parse(endDate, DateTimeFormatter.ISO_LOCAL_DATE);
	        int countDay = (int) dBefore.until(dAfter,ChronoUnit.DAYS);
			
			ArrayList<ReserveContent> reserveList= new MemReserveService().reserveProceed(sitterNo, petList, careDay, startDate, endDate);
	
			request.setAttribute("countDay",countDay);
			request.setAttribute("reserveList", reserveList);
			request.getRequestDispatcher("views/memreserve/reserveProceed.jsp").forward(request, response);
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
