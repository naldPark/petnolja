package com.petnolja.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.service.MemberService;

/**
 * Servlet implementation class FindPwd2Controller
 */
@WebServlet("/findPwd4.mem")
public class FindPwd4Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwd4Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userPwd = request.getParameter("userPwd");
		String userId = request.getParameter("userId2");

		int result = new MemberService().findPwd2(userId,userPwd);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 수정됐습니다");
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("errorMsg", "문제가 발생했습니다");
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
