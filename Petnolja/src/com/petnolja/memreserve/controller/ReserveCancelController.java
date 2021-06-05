package com.petnolja.memreserve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.memreserve.model.service.MemReserveService;

/**
 * Servlet implementation class ReserveCancelController
 */
@WebServlet("/cancelReserve.mem")
public class ReserveCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		}else { 
			long reserveNo = Long.parseLong(request.getParameter("reserveNo"));
			String cancelComment = request.getParameter("cancelComment");
			
			int result = new MemReserveService().cancelReserve(reserveNo, cancelComment);
			
			if(result > 0) { 
				
				request.getSession().setAttribute("alertMsg", "예약이 취소되었습니다");
				response.sendRedirect(request.getContextPath() + "/reserveList.mem");
			}else { 				
				
				request.setAttribute("errorMsg", "예약취소 중 에러가 발생 했습니다");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
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
