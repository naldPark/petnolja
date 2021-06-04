package com.petnolja.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.board.model.service.ReportService;

/**
 * Servlet implementation class DeleteTheReportController
 */
@WebServlet("/deletethereport.ad")
public class DeleteTheReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTheReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rno = request.getParameter("rno");
		
		String[] rnoArr = rno.split(",");
		
		int result = new ReportService().deleteQnaReport(rnoArr) + new ReportService().deleteRevReport(rnoArr);
		
		if(result>0) {
			int r = new ReportService().deleteListDone(rnoArr);
			request.getSession().setAttribute("alertMsgAd", "성공적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/reportlist.ad?currentPage=1");
		} else {
			request.getSession().setAttribute("alertMsgAd", "게시물 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/reportlist.ad?currentPage=1");

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
