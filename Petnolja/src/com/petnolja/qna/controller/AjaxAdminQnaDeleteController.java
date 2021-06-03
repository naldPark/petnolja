package com.petnolja.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.qna.model.service.QnaService;

/**
 * Servlet implementation class AjaxAdminQnaDeleteController
 */
@WebServlet("/qdelete.ad")
public class AjaxAdminQnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminQnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String qnoList = request.getParameter("qnoList");
		
		String[] list = qnoList.split(","); 
		
		int result = new QnaService().deleteQna(list);
		
		/*
		if(result == list.length) {
			request.getSession().setAttribute("alertMsgAd", "문의내역이 정상적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/qnalist.ad?currentPage=1");
			
		} else {
			request.getSession().setAttribute("alertMsgAd", "문의내역 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/qnalist.ad?currentPage=1");

		}
		*/
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
