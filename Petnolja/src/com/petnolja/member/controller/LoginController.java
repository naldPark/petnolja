package com.petnolja.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.service.MemberService;
import com.petnolja.member.model.vo.Member;


@WebServlet("/login.mem")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	/**
	 * @nald 로그인 창입니다
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		if(loginUser ==null) {
			request.getSession().setAttribute("alertMsg", "일치하는 계정/비밀번호가 없습니다");
			response.sendRedirect(request.getContextPath());
		}else if(loginUser.getMemBlock().equals("Y")){
			request.setAttribute("errorMsg", "아이디가 잠겨있는 상태입니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}else {
			request.getSession().setAttribute("loginUser", loginUser);
			request.getSession().setAttribute("alertMsg", loginUser.getMemName()+"님 환영합니다");
			response.sendRedirect(request.getContextPath());
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
