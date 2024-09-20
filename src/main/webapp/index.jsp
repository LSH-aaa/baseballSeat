<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>야구 좌석 양도 홈페이지</title>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>
    <header id="header">
        <h2 style="text-align: left; text-decoration-style: wavy">
            <a href="/baseballGive/main" class="no-hover"
               style="font-family: Bahnschrift; color: darkblue;">야좌양</a>
                <span style="font-size: 50px; color: coral">(야구 좌석 양도)</span>
        </h2>
        <nav style="text-align: right">
            <a href="#" style="letter-spacing: 3px; font-size: large;">좌석</a>
            <span class="nav-item">
                <a href="#" class="dropdown-link" style="letter-spacing: 3px; font-size: large;">게시판 ⬇</a>
                <ul class="dropdown-menu">
                    <li><a href="#">양도 게시판</a></li>
                    <li><a href="#">분실물 게시판</a></li>
                    <li><a href="/board/boardLee/qnaList.jsp">QnA 게시판</a></li>
                </ul>
            </span>
            <a href="#" style="letter-spacing: 3px; font-size: large;">날씨</a>
            <a href="#" style="letter-spacing: 3px; font-size: large;">로그인/회원가입</a>
            <a href="#" style="letter-spacing: 3px; font-size: large;">마이페이지</a>
        </nav>
    </header>
    <section id="contents">
        <div>
            <p style="font-size: xx-large; margin-left: 50px;"><b>
                프로야구</b>
                <span style="font-size: 14pt;">(시야 사진 999,999장)</span>
            </p>
            <br><br>
        </div>
        <div class="image-gallery">
            <div style="text-align: center">
                <img src="image/Dusan.png" alt="두산 베어스" class="gallery-image">
                <p class="image-description">두산 베어스</p>
            </div>
            <div style="text-align: center">
                <a href="/board/boardLee/seatArray.jsp" class="no-hover"><img src="image/Kia.png" alt="KIA 타이거즈" class="gallery-image"></a>
                <p class="image-description">KIA 타이거즈</p>
            </div>
            <div style="text-align: center">
                <img src="image/Hanhwa.png" alt="한화 이글스" class="gallery-image">
                <p class="image-description">한화 이글스</p>
            </div>
            <div style="text-align: center">
                <img src="image/Kium.png" alt="키움 히어로즈" class="gallery-image">
                <p class="image-description">키움 히어로즈</p>
            </div>
            <div style="text-align: center">
                <img src="image/KT.png" alt="KT 위즈" class="gallery-image">
                <p class="image-description">KT 위즈</p>
            </div>
            <div style="text-align: center">
                <img src="image/LG.png" alt="LG 트윈스" class="gallery-image">
                <p class="image-description">LG 트윈스</p>
            </div>
            <div style="text-align: center">
                <img src="image/Lotte.png" alt="롯데 자이언츠" class="gallery-image">
                <p class="image-description">롯데 자이언츠</p>
            </div>
            <div style="text-align: center">
                <img src="image/NC.png" alt="NC 다이노스" class="gallery-image">
                <p class="image-description">NC 다이노스</p>
            </div>
            <div style="text-align: center">
                <img src="image/Samsung.png" alt="삼성 라이온즈" class="gallery-image">
                <p class="image-description">삼성 라이온즈</p>
            </div>
            <div style="text-align: center">
                <img src="image/SSG.png" alt="SSG 랜더스" class="gallery-image">
                <p class="image-description">SSG 랜더스</p>
            </div>
        </div>
        <br><br>
        <div>
            <p style="text-align: center">
                ——————————————————————————————————————————————————————————————————
            </p>
            <p style="text-align: center; line-height: 1.8;">
                <b>야좌양은 아래 기관과 함께합니다. 감사합니다.</b><br>
                불닭볶음면 먹고 싶당
            </p>
        </div>
        <br>
        <div class="image-gallery">
            <img src="image/고용24.png" alt="고용24">
            <img src="image/고용노동부.png" alt="고용노동부">
            <img src="image/부산인재개발원.png" alt="부산인재개발원">
            <img src="image/불닭볶음면.png" alt="불닭볶음면">
        </div>
    </section>
    <footer id="footer">
        <p>배너 광고 문의,</p>
        <p>오류 제보는 언제든 메일 남겨주세요!</p>
        <p>(추첨을 통해 기프티콘 제공)</p>
        <p><b>baseballGive@naver.com</b></p>
    </footer>
</body>
</html>