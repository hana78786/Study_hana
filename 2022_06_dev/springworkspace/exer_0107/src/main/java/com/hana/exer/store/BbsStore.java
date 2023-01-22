package com.hana.exer.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hana.exer.doamin.Bbs;

public interface BbsStore {

	List<Bbs> selectBbsTitle(SqlSessionTemplate session);

	int insertBbs(SqlSessionTemplate session, Bbs bbs);

	Bbs selectOneBbs(SqlSessionTemplate session, int bbsNo);

}
