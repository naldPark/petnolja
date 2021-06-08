package com.petnolja.notice.model.service;

import static com.petnolja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.Attachment;
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
	 * 제목 검색 키워드 사용한 공지사항 개수
	 */
	public int selectListCount(String keyword) {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn, keyword);
		
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
	
	/** 최서경
	 *  공지사항 작성
	 */
	public int insertNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().insertNotice(conn, n);
		
		int result2 = 1;
		if(at != null) {
			result2 = new NoticeDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 * result2;
	}

	/** 최서경
	 * 공지사항 삭제
	 */
	public int deleteNotice(String[] list) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, list);
		
		if(result == list.length) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/** 최서경
	 * 공지사항 상세조회
	 */
	public Notice selectNotice(int nNo) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, nNo);
		
		close(conn);
		return n;
		
	}
	
	/** 최서경
	 * 공지사항 첨부파일 조회
	 */
	public Attachment selectAttachment(int nNo) {
		Connection conn = getConnection();
		
		Attachment at = new NoticeDao().selectAttachment(conn, nNo);
		
		close(conn);
		return at;
	}
	
	/** 최서경
	 * 공지사항 내용 수정
	 */
	public int updateNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		
		// 게시글 수정
		int result1 = new NoticeDao().updateNotice(conn, n);
		
		int result2 = 1;
		if(at != null) {
			if(at.getFileNo() != 0) {
				result2 = new NoticeDao().updateAttachment(conn, at);
			} else {
				result2 = new NoticeDao().insertNewAttachment(conn, at);
			}
		}
		
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	/** 최서경
	 * @return 공지사항 제목으로 검색
	 */
	public ArrayList<Notice> selectKeyList(PageInfo pi, String keyword){
		
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectKeyList(conn, pi, keyword);

		close(conn);
		return list;
	}
	
	
}
