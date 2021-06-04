package com.petnolja.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.board.model.service.ReportService;
import com.petnolja.board.model.vo.Report;
import com.petnolja.common.Attachment;
import com.petnolja.notice.model.service.NoticeService;
import com.petnolja.notice.model.vo.Notice;

/**
 * Servlet implementation class ReportDetailController
 */
@WebServlet("/reportdetail.ad")
public class ReportDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		Report r = new ReportService().qnaReportDetail(rno);
		
		if(r != null) {}
		else
			r = new ReportService().revReportDetail(rno);
		
		request.setAttribute("pno", pno);
		request.setAttribute("r", r);
		
		request.getRequestDispatcher("views/admin/reportDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
