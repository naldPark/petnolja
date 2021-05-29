package com.petnolja.pet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.petnolja.common.MyFileRenamePolicy;
import com.petnolja.member.model.vo.Member;
import com.petnolja.pet.model.service.PetService;
import com.petnolja.pet.model.vo.Pet;

/**
 * Servlet implementation class AddpetInsertController
 */
@WebServlet("/addpet2.me")
public class AddpetInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddpetInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("안녕");
			// 전송용량제한
			int maxSize = 10 * 1024 * 1024;
			
			// 저장할 폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/pet_upfiles/");
			
			// 전달된 파일명 수정 작업 후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			Pet p = new Pet();
			
			HttpSession session = request.getSession();
			p.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo());
			p.setPetName(multiRequest.getParameter("petName"));
			p.setPetGender(multiRequest.getParameter("gender"));
			p.setPetBreed(multiRequest.getParameter("dogBreed"));
			p.setPetBirth(multiRequest.getParameter("birth"));
			p.setPetWeight(Double.parseDouble(multiRequest.getParameter("weight")));
			p.setNeutered(multiRequest.getParameter("middle"));
			p.setPetImg("resources/upfiles/pet_upfiles/"+multiRequest.getFilesystemName("file1"));
			
			if(p.getPetWeight()>=15.0){
				p.setPetSize("대형견");
				}else if(p.getPetWeight()>=7.0){
				p.setPetSize("중형견");
				}else{
				p.setPetSize("소형견");
				}
			
			p.setChip(multiRequest.getParameter("dogAdd"));
			
			
			if(multiRequest.getParameterValues("Vacci")!=null) {
				p.setVaccine(String.join(",", multiRequest.getParameterValues("Vacci")));
			}
			
			if(multiRequest.getParameterValues("Cauti")!=null) {
				p.setCaution(String.join(",", multiRequest.getParameterValues("Cauti")));
			}
			
			p.setNote(multiRequest.getParameter("textarea"));
			p.setHospi(multiRequest.getParameter("hospi"));
			p.setHospiTel(multiRequest.getParameter("hospitel"));
			System.out.println(p);
			int result = new PetService().insertPet(p);
			
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "반려견 추가에 성공하셨습니다.");
				request.getRequestDispatcher("views/pet/addPet.jsp").forward(request, response);
				
				
			}else {
				request.setAttribute("errorMsg", "작성에 실패하셨습니다.");
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
