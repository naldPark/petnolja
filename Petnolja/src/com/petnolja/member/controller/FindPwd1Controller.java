package com.petnolja.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.petnolja.member.model.service.MemberService;
import com.petnolja.member.model.vo.FindMember;

/**
 * Servlet implementation class FindPwd1Controller
 */
@WebServlet("/findPwd1.mem")
public class FindPwd1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwd1Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		FindMember findPwd = new MemberService().findPwd1(userId, userName);

		if(findPwd!=null) {
		// email *처리했습니다
		int temp= findPwd.getMemEmail().indexOf("@");
		String newEmail =findPwd.getMemEmail().substring(0, temp/2);
		for (int i = 0; i < temp-temp/2; i++) {newEmail+='*';}
		newEmail+=findPwd.getMemEmail().substring(temp);
		findPwd.setTempEmail(newEmail);
		
		// 전화번호 *처리 했습니다
		temp= findPwd.getMemTel().lastIndexOf("-");
		String newTel =findPwd.getMemTel().substring(0, temp/2);
		for (int i = 0; i < temp-temp/2; i++) {newTel+='*';}
		newTel+=findPwd.getMemTel().substring(temp);
		findPwd.setTempTel(newTel);
		
//		 랜덤함수로 인증번호 발생 후 임시로 비밀번호에 넣어줬습니다
		findPwd.setTempPwd(Integer.toString((int)Math.floor((Math.random()*10000000))));
		
		}
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(findPwd, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
