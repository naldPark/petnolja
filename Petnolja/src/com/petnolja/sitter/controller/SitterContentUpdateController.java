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
@WebServlet("/contentUpdate.sitn")
public class SitterContentUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterContentUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
		} else {
			int userNo = ((Member) request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
			String[] pics = new SitterService().selectSitterPics(userNo);
			if (ServletFileUpload.isMultipartContent(request)) {
				int maxSize = 10 * 1024 * 1024;
				String savePath = request.getSession().getServletContext()
						.getRealPath("/resources/upfiles/sitter_upfiles/");
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				String title = multiRequest.getParameter("title");
				String selfInfo = multiRequest.getParameter("selfIntro");

				ArrayList<Attachment> list = new ArrayList<>();
				Attachment at = null;
				ArrayList<String> deleteAttachment = new ArrayList<>();

				int fileCount = 1;
				for (int i = 1; i <= 4; i++) {
					String key = "file" + i;
					// 만약 file i번째가 비어있지 않다면
					if (multiRequest.getOriginalFileName(key) != null) {
						// 새로운 attachment객체에 이것저것 담는다
						at = new Attachment();
						at.setOriginName(multiRequest.getOriginalFileName(key));
						at.setChangeName(multiRequest.getFilesystemName(key));
						at.setFilePath("resources/upfiles/sitter_upfiles/");
						// 그러나
						if (pics[(i * 2) - 1] != null) { // 기존 파일넘버랑 같은거라면 이미지를 바꾼거기 떄문에 같은 자리에 배치하고
							at.setFileLevel(Integer.parseInt(pics[(i * 2) - 2])); // arraylist에 넣어놓고
							deleteAttachment.add(pics[(i * 2) - 1]);
							at.setStatus("N");// STATUS의 의미는 아닌데 새로운이미지인지 구분
						} else {
							at.setFileLevel(fileCount);
							at.setStatus("Y"); // STATUS의 의미는 아닌데 새로운이미지인지 구분
						}
						list.add(at);
					}
					fileCount++;
				}
				int result = new SitterService().sitterContentUpdate(userNo, title, selfInfo, list);
				if (result > 0) {
					for (int i = 0; i < deleteAttachment.size(); i++) {
						// 바뀐파일은 삭제처리
						new File(request.getSession().getServletContext().getRealPath("/") + deleteAttachment.get(i)).delete();
					}
					request.getSession().setAttribute("alertMsg", "프로필 등록이 완료되었습니다");
					response.sendRedirect(request.getContextPath() + "/options.sit");
				} else {
					if (list != null) {
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
