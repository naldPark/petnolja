package com.petnolja.notice.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.notice.model.dao.NoticeDao;
import com.petnolja.notice.model.vo.Notice;
public class NoticeService {
	
	
	/** 최서경
	 * 전체 공지사항 개수(페이징바에 사용)
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	
	/** 최서경
	 * @return 전체 공지사항 목록 조회
	 */
	public ArrayList<Notice> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);

		close(conn);
		
		return list;
	}

}
