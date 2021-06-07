package com.petnolja.sitter.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
import com.petnolja.sitter.model.service.SitterService;

/**
 * Servlet implementation class SitterContentEnrollController
 */
@WebServlet("/contentEnroll.sitn")
public class SitterContentEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterContentEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		} else { 
			
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
			if(ServletFileUpload.isMultipartContent(request)) {
				
				int maxSize = 10 * 1024 * 1024;
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/sitter_upfiles/");
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	
				String title = multiRequest.getParameter("title");
				String selfInfo =  multiRequest.getParameter("selfIntro");
				
				ArrayList<Attachment> list = new ArrayList<>();
				Attachment at =null;
				
				for(int i=1; i<=4; i++) {
					String key = "file" + i;
					if(multiRequest.getOriginalFileName(key) != null) {
						at = new Attachment();
						at.setOriginName(multiRequest.getOriginalFileName(key));
						at.setChangeName(multiRequest.getFilesystemName(key));
						at.setFilePath("resources/upfiles/sitter_upfiles/");
						at.setFileLevel(i);					
						list.add(at);	
					}				
				}
				System.out.println("머선일");
				
				int result = new SitterService().sitterContentInsert(userNo, title, selfInfo, list);
				
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "프로필 등록이 완료되었습니다");
					response.sendRedirect(request.getContextPath()+"/options.sit");
					
				} else {
					if(list!=null) {
						for (int i = 0; i < list.size(); i++) {
							new File(savePath + list.get(i).getChangeName()).delete();
						}
					}
					request.setAttribute("errorMsg", "에러가 발생했습니다");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}

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
