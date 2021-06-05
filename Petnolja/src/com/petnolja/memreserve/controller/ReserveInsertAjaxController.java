package com.petnolja.memreserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.petnolja.member.model.vo.Member;
import com.petnolja.memreserve.model.service.MemReserveService;

/**
 * Servlet implementation class ReserveInsertAjaxController
 */
@WebServlet("/reserveInsertAjax.mem")
public class ReserveInsertAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveInsertAjaxController() {
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
				request.setCharacterEncoding("UTF-8");
				int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
				String checkin = request.getParameter("checkin");
				String checkout = request.getParameter("checkout");
				String requestInput = request.getParameter("requestInput");
				int payNo = Integer.parseInt(request.getParameter("payNo"));
				String payMethod = request.getParameter("payMethod");
				int payAmount = Integer.parseInt(request.getParameter("payAmount"));
				String sittingNo = request.getParameter("sittingNo");
				String petNo = request.getParameter("pet");		
				
				int result = new MemReserveService().reserveInsertAjax(userNo, checkin, checkout, requestInput, payNo, payMethod, payAmount, sittingNo, petNo);
				
				
				String resultmsg="";
				if(result > 0) {
				resultmsg="성공적으로 완료되었습니다";
				} else { 
					resultmsg="오류가 발생했습니다";
			    }
				
				response.setContentType("application/json; charset=utf-8");
				new Gson().toJson(resultmsg, response.getWriter());
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
