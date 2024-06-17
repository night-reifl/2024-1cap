<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>소개</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/default.css"/>
        <link rel="stylesheet" type="text/css" href="../css/about.css"/>
        <style>
            .image-container {
                position: relative;
                text-align: center;
                color: white;
                margin-bottom: 20px;
            }
            .text-over-image {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.5); 
                padding: 10px;
                border-radius: 5px;
                font-size: 2rem; 
            }
        </style>
    </head>

    <body>
        <jsp:include page="../templates/header.jsp"/>

        <!-- 소개 섹션 -->
        <section class="about-section">
            <div class="container">
                <div class="image-container">
                    <img src="back.png" class="img_b" alt="Background Image">
                    <div class="text-over-image">
                        <h2>사이트소개</h2>
                    </div>
                </div>
                <div class="row text-center mt-4">
                    <div class="col-md-3 mb-4">
                        <div class="icon mb-2">
                            
                        </div>
                        <h4>배달비 절약</h4>
                        <ul class="list-unstyled texts">
                            <li>같이 주문한 인원 수에 따라 배달비가 <span class="highlight">1/n으로</span> 줄어들기 때문입니다.</li>
                            <li>내가 부담해야 할 배달비가 현재보다 <span class="highlight">낮아집니다.</span></li>
                        </ul>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="icon mb-2">
                            
                        </div>
                        <h4>낮은 배달 부담</h4>
                        <ul class="list-unstyled texts">
                            <li>가게들도 배달비를 제외한 매출을 남기기 위해 <span class="highlight">최소주문금액이 높은 경우가</span> 많습니다.</li>
                            <li>하지만 여러 명이 같이 시키게 될 경우 <span class="highlight">최소주문금액을</span> 맞추기 쉬워져 원하는 양만큼만 주문을 할 수 있게 됩니다.</li>
                        </ul>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="icon mb-2">
                            
                        </div>
                        <h4>주문의 번거로움 최소화</h4>
                        <ul class="list-unstyled texts">
                            <li>기존에 여러 명이 각각 배달을 시키는 것에서, <span class="highlight">한 명만 주문을 해도 됩니다.</span></li>
                            <li>가게의 입장에서도 기본적으로 여러 개의 주문을 받지 않고, <span class="highlight">하나의 주문을 통해</span> 오더를 관리하도록 더욱 편리해집니다.</li>
                        </ul>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="icon mb-2">
                            
                        </div>
                        <h4>친환경</h4>
                        <ul class="list-unstyled texts">
                            <li>배달원들이 이동하는 거리가 줄어들기 때문에 <span class="highlight">환경에 기여할</span> 수 있습니다.</li>
                            <li>한 명만 주문을 하므로 사이트의 <span class="highlight">트래픽 사용량도</span> 줄어듭니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- 이용 방법 섹션 -->
        <section class="how-it-works-section py-5 bg-light">
            <div class="container">
                <h2 class="text-center mb-4">이용 방법</h2>
                <div class="row">
                    <div class="col-md-4 text-center">
                        <div class="step-icon mb-3">
                            
                        </div>
                        <h4>Step 1</h4>
                        <p>웹사이트에 접속하여 원하는 음식을 선택하고 주문 방을 만듭니다.</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="step-icon mb-3">
                            
                        </div>
                        <h4>Step 2</h4>
                        <p>친구나 이웃에게 주문 방 링크를 공유하여 함께 주문할 사람을 모집합니다.</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="step-icon mb-3">
                            
                        </div>
                        <h4>Step 3</h4>
                        <p>모든 주문이 완료되면, 카카오페이 QR코드 결제 시스템을 통해 간편하게 결제합니다.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- 사용자 리뷰 섹션 -->
        <section class="user-reviews-section py-5">
            <div class="container">
                <h2 class="text-center mb-4">사용자 리뷰</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="review-card p-3 h-100">
                            <p class="review-text">"정말 편리하게 여러 명이 함께 주문할 수 있어서 배달비도 절약되고 좋아요!"</p>
                            <p class="review-author"></p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="review-card p-3 h-100">
                            <p class="review-text">"환경 보호에도 도움이 되고, 여러 명이서 같이 시키니 주문도 간편해졌어요."</p>
                            <p class="review-author"></p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="review-card p-3 h-100">
                            <p class="review-text">"친구들과 함께 주문해서 할인도 받고, 배달비도 아낄 수 있어서 너무 좋아요."</p>
                            <p class="review-author"></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="footer mt-auto py-3 bg-light">
            <div class="container text-center">
                <span class="text-muted">© 2024 [사이트명]. All rights reserved.</span>
            </div>
        </footer>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./js/about.js"></script>
    </body>
</html>
