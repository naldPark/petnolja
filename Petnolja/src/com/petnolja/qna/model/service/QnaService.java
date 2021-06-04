package com.petnolja.qna.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.commit;
import static com.petnolja.common.JDBCTemplate.getConnection;
import static com.petnolja.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.Attachment;
import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.qna.model.dao.QnaDao;
import com.petnolja.qna.model.vo.Qna;


public class QnaService {

	/** 최서경
	 * 관리자 Qna 총 개수(페이징바에 사용)
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new QnaDao().selectListCount(conn);
		
		return listCount;
	}
	
	/** 최서경
	 * 관리자 Qna 목록 전체 조회
	 */
	public ArrayList<Qna> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDao().selectList(conn, pi);
		
		close(conn);
		return list;
	}
	
	/** 최서경
	 * qna 삭제
	 */
	public int deleteQna(String[] list) {
		Connection conn = getConnection();
		
		int result = new QnaDao().deleteQna(conn, list);
		
		if(result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/** 최서경
	 * qna번호로 내용 조회하기
	 */
	public Qna selectQna(int qno) {
		Connection conn = getConnection();
		Qna q = new QnaDao().selectQna(conn, qno);
		close(conn);
		return q;
	}
	
	/** 최서경
	 * qna에 첨부된 파일 조회
	 */
	public Attachment selectAttachment(int qno) {
		Connection conn = getConnection();
		Attachment at = new QnaDao().selectAttachment(conn, qno);
		close(conn);
		return at;
	}
	
	/** 최서경
	 * qna 답변작성
	 */
	public int updateAnswer(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().updateAnswer(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
