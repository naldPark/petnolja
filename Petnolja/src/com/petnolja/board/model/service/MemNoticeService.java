package com.petnolja.board.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.board.model.dao.MemNoticeDao;
import com.petnolja.board.model.vo.MemNotice;
import com.petnolja.common.model.vo.PageInfo;

public class MemNoticeService {
	
	// 목록 갯수 뽑기
	public int memNoticeCount() {
		Connection conn = getConnection();
		int listCount = new MemNoticeDao().memNoticeCount(conn);
		
		close(conn);
		return listCount;
	}
	
	
	// 공지사항 전체 조회
	public ArrayList<MemNotice> selectMemNoticeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<MemNotice> list = new MemNoticeDao().selectMemNoticeList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int increaseCount(int MemnoticeNo) {
		Connection conn = getConnection();
		int result = new MemNoticeDao().increaseCount(conn, MemnoticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public MemNotice selectMemNotice(int MemnoticeNo) {
		Connection conn = getConnection();
		MemNotice n = new MemNoticeDao().selectMemNotice(conn, MemnoticeNo);
		
		close(conn);
		return n;
	}
	
	
}
