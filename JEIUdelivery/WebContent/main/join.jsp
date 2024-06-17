<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Join Page</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css"/>
    <link rel="stylesheet" type="text/css" href="./css/join.css"/>
</head>
<body>
 <jsp:include page="../templates/header.jsp" flush="false" />

	<section class="container-fluid justify-content-center bg-light" id="main-container">
	    <div class="container">
	        <h1 class="display-3 text-center">Join</h1>
	    </div>
	
	                <form class="container mt-5" id="join-form" action="../register.do" method="post">
                <div class="row g-3">
                    <div class="form-group">
                        <label for="input-id" class="form-label">아이디</label>
                        <input type="text" name="userID" class="form-control" id="input-id" placeholder="아이디 입력" required/>
                    </div>
    
                    <div class="form-group">
                        <label for="input-pw" class="form-label">비밀번호</label>
                        <input type="password" name="userPW"  class="form-control" id="input-pw" placeholder="비밀번호 입력" required/>
                    </div>
    
                    <div class="form-group">
                        <label for="pw-check" class="form-label">비밀번호 재확인</label>
                        <input type="password" class="form-control" id="pw-check" placeholder="비밀번호 재확인" required/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="input-first-name" class="form-label">성</label>
                        <input type="text" name="userFname"  class="form-control" id="input-first-name" required/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="input-last-name" class="form-label">이름</label>
                        <input type="text" name="userLname"  class="form-control" id="input-last-name" required/>
                    </div>

                    <div class="form-group">
                        <label for="input-tel" class="form-label">전화번호</label>
                        <input type="text" name="userTel"  class="form-control" id="input-tel" required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="input-email" class="form-label">이메일</label>
                        <input type="email" name="userEmail"  class="form-control" input="input-email" required/>
                    </div>
                    
                    <div class="form-group col-12">
	                   <label for="input-birth-year" class="form-label">생년월일</label>
	                   <input type="text" class="form-control" name="userBirth"id="input-birth-year" placeholder="ex) 20040123" required/>
               		</div>
                    
                    <div class="form-group">
                        <label for="input-gender" class="form-label">성별</label>
                        <select name="userGender" class="form-control" id="input-gender" required/>
                            <option value="man">남자</option>
                            <option value="woman">여자</option>
                        </select>
                    </div>

                    
                    <div class="form-group">
                        <label for="userMajor" class="form-label">학과</label>
                        <select name="userMajor" class="form-control" id="input-college-major">
                            <option value="컴퓨터정보전공">컴퓨터 정보 전공</option>
                            <option value="시스템소프트웨어전공">시스템 소프트웨어 전공</option>
                            <option value="바이오학과">바이오학과</option>
                        </select>
                    </div>
                  
                    <div class="form-group">
                        <label for="input-school-num" class="form-label">학번</label>
                        <input type="text" name="userSnumber"class="form-control" id="input-school-num" required/>
                    </div>

                    <button class="btn btn-lg btn-outline-primary" id="join-btn">가입 완료</button>
	        </div>
	
	    </form>
	</section>

    <footer>

    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
</body>
</html>