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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 작업
		request.setCharacterEncoding("UTF-8");
		
		// 회원가입 요청시 전달값 뽑아서 변수 및 객체에 기록
		String userId = request.getParameter("userId"); // 아이디
		String userName = request.getParameter("userName"); // 이름
		String userPwd1 = request.getParameter("userPwd1"); // 비밀번호
		String phone = request.getParameter("phone"); // 전화번호
		String email = request.getParameter("email"); // 이메일
		String address = request.getParameter("address"); // 주소
		String address2 = request.getParameter("address2"); // 상세주소
		// double latitude =
		double latitude = Double.parseDouble(request.getParameter("latitude")); // 위도
		// double longtitude = 	
		double longtitude = Double.parseDouble(request.getParameter("longtitude")); // 경도
//			double latitude= 2.3333333;
//			double longtitude= 3.2222;
			
		// 기본생성자로 생성 후 setter 이용해서 담기
		Member m = new Member(userId, userName, userPwd1, phone, email, address, address2, latitude, longtitude);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원가입이 됐습니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}else {
			
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			
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
