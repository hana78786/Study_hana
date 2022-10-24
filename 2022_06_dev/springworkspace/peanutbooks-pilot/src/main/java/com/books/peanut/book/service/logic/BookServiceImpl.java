package com.books.peanut.book.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.peanut.book.domain.HashTag;
import com.books.peanut.book.domain.OriginBook;
import com.books.peanut.book.domain.OriginBookSeries;
import com.books.peanut.book.domain.Star;
import com.books.peanut.book.domain.WriterProfile;
import com.books.peanut.book.service.BookService;
import com.books.peanut.book.store.BookStore;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	BookStore bStore;
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * 작가 프로필 등록
	 */
	@Override
	public int registProfile(WriterProfile wrtiePro) {
		int result = bStore.insertProfile(wrtiePro, session);
		
		return result;
	}

	/**
	 *작가 프로필 불러오기
	 */
	@Override
	public WriterProfile getProfile(String memberId) {
		WriterProfile oneWriter = bStore.selectProfile(session, memberId);
		return oneWriter;
	}

	/**
	 * 작가 프로필 수정
	 */
	@Override
	public int modifyProfile(WriterProfile wrtiePro) {
		int result = bStore.updateProfile(session, wrtiePro);
		return result;
	}

	/*피넛 오리지널 도서 등록 메인*/
	@Override
	public int registeOriBook(OriginBook oBook) {
		int result = bStore.insertOribook(session, oBook);
		return result;
	}

	/*태그등록*/
	@Override
	public int registeTag(HashTag hTag) {
		int result = bStore.insertTag(session, hTag);
		return result;
	}

	/**
	 * 피넛 오리지널 시리즈 등록
	 */
	@Override
	public int registOriSeries(OriginBookSeries oSeries) {
		int result = bStore.insertOriSeries(session, oSeries);
		return result;
	}

	/**
	 * 사용자가 쓴 모든 오리지널 도서 시리즈 가져오기
	 */
	@Override
	public List<OriginBookSeries> allOriSeries(int i, int boardLimit,String memberId) {
		List<OriginBookSeries> osList = bStore.selectAllOriSeries(i, boardLimit,memberId, session);
		return osList;
	}

	/***
	 * 책번호로 도서 제목 가져오기
	 */
	@Override
	public String getBookTitle(String bookNo) {
		String bookTitle = bStore.selectBookTitle(bookNo, session);
		return bookTitle;
	}
	
	/**책한권가져오기*/
	@Override
	public OriginBook showOnebook(String bookNo) {
		OriginBook oBook = bStore.selectOneBook(session, bookNo);
		return oBook;
	}
	
	/**
	 * 도서 하나의 시리즈 제목만 가져오기	 */
	@Override
	public List<OriginBookSeries> getSeriesTitle(String bookNo) {
		List<OriginBookSeries> osList = bStore.selectSeriesTitle(session, bookNo);
		return osList;
	}

	/**책 한권에 해당하는 태그 가져오기*/
	@Override
	public HashTag getBookTga(String bookNo, String category) {
		HashTag hTag = bStore.selectOneBookTag(bookNo, category, session);
		return hTag;
	}

	/**회원 닉네임 가져오기*/
	@Override
	public String getMemberNickName(String memberId) {
		String mNick = bStore.selectOneMemberNick(session,memberId);
		return mNick;
	}

	/**별점가져오기*/
	@Override
	public Star getOneBookStar(Star starOne) {
		Star star = bStore.selectOneBookStar(session, starOne);
		return star;
	}

	/**회원이 쓴 피넛 오리지널의 갯수 파악*/
	@Override
	public int allOriSeriesCount(String memberId) {
		int count = bStore.selectAllMemberOriSeries(session, memberId);
		return count;
	}

	/**작가의 모든 책 제목 가져오기*/
	@Override
	public List<OriginBook> allWirterbookTitle(String memberId) {
		List<OriginBook> obList = bStore.selectAllWritebookTitle(session, memberId);
		return obList;
	}

	/**해당 피넛 오리지널의 모든 시리즈 가져오기*/
	@Override
	public List<OriginBookSeries> allOriBookSeries(String bookNo) {
		List<OriginBookSeries> osList = bStore.selectAlloriBookSeries(session, bookNo);
		return osList;
	}

	/**유료여부 체크*/
	@Override
	public String checkPaid(int seriesNo, int bookNo) {
		String paidCheck = bStore.selectOneCheckPaid(session,seriesNo,bookNo);
		return paidCheck;
	}

	/**시리즈 한편 가져오기*/
	@Override
	public OriginBookSeries getOneSeries(int seriesNo, int bookNo) {
		OriginBookSeries  obSeries = bStore.selectOneSeries(session,seriesNo,bookNo);
		return obSeries;
	}

	/**작성자 맞는지 체크하기*/
	@Override
	public int checkWriter(int bookNo, String memberId) {
		int result = bStore.selectcheckWirter(session,bookNo,memberId);
		return result;
	}
	
	

}
