package com.books.peanut.member.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.peanut.member.domain.Member;
import com.books.peanut.member.service.MemberService;
import com.books.peanut.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private MemberStore mStore;

	// 회원가입
	@Override
	public int registerMember(Member member) {
		int result = mStore.insertMember(session, member);
		return result;
	}
	// 별명 유효성 검사
	@Override
	public int checkNickname(String mNickname) {
		int result = mStore.checkNickname(session, mNickname);
		return result;
	}
	// 아이디 유효성 검사
	@Override
	public int checkId(String memberId) {
		int result = mStore.checkId(session, memberId);
		return result;
	}
	// 이메일 유효성 검사
	@Override
	public int checkEmail(String mEmail) {
		int result = mStore.checkEmail(session, mEmail);
		return result;
	}
	// 로그인
	@Override
	public Member loginMember(Member member) {
		Member mResult = mStore.selectLoginMember(session, member);
		return mResult;
	}
	// 회원 정보 수정
	@Override
	public int modifyInfo(Member member) {
		int result = mStore.updateInfo(session, member);
		return result;
	}
	// 회원탈퇴
	@Override
	public int deleteMember(Member member) {
		int result = mStore.deleteMember(session, member);
		return result;
	}
	// 내 서재 - 저장된 도서 수 가져오기
//	@Override
//	public int countSavedBooks(String memberId) {
//		int result = mStore.selectSavedBooks(session, memberId);
//		return result;
//	}
	// 로그인한 회원이 등록한 작품 수 가져오기
	@Override
	public int countWrittenBooks(String memberId) {
		int result = mStore.selectWrittenBooks(session, memberId);
		return result;
	}

}
