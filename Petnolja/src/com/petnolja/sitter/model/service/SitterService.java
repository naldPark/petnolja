package com.petnolja.sitter.model.service;

import static com.petnolja.common.JDBCTemplate.close;
import static com.petnolja.common.JDBCTemplate.commit;
import static com.petnolja.common.JDBCTemplate.getConnection;
import static com.petnolja.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.Attachment;
import com.petnolja.petsitter.model.vo.Petsitter;
import com.petnolja.research.model.vo.Research;
import com.petnolja.sitter.model.dao.SitterDao;

public class SitterService {
	
	public int applySitterInsert(Petsitter s) {
		Connection conn = getConnection();
		int result = new SitterDao().applySitterInsert(conn, s);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}
	
	public Research selectCurrentOptions(int userNo) {
		Connection conn = getConnection();
		
		Research r =new SitterDao().selectCurrentOptions(conn, userNo);

		close(conn);
		return r;
	}
	
	public int[] selectReserveList(int userNo) {
		Connection conn = getConnection();
		int waiting =new SitterDao().reserveWaitingCount(conn, userNo);
		int confirm  =new SitterDao().reserveConfirmCount(conn, userNo);

		int[] count = {waiting, confirm};
		close(conn);
		
		return count;
	}
	
	public int sitterContentInsert(int userNo, String title, String selfInfo, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new SitterDao().sitterContentUpdate(conn, userNo, title, selfInfo);
		int result2 = new SitterDao().insertAttachmentList(conn, userNo, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	
	public int sitterContentUpdate(int userNo, String title, String selfInfo, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new SitterDao().sitterContentUpdate(conn, userNo, title, selfInfo);
		int result2=1;
		int result3=1;
		
		if (list != null) {

			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getStatus().equals("Y")) {
					result2 = new SitterDao().insertAttachmentList(conn, userNo, list);
					break;
				}
			}
			for (int j = 0; j < list.size(); j++) {
				if (list.get(j).getStatus().equals("N")) {
					result3 = new SitterDao().updateAttachmentList(conn, userNo, list);
					break;
				}

			}
		}
		if(result1 > 0 && result2 > 0 &&result3>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 *result3;
	}
	
	public Petsitter selectSitterContent(int userNo) {
		Connection conn = getConnection();
		Petsitter ps= new SitterDao().selectSitterContent(conn, userNo);
		return ps;
	}
	

	public String[] selectSitterPics(int userNo) {
		Connection conn = getConnection();
		 String[] pics= new SitterDao().selectSitterPics(conn, userNo);
		return pics;
		
	}

	
	
}
	

