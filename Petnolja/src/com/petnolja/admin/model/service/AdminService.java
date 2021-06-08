package com.petnolja.admin.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.admin.model.dao.AdminDao;
import com.petnolja.admin.model.vo.Admin;
import com.petnolja.admin.model.vo.Calculate;
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
	 * 거래내역 목록에서 거래날짜를 이용하여 검색
	 * 
	 */
	public int selectKeyDateDealListCount(String date) {
		Connection conn = getConnection();
		
		int listCount = new AdminDao().selectKeyDateDealListCount(conn, date);
		
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
	
	/** 최서경
	 * 펫시터 정산페이지 목록 개수
	 */
	public int calculateListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdminDao().calculateListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	/** 최서경
	 * 펫시터 아이디로 검색 후 정산 목록 개수
	 */
	public int calculateListCount(String keyword) {
		Connection conn = getConnection();
		
		int listCount = new AdminDao().calculateListCount(conn, keyword);
		
		close(conn);
		return listCount;
	}
	
	/** 최서경
	 * 펫시터 정산페이지 목록 조회
	 */
	public ArrayList<Calculate> selectCalculateList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Calculate> list = new AdminDao().selectCalculateList(conn, pi);
		
		close(conn);
		return list;
	}
	
	/** 최서경
	 * 펫시터 정산페이지 펫시터 아이디로 검색
	 */
	public ArrayList<Calculate> selectCalculateList(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Calculate> list = new AdminDao().selectCalculateList(conn, pi, keyword);
		
		close(conn);
		return list;
	}
	
	public int CNFcalculateDetailCount(String sid, int month, int year) {
		
		Connection conn = getConnection();
		int listCount = new AdminDao().CNFcalculateDetailCount(conn, sid, month, year);
		
		close(conn);
		return listCount;
		
	}
	
	public int CNCcalculateDetailCount(String sid, int month, int year) {
		
		Connection conn = getConnection();
		int listCount = new AdminDao().CNCcalculateDetailCount(conn, sid, month, year);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Calculate> CNFselectCalculateDetail(PageInfo pi, String sid, int month, int year){
		
		Connection conn = getConnection();
		ArrayList<Calculate> list = new AdminDao().CNFselectCalculateDetail(conn, pi, sid, month, year);
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Calculate> CNCselectCalculateDetail(PageInfo pi, String sid, int month, int year){
		
		Connection conn = getConnection();
		ArrayList<Calculate> list = new AdminDao().CNCselectCalculateDetail(conn, pi, sid, month, year);
		
		close(conn);
		return list;
		
	}
	
	public String selectAccBank(String sid) {
		
		Connection conn = getConnection();
		String bank = new AdminDao().selectAccBank(conn, sid);
		
		close(conn);
		return bank;
		
	}
	
	
	public String selectAccNum(String sid) {
		
		Connection conn = getConnection();
		String accNum = new AdminDao().selectAccNum(conn, sid);
		
		close(conn);
		return accNum;
		
	}
	
}
