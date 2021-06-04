package com.petnolja.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.petnolja.member.model.service.MemberService;
import com.petnolja.member.model.service.SendAuth;
import com.petnolja.member.model.service.SendSMS;
import com.petnolja.member.model.vo.FindMember;

/**
 * Servlet implementation class FindPwd1Controller
 */
@WebServlet("/findPwd2.mem")
public class FindPwd2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwd2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String findPwdWay = request.getParameter("findPwdWay");
		String tempPwd = Integer.toString((int)Math.floor((Math.random()*10000000)));
		int result = new MemberService().tempPwd(userId, tempPwd);
		
		FindMember findPwd = new MemberService().findPwd1(userId, userName);
		findPwd.setTempPwd(tempPwd);
		
		if(findPwdWay.equals("email")) {
			new SendAuth().sendAuth(findPwd.getTempPwd(), findPwd.getMemEmail());
		} else if(findPwdWay.equals("phone")) {
			new SendSMS().sendSMS(findPwd.getTempPwd(), findPwd.getMemTel());	
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
