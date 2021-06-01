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
import com.petnolja.pet.model.service.PetService;
import com.petnolja.pet.model.vo.Pet;

/**
 * Servlet implementation class PetListUpdateController
 */
@WebServlet("/updatePet2.me")
public class PetListUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetListUpdateController() {
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
		  
		  String savePath = request.getSession().getServletContext().getRealPath("resources/upfiles/pet_upfiles/");
		  	
		  MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		  
	      Pet p = new Pet();
	      
	      HttpSession session = request.getSession();
	      p.setPetNo(Integer.parseInt(multiRequest.getParameter("petNo")));
	      p.setPetName(multiRequest.getParameter("petName"));
	      p.setPetGender(multiRequest.getParameter("gender"));
	      p.setPetBreed(multiRequest.getParameter("dogBreed"));
	      p.setPetBirth(multiRequest.getParameter("birth"));
	      p.setPetWeight(Double.parseDouble(multiRequest.getParameter("weight")));
	      p.setNeutered(multiRequest.getParameter("middle"));
	      p.setChip(multiRequest.getParameter("dogAdd"));
	      p.setPetImg("resources/upfiles/pet_upfiles/"+ multiRequest.getFilesystemName("file1"));
	      
	      if(p.getPetWeight()>=15.0){
	         p.setPetSize("대형견");
	         }else if(p.getPetWeight()>=7.0){
	         p.setPetSize("중형견");
	         }else{
	         p.setPetSize("소형견");
	         }
	      
	      if(multiRequest.getParameterValues("Vacci")!=null) {
	         p.setVaccine(String.join(",", multiRequest.getParameter("Vacci")));
	      }
	      
	      if(multiRequest.getParameterValues("Cauti")!=null) {
	         p.setCaution(String.join(",", multiRequest.getParameter("Cauti")));
	      }
	      
	      p.setNote(multiRequest.getParameter("textarea"));
	      p.setHospi(multiRequest.getParameter("hospi"));
	      p.setHospiTel(multiRequest.getParameter("hospitel"));
	      
	      int result = new PetService().updatePet(p);
	      
	      if(result > 0) {
	         request.getSession().setAttribute("alertMsg", "반려견 추가에 성공하셨습니다.");
	         request.getRequestDispatcher("/petList.mem").forward(request, response);
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
