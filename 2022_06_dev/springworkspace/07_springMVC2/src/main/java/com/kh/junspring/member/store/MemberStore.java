package com.kh.junspring.member.store;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.junspring.member.domain.Member;

public interface MemberStore {
	//selectLoginMember
	public Member selectLoginMember(SqlSession session, Member member);
	
	//insertMember
	public int insertMember (SqlSession session,Member member);
	
	//updateMember
	public int updateMember(SqlSession session,Member member);
	
	//deleteMember
	public int deleteMember(SqlSession session,String memberId);

	public Member printOneById(SqlSessionTemplate session, String memberId);

}
