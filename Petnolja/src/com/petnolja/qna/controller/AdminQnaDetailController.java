package com.petnolja.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.common.Attachment;
import com.petnolja.qna.model.service.QnaService;
import com.petnolja.qna.model.vo.Qna;

/**
 * Servlet implementation class AdminQnaDetailController
 */
@WebServlet("/qdetail.ad")
public class AdminQnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		int pno = Integer.parseInt(request.getParameter("pno"));

		
		Qna q = new QnaService().selectQna(qno);
		Attachment at = new QnaService().selectAttachment(qno);
		
		request.setAttribute("pno", pno);
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		request.getRequestDispatcher("views/admin/qnaAnswerView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
