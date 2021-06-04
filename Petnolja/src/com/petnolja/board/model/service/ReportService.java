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
import com.petnolja.notice.model.dao.NoticeDao;
import com.petnolja.notice.model.vo.Notice;

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
	
	// 처리 끝난 것들에 대해 report 테이블의 done = 'Y' 로 만들어주기위한 서비스
	public int undoListDone(String[] list) {
		Connection conn = getConnection();
		
		int dresult = new ReportDao().undoListDone(conn, list);
		
		if(dresult > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return dresult;
	}
	
	public int deleteListDone(String[] list) {
		Connection conn = getConnection();
		
		int dresult = new ReportDao().deleteListDone(conn, list);
		
		if(dresult > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return dresult;
	}
	
	public Report qnaReportDetail(int rno) {
		Connection conn = getConnection();
		
		Report r = new ReportDao().qnaReportDetail(conn, rno);
		
		close(conn);
		return r;
	}

	public Report revReportDetail(int rno) {
		Connection conn = getConnection();
		
		Report r = new ReportDao().revReportDetail(conn, rno);
		
		close(conn);
		return r;
	}
	
}
