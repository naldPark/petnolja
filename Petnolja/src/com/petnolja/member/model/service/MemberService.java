package com.petnolja.member.model.service;

import static com.petnolja.common.JDBCTemplate.*;
import java.sql.Connection;
import com.petnolja.member.model.dao.MemberDao;
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
}
