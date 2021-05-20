package com.petnolja.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.service.MemberService;
import com.petnolja.member.model.vo.Member;

/**
 * Servlet implementation class FindeIdController
 */
@WebServlet("/findId.mem")
public class FindeIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindeIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("뭐왔냐 ?");
		Member m = new Member();

		m.setMemName(request.getParameter("userName"));
		m.setMemEmail(request.getParameter("userEmail"));
		m.setMemTel(request.getParameter("userPhone"));
		
		String findId = new MemberService().findId(m);
		if(findId==null) {
			request.getSession().setAttribute("alertMsg", "입력한 내용이 일치하지 않습니다");
			response.sendRedirect(request.getContextPath());
		} else {
			request.getSession().setAttribute("alertMsg", "회원님의 아이디는 "+findId+" 입니다");
			response.sendRedirect(request.getContextPath());
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
