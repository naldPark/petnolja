package com.petnolja.admin.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;

import com.petnolja.admin.model.dao.AdminDao;
import com.petnolja.admin.model.vo.Admin;
import com.petnolja.admin.model.vo.Deal;
import com.petnolja.common.model.vo.PageInfo;

public class AdminService {
	
	/** 최서경
	 * 관리자 로그인
	 */
	public Admin adminLogin(String adminId, String adminPwd) {
		
		Connection conn = getConnection();
		Admin loginAdmin = new AdminDao().adminLogin(conn, adminId, adminPwd);
		
		close(conn);
		return loginAdmin;
	}
	
	/** 최서경
	 * 확정된 거래내역 총 개수
	 * 
	 */
	public int selectDealListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminDao().selectDealListCount(conn);
		
		close(conn);
		return listCount;
	}

	/** 최서경
	 * 거래목록 조회
	 */
	public ArrayList<Deal> selectDealList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Deal> list = new AdminDao().selectDealList(conn, pi);
		
		close(conn);
		return list;
	}
	
	/** 최서경
	 * 거래번호를 이용하여 검색
	 */
	public ArrayList<Deal> selectKeyDealList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Deal> list = new AdminDao().selectKeyDealList(conn, pi, keyword);
		
		close(conn);
		return list;
	}
	
	/** 최서경
	 * 거래날짜를 이용하여 검색
	 */
	public ArrayList<Deal> selectKeyDateDealList(PageInfo pi, String date){
		Connection conn = getConnection();
		
		ArrayList<Deal> list = new AdminDao().selectKeyDateDealList(conn, pi, date);
		
		close(conn);
		return list;
	}
}
