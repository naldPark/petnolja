package com.petnolja.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petnolja.member.model.service.MemberService;
import com.petnolja.member.model.vo.Member;

/**
 * Servlet implementation class MemberLeaveController
 */
@WebServlet("/leave2.me")
public class MemberLeaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLeaveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String memId = ((Member) session.getAttribute("loginUser")).getMemId();
		String memPwd = ((Member) session.getAttribute("loginUser")).getMemPwd();
		String checkbox = "";
		
		if(request.getParameterValues("check")!=null) {
			checkbox = String.join(",", request.getParameterValues("check"));
		}
		int result = new MemberService().leaveMember(checkbox, memId, memPwd);
		
		if(result > 0) {
			
			session.removeAttribute("loginUser");
			
			request.getRequestDispatcher("/views/member/memberCompleteForm.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "회원 탈퇴 실패");
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
