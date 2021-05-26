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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update2.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
		String userPwd1 = request.getParameter("userPwd1"); // 비밀번호
		String phone = request.getParameter("phone"); // 전화번호
		String email = request.getParameter("email"); // 이메일
		String address = request.getParameter("address"); // 주소
		String address2 = request.getParameter("address2"); // 상세주소
		//double latitude = Double.parseDouble(request.getParameter("latitude")); // 위도
		//double longtitude = Double.parseDouble(request.getParameter("longtitude")); // 경도
		double latitude= 2.3333333;
		double longtitude= 3.2222;
		Member m = new Member(userNo, userPwd1, phone, email, address, address2, latitude, longtitude); 
		
		Member updateMem = new MemberService().updateMember(m);
		
		
		if(updateMem == null) {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/update.me");
			
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
