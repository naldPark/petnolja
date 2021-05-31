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

	public int selectReportListCount(){
		Connection conn = getConnection();
		int listCount = new ReportDao().selectReportListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Report> selectReportList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectReportList(conn, pi);
		close(conn);
		return list;
	}
	
	
}
