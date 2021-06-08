package com.petnolja.petsitter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;
import com.petnolja.petsitter.model.vo.Account;

/**
 * Servlet implementation class AddAccountController
 */
@WebServlet("/addAcc.sit")
public class AddAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String accBank = request.getParameter("accBank");
		String accNum = request.getParameter("accNum");
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();

		Account a = new Account();
		a.setAccBank(accBank);
		a.setAccNumber(accNum);
		a.setSitterNo(memNo);
		
		int result = new PetsitterService().insertAccount(a);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "신규 계좌 등록에 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/calacc.sit");
			
		} else {
			request.setAttribute("errorMsg", "신규 계좌 등록에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
