package com.petnolja.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.petnolja.admin.model.vo.Admin;
import com.petnolja.common.Attachment;
import com.petnolja.common.MyFileRenamePolicy;
import com.petnolja.notice.model.service.NoticeService;
import com.petnolja.notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeUpdateController
 */
@WebServlet("/nupdate.ad")
public class AdminNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/notice_upfiles/");
			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int nNo = Integer.parseInt(mr.getParameter("nno"));
			String title = mr.getParameter("title");
			String category = mr.getParameter("category");
			String content = mr.getParameter("content");

			// 수정한사람 = 현재 로그인 중인 관리자 계정으로 작성자 변경
			Admin admin = (Admin)request.getSession().getAttribute("loginAdmin");
			String newWriter = String.valueOf(admin.getAdminNo());
			
			Notice n = new Notice(nNo, newWriter, category, title, content);
			
			Attachment at = null;
			if(mr.getOriginalFileName("reUpfile") != null) { // 새 첨부파일 있을 때
				at = new Attachment();
				at.setOriginName(mr.getOriginalFileName("reUpfile"));
				at.setChangeName(mr.getFilesystemName("reUpfile"));
				at.setFilePath("resources/upfiles/notice_upfiles/");
				
				if(mr.getParameter("originFileNo") != null) { // 기존 첨부파일 있을 때
					at.setFileNo(Integer.parseInt(mr.getParameter("originFileNo")));
					new File(savePath + mr.getParameter("originFileName")).delete();
				} else { // 기존첨부파일 없을 때
					at.setAtNo(nNo);
				}
			}
			
			// 새 첨부파일 없으면 바로 여기로!
			int result = new NoticeService().updateNotice(n, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsgAd", "공지사항이 정상적으로 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/nselect.ad?nno=" + nNo);
			} else {
				request.getSession().setAttribute("alertMsgAd", "공지사항 수정에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/nselect.ad?nno=" + nNo);
				
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
