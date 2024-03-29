<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>땅콩북스</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/resources/img/icons8-book-32.png">
<link rel="stylesheet" href="/resources/css/book/bookregist-admin.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
	<jsp:include page="../header/header.jsp" />
	<main>
		<form action="/book/norbookRegist.do" method="post"
			enctype="multipart/form-data">
		<section class="container">
			<article>
				<h1>도서등록</h1>
				<div id="title-area">
					<div class="title-text">

						<input type="text" id="title-text" name="bookTitle" placeholder="제목을 입력하세요">
					</div>


				</div>

			</article>
			<article class="info-area row">
				<div class="col-md-6" id="pic-area">
					<h5 class="cover-title">표지등록</h5>

					<div class="align-items-center">
						<div class="align-items-center">
							<img class="headerimg"> <label
								class="input-file-button float-md-start"> <img
								src="/resources/img/book/icons8-camera-96.png" alt=""
								id="camera1"> <input type="file" name="coverpic"
								class="isFile" style="display: none"
								accept="image/jpeg, image/png, image/jpg"
								onchange="imgView(this);">
							</label>

						</div>

					</div>

				</div>
				<div class="col-md-6">
					<div class="category">
						<select name="category" id="" required="required">
							<option value="">카테고리를 선택하세요</option>
							<option value="detective">추리소설</option>
							<option value="history">역사</option>
							<option value="romance">로맨스</option>
							<option value="tale">동화</option>
							<option value="poem">시</option>
							<option value="novel">일반소설</option>
							<option value="other">기타</option>
						</select> <select name="language" id=""  required="required">
							<option value="">언어를 선택하세요</option>
							<option value="ko">한국어</option>
							<option value="en">영어</option>
							<option value="jp">일본어</option>
						</select>

					</div>
					<h5>작품소개</h5>
					<textarea name="bookInfo" id="info-text" cols="10" rows="10"
						placeholder="소개를 입력하세요"></textarea>

					<h5>작가소개</h5>
					<input type="text" name="writer" id="writer-name"
						placeholder="작가명을 입력하세요">
					<textarea name="writerInfo" id="wirter-info" cols="10" rows="10"
						placeholder="소개를 입력하세요"></textarea>


					<div id="tag-area">
						<h5>해시태그</h5>
							<select name="hashTag1" id="">
								<option value="none">해시태그를 선택하세요</option>
								<option value="fantasy">판타지</option>
								<option value="now">현대</option>
								<option value="daily">일상</option>
								<option value="history">역사</option>
							</select> <select name="hashTag2" id="">
								<option value="none">해시태그를 선택하세요</option>
								<option value="child">어린이를 위한</option>
								<option value="adult">어른을 위한</option>
								<option value="woman">여성을 위한</option>
								<option value="man">남성을 위한</option>
								<option value="all">모두를 위한</option>
							</select> <select name="hashTag3" id="">
								<option value="none">해시태그를 선택하세요</option>
								<option value="horror">겁쟁이 출입금지</option>
								<option value="gag">배꼽 빠지는</option>
								<option value="move">마음이 따뜻해 지는</option>
								<option value="heart">설레이는</option>
								<option value="tear">눈물이 나는</option>
								<option value="popcorn">팝콘각</option>
								<option value="cider">사이다 마시는</option>
							</select>


					</div>

				</div>


			</article>

			<hr>
			<article id="first-contents">
				<h2>1화 등록</h2>

				<div id="contents-text">
					<input type="text" placeholder="제목을 입력해주세요" class="text-input" name="title">


				</div>

				<div id="contents-pic-area">
					<div class="align-items-center">
						<div class="align-items-center">
							<img class="contentsimg"> <label
								class="input-file-button float-md-start"> <img
								src="/resources/img/book/icons8-camera-96.png" alt=""
								id="camera2"> <input type="file" name="subPicture"
								class="isFile" style="display: none"
								accept="image/jpeg, image/png, image/jpg"
								onchange="imgView(this);">
							</label>

						</div>

					</div>
				</div>

				<div class="contents-textarea">

					<div id="summernote"></div>
					<textarea rows="" cols="" style="display: none" name="contents"
						required="required"></textarea>
				</div>
				<div class="contents-button row">

					<button class="col-6">등록</button>
					<button class="col-6" type="button" onclick="location.href='/book/writerMenu.do'">취소</button>
				</div>


			</article>
		</section>
		</form>

	</main>
	<jsp:include page="../footer/footer.jsp" />
</body>
<script src="/resources/js/book/bookregist-admin.js"></script>
</html>