package com.petnolja.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.common.Attachment;
import com.petnolja.notice.model.service.NoticeService;
import com.petnolja.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeUpdatePageController
 */
@WebServlet("/nselect.ad")
public class AdminNoticeSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pno = Integer.parseInt(request.getParameter("pno"));
		int nNo = Integer.parseInt(request.getParameter("nno"));
		
		Notice n = new NoticeService().selectNotice(nNo);
		Attachment at = new NoticeService().selectAttachment(nNo);
		
		request.setAttribute("pno", pno);
		request.setAttribute("n", n);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/admin/noticeUpdatePageView.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
