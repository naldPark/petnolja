package com.petnolja.memreserve.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.petnolja.common.Attachment;
import com.petnolja.common.MyFileRenamePolicy;
import com.petnolja.member.model.vo.Member;
import com.petnolja.memreserve.model.service.MemReserveService;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/reviewInsert.mem")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("resources/upfiles/review_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			long reserveNo = Long.parseLong(multiRequest.getParameter("reserveNo"));
			int starCount = Integer.parseInt(multiRequest.getParameter("starCount"));
			String comment = multiRequest.getParameter("comment");
			//첨부파일...
			Attachment at = null; 
			if(multiRequest.getOriginalFileName("rwFilename") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("rwFilename")); 
				at.setChangeName(multiRequest.getFilesystemName("rwFilename"));
				at.setFilePath("resources/upfiles/review_upfiles/");
			}
			
			int result = new MemReserveService().reviewInsert(reserveNo, starCount, comment, at);
			
			if(result > 0) { 
				
				request.getSession().setAttribute("alertMsg", "리뷰가 등록되었습니다");
				response.sendRedirect(request.getContextPath() + "/reserveList.mem");
			}else { 				
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "리뷰 작성에 에러가 발생 했습니다");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
	

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
