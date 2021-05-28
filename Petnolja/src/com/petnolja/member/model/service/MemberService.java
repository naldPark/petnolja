package com.petnolja.member.model.service;

import static com.petnolja.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.petnolja.common.model.vo.PageInfo;
import com.petnolja.member.model.dao.MemberDao;
import com.petnolja.member.model.vo.FindMember;
import com.petnolja.member.model.vo.Member;
import com.petnolja.petsitter.model.vo.Sitter;

public class MemberService {

	// 회원 로그인
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);

		close(conn);
		return m;

	}

	// 회원 아이디 찾기 본인검증 및 찾아오기
	public String findId(Member m) {

		Connection conn = getConnection();
		String findId = new MemberDao().findId(conn, m);

		if (findId == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		close(conn);
		return findId;

	}

	// 회원 비밀번호 재설정을 위한 본인 검증
	public FindMember findPwd1(String userId, String userName) {
		Connection conn = getConnection();
		FindMember m = new MemberDao().findPwd1(conn, userId, userName);

		close(conn);
		return m;
	}

	// 회원 비밀번호 재설정
	public int findPwd2(int userNo, String userId, String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().findPwd2(conn, userNo, userPwd, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 회원이 본인의 즐겨찾기를 조회할때 목록 갯수 뽑기
	public int favoriteListCount(int userNo) {

		Connection conn = getConnection();
		int listCount = new MemberDao().favoriteListCount(conn, userNo);

		close(conn);
		return listCount;

	}

	// 회원이 본인의 즐겨찾기를 조회
	public ArrayList<Sitter> favoriteList(PageInfo pi, int userNo) {

		Connection conn = getConnection();
		ArrayList<Sitter> list = new MemberDao().favoriteList(conn, pi, userNo);
		close(conn);
		return list;

	}

	// 회원이 즐겨찾기를 추가하거나 해제함
	public int favoriteChange(int userNo, int sitterNo) {
		Connection conn = getConnection();
		int result = new MemberDao().favoriteChange(conn, userNo, sitterNo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}

	// 회원가입을 위한 insert입니다
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);

		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemNo());

		} else {
			rollback(conn);
		}

		close(conn);

		return updateMem;

	}

	public int leaveMember(String checkbox, String memId, String memPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().leaveMember(conn, checkbox, memId, memPwd);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * 최서경
	 * 
	 * @return 총 회원 수 (관리자)
	 */
	public int selectListCount() {
		Connection conn = getConnection();

		int listCount = new MemberDao().selectListCount(conn);

		close(conn);

		return listCount;

	}

	/**
	 * 최서경
	 * 
	 * @return 총 회원 목록 조회
	 */
	public ArrayList<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);

		return list;
	}

	/**
	 * 최서경 관리자 페이지에서 회원 정보 수정
	 */
	public int adminUpdateMember(int memNo, String updateCol, String updateVal) {
		Connection conn = getConnection();

		int result = new MemberDao().adminUpdateMember(conn, memNo, updateCol, updateVal);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * 최서경 관리자 회원 블랙리스트 등록
	 */
	public int blockMember(String[] list) {
		Connection conn = getConnection();
		int result = new MemberDao().blockMember(conn, list);

		if (result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * 최서경 관리자 회원 블랙리스트 해제
	 */
	public int unblockMember(String[] list) {
		Connection conn = getConnection();

		int result = new MemberDao().unblockMember(conn, list);

		if (result == list.length) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
}
