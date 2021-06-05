package com.petnolja.memboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.petnolja.member.model.vo.Member;
import com.petnolja.memboard.model.service.MemBoardService;
import com.petnolja.qna.model.vo.Qna;

/**
 * Servlet implementation class MemNoticeController
 */
@WebServlet("/askToAdminDetail.mem")
public class AskToAdminDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskToAdminDetailController() {
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

		
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();	
			int qno = Integer.parseInt(request.getParameter("qno"));
			
			Qna q = new MemBoardService().askToAdminDetail(qno, userNo);
			
			request.setAttribute("q", q);
			request.getRequestDispatcher("views/memboard/askToAdminDetail.jsp").forward(request, response);
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
