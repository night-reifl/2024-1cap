<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>메인 페이지</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="./css/default.css"/>
        <link rel="stylesheet" type="text/css" href="./css/index.css"/>
    </head>

    <body>
        <jsp:include page="../templates/header.jsp"/>

        <!-- 히어로 섹션 -->
        <section class="hero-section text-center bg-light py-5">
            <div class="container">
                <h1 class="display-4">함께 주문하고, 함께 절약하세요!</h1>
                <p class="lead">JEIU delivery은 여러분이 같은 음식점을 주문하려는 사람들과 연결하여 배달비를 절약할 수 있도록 돕습니다.</p>
                <a href="join.jsp" class="btn btn-primary btn-lg mt-3">지금 시작하기</a>
            </div>
        </section>

        <!-- 사이트 소개 -->
        <section class="about-section py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="main.png" class="img-fluid" alt="소개 이미지">
                    </div>
                    <div class="col-md-6">
                        <h2>소개</h2>
                        <p>JEIU delivery에 오신 것을 환영합니다! 우리는 같은 음식점을 주문하려는 사람들을 연결하여 배달비를 절약할 수 있도록 돕습니다.</p>
                        <p>지금 가입하고 절약을 시작해보세요!</p>
                        <a href="about.jsp" class="btn btn-secondary mt-3">자세히 알아보기</a>
                    </div>
                </div>
            </div>
        </section>

			<section class="recommended-section py-5">
                <div class="container">
                    <h2 class="text-center mb-4" style="font-weight:bold;">이런 사람들에게 추천합니다</h2>
                    <div class="row text-center">
                        <div class="col-md-4 mb-4">
                            <div class="icon mb-2">
                                <img src="delivery.png" style="width: 200px" alt="배달비 절약을 원하는 사람">
                            </div>
                            <h4>배달비 절약을 원하는 사람</h4>
                            <p class="texts">여러 명이 함께 주문하여 배달비를 1/n으로 줄이고 싶은 분들께 추천합니다.</p>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="icon mb-2">
                                <img src="eco.png" style="width:200px" alt="환경 보호에 관심이 있는 사람">
                            </div>
                            <h4>환경 보호에 관심이 있는 사람</h4>
                            <p class="texts">배달 거리를 줄여 탄소 배출을 줄이고 싶은 분들께 추천합니다.</p>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="icon mb-2">
                                <img src="esey.png" style="width:200px" alt="간편한 주문을 원하는 사람">
                            </div>
                            <h4>간편한 주문을 원하는 사람</h4>
                            <p class="texts">한 명이 대표로 주문을 하여 번거로운 주문 과정을 피하고 싶은 분들께 추천합니다.</p>
                        </div>
                    </div>
                </div>
            </section>



        <footer class="footer mt-auto py-3 bg-light">
			<jsp:include page="../templates/footer.jsp"></jsp:include>
        </footer>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
