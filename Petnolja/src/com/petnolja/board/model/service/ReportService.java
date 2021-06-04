package com.petnolja.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.commit;
import static com.petnolja.common.JDBCTemplate.getConnection;
import static com.petnolja.common.JDBCTemplate.rollback;

import com.petnolja.board.model.dao.ReportDao;
import com.petnolja.board.model.vo.Report;
import com.petnolja.common.model.vo.PageInfo;

public class ReportService {

	public int selectQNAListCount() {
		Connection conn = getConnection();
		int QlistCount = new ReportDao().selectQNAListCount(conn);
		close(conn);
		return QlistCount;
	}
	
	public int selectRevListCount() {
		Connection conn = getConnection();
		int RlistCount = new ReportDao().selectRevListCount(conn);
		close(conn);
		return RlistCount;
	}
	

	public ArrayList<Report> selectQNAList(PageInfo Qpi){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectQNAList(conn, Qpi);
		close(conn);
		return list;
	}
	
	public ArrayList<Report> selectRevList(PageInfo Rpi){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectRevList(conn, Rpi);
		close(conn);
		return list;
	}
	
	public int undoQnaReport(String[] list) {
		Connection conn = getConnection();
		
		int result = new ReportDao().undoQnaReport(conn, list);
		
		if(result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int undoRevReport(String[] list) {
		Connection conn = getConnection();
		
		int result = new ReportDao().undoRevReport(conn, list);
		
		if(result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public int deleteQnaReport(String[] list) {
		Connection conn = getConnection();
		
		int result = new ReportDao().deleteQnaReport(conn, list);
		
		if(result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int deleteRevReport(String[] list) {
		Connection conn = getConnection();
		
		int result = new ReportDao().deleteRevReport(conn, list);
		
		if(result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
}
