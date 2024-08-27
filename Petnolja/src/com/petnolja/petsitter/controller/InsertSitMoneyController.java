package com.petnolja.petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class InsertSitMoneyController
 */
@WebServlet("/insertSitMoney.sit")
public class InsertSitMoneyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSitMoneyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //항상 그냥 넣으세요.  한글을 서블릿에 post방식으로 보낼때 안깨지는게 쓰는건데
		//로그인한사람의 회원번호(mem_no)이자 시터번호(sitter_no)
		int sitterNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); 
		
		//String bakSmall = request.getParameter("bakSmall");
		//스트링 타입이 아니면 꼭 앞에 저런거(parse) 해야함
		int bakSmall = Integer.parseInt(request.getParameter("bakSmall"));
		int daySmall = Integer.parseInt(request.getParameter("daySmall"));
		
		int bakMid = Integer.parseInt(request.getParameter("bakMid"));
		int dayMid = Integer.parseInt(request.getParameter("dayMid"));
		
		int bakBig = Integer.parseInt(request.getParameter("bakBig"));
		int dayBig = Integer.parseInt(request.getParameter("dayBig"));
		
		int result = new PetsitterService().insertSitterMoney(sitterNo, bakSmall, daySmall, bakMid, dayMid, bakBig, dayBig);
		// 서비스로 jsp에서 받은 값을 넘긴다
		
		//=============================================돌아왔음====================
		
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "입력이 완료되었습니다");
			//알림메세지는 이렇게 띄운다

			request.getRequestDispatcher("/options.sit").forward(request, response);
			
		} else { //실패하면 항상 이거 
			request.setAttribute("errorMsg", "에러발생");
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
