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
 * Servlet implementation class selectQnaController
 */
@WebServlet("/selectQna.sit")
public class selectQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectQnaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		String qCtrateDate = request.getParameter("qCtrateDate");
		String aWriter = request.getParameter("aWriter");
		
		int result = new PetsitterService().selectQna(userNo, qnaNo, qTitle, qContent, qCtrateDate, aWriter);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg","조회 완료되었습니다.");
			response.sendRedirect(request.getContextPath());
		
	}else {
		request.setAttribute("errorMsg", "펫시터서비스 중지가 실패하였습니다.");
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
