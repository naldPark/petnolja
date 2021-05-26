package com.petnolja.member.model.service;

import static com.petnolja.common.JDBCTemplate.*;
import java.sql.Connection;
import com.petnolja.member.model.dao.MemberDao;
import com.petnolja.member.model.vo.FindMember;
import com.petnolja.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);

		close(conn);
		return m;

	}
	
	public String findId(Member m) {
		
		Connection conn = getConnection();
		String findId = new MemberDao().findId(conn,m);
		
		if(findId==null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		close(conn);
		return findId;
		
	}
	
	public FindMember findPwd1(String userId, String userName){
		Connection conn = getConnection();
		FindMember m = new MemberDao().findPwd1(conn, userId,userName);
		
		close(conn);
		return m;
	}
	
	public int findPwd2(int userNo, String userId, String userPwd) {
		Connection conn = getConnection();
		int result =new MemberDao().findPwd2(conn, userNo, userPwd, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemNo());
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
		
	}
	
	
	
}
