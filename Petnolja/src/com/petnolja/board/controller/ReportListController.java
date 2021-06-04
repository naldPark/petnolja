package com.petnolja.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petnolja.board.model.service.ReportService;
import com.petnolja.board.model.vo.Report;
import com.petnolja.common.model.vo.PageInfo;

/**
 * Servlet implementation class ReviewReportListController
 */
@WebServlet("/reportlist.ad")
public class ReportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기존 펫시터 리스트 페이지 (oldPetsitterListView.jsp) 보여줌
		// 페이징
		int QNAListCount; 	// 현재 신고된 QNA 게시글 총 갯수 
		int RevListCount;	// 현재 신고된 리뷰 게시글 총 갯수
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇개 단위씩)
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수 (몇개 단위씩)
		
		int QmaxPage;		// QNA 가장 마지막 페이지 (총 페이지 수)
		int RmaxPage;		// Review 가장 마지막 페이지 (총 페이지 수)
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작수 
		int QendPage;		// 페이지 하단에 보여질 페이징바의 끝수
		int RendPage;
		
		QNAListCount = new ReportService().selectQNAListCount();
		RevListCount = new ReportService().selectRevListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		boardLimit = 10;
		
		QmaxPage = (int)Math.ceil((double)QNAListCount / boardLimit);
		RmaxPage = (int)Math.ceil((double)RevListCount / boardLimit);
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		QendPage = startPage + pageLimit - 1;
		RendPage = startPage + pageLimit - 1;
		
		if(QendPage > QmaxPage) {
			QendPage = QmaxPage;
		}
		
		if(RendPage > RmaxPage) {
			RendPage = RmaxPage;
		}
		
		PageInfo Qpi = new PageInfo(QNAListCount, currentPage, pageLimit, boardLimit, QmaxPage, startPage, QendPage);
		PageInfo Rpi = new PageInfo(RevListCount, currentPage, pageLimit, boardLimit, RmaxPage, startPage, RendPage);
		
		ArrayList<Report> Qlist = new ReportService().selectQNAList(Qpi);
		ArrayList<Report> Rlist = new ReportService().selectRevList(Rpi);
		
		//request.setAttribute("Qpi", Qpi);
		//request.setAttribute("Rpi", Rpi);
		request.setAttribute("Qlist", Qlist);
		request.setAttribute("Rlist", Rlist);
		
		request.getRequestDispatcher("views/admin/oldPetsitterListView.jsp").forward(request, response);			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
