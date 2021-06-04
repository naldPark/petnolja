package com.petnolja.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.admin.model.vo.Admin;
import com.petnolja.qna.model.service.QnaService;
import com.petnolja.qna.model.vo.Qna;

/**
 * Servlet implementation class AjaxAdminQnaAnswerController
 */
@WebServlet("/answer.ad")
public class AjaxAdminQnaAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminQnaAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Admin loginAdmin = (Admin)request.getSession().getAttribute("loginAdmin");
		
		if(loginAdmin == null) {
			
			request/*.getSession()*/.setAttribute("errorMsg", "접근이 불가능합니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		} else {
			request.setCharacterEncoding("UTF-8");
			
			String answer = request.getParameter("answer");
			int qno = Integer.parseInt(request.getParameter("qno"));
			
			int aWriter = ((Admin)request.getSession().getAttribute("loginAdmin")).getAdminNo();
			
			Qna q = new Qna();
			q.setQnaNo(qno);
			q.setaContent(answer);
			q.setaWriter(String.valueOf(aWriter));
			
			int result = new QnaService().updateAnswer(q);
			
			response.getWriter().print(result);
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
