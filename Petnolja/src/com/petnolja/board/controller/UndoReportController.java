package com.petnolja.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.board.model.service.ReportService;
import com.petnolja.member.model.service.MemberService;

/**
 * Servlet implementation class UndoReportController
 */
@WebServlet("/undoreport.ad")
public class UndoReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UndoReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");

		String rNoList = request.getParameter("rNoList");
		String[] list = rNoList.split(",");
		
		int result = new ReportService().undoQnaReport(list) + new ReportService().undoRevReport(list);
		
		if(result == list.length) {
			int dresult = new ReportService().undoListDone(list);
		}
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
