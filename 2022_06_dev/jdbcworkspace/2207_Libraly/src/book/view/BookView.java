package book.view;

import java.util.ArrayList;
import java.util.Scanner;

import book.vo.Book;

public class BookView {

	public int mainMenu() {
		System.out.println("=-=-=-=책관리=-=-=-=");
		System.out.println("1. 전채 책 조회");
		System.out.println("2. 책 코드로 조회");
		System.out.println("3. 책 추가하기");
		System.out.println("4. 책 삭제하기");
		System.out.println("5. 메인 메뉴로 이동");
		System.out.print("선택 : ");
		
		Scanner sc = new Scanner(System.in);
		
		
		return sc.nextInt();
	}

	public void ShowAllBook(ArrayList<Book> bList) {
		for(Book book : bList) {
			System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
			System.out.println("번호 : "+book.getBookNumber());
			System.out.println("책 이름 : "+book.getBookName());
			System.out.println("작가 : "+book.getBookWriter());
			System.out.println("가격 : "+book.getBookPrice());
			System.out.println("출판사 : "+book.getPublisher());
			System.out.println("분류 : "+book.getGenre());
			System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
		}
	}

	public int serchBNo() {
		Scanner sc = new Scanner(System.in);
		System.out.print("책 코드 : ");
		
		return sc.nextInt();
	}

	public void serchBook(Book book) {
		System.out.println("=-=-=-=-검색결과=-=-=-=-=");
		System.out.println("번호 : "+book.getBookNumber());
		System.out.println("책 이름 : "+book.getBookName());
		System.out.println("작가 : "+book.getBookWriter());
		System.out.println("가격 : "+book.getBookPrice());
		System.out.println("출판사 : "+book.getPublisher());
		System.out.println("분류 : "+book.getGenre());
		System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
	}

	public void failMassge(String string) {
		System.out.println("[시스템 정보] : "+string+"실패");
		
	}
	
	public void successMassge(String string) {
		System.out.println("[시스템 정보] : "+string+"성공");
		
	}

	public Book addBook() {
		Scanner sc = new Scanner(System.in);
		Book book = new Book();
		System.out.print("책 이름 :");
		book.setBookName(sc.nextLine());
		System.out.print("작가 :");
		book.setBookWriter(sc.nextLine());
		System.out.print("가격 :");
		book.setBookPrice(sc.nextInt());
		System.out.print("출판사 :");
		book.setPublisher(sc.next());
		System.out.print("분류 :");
		book.setGenre(sc.next());
		
		
		return book;
	}
	

}
