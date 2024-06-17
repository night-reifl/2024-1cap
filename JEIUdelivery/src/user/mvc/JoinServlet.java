package user.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register.do")
public class JoinServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        // 초기화 코드 필요 시 작성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청 처리 필요 시 작성
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	request.setCharacterEncoding("UTF-8");
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        String userFname = request.getParameter("userFname");
        String userLname = request.getParameter("userLname");
        String userTel = request.getParameter("userTel");
        String userEmail = request.getParameter("userEmail");
        String userBirth = request.getParameter("userBirth");
        String userGender = request.getParameter("userGender");
        String userMajor = request.getParameter("userMajor");
        String userSnumber = request.getParameter("userSnumber");

        UserDTO mDTO = new UserDTO();
        mDTO.setUserID(userID);
        mDTO.setUserPW(userPW);
        mDTO.setUserFname(userFname);
        mDTO.setUserLname(userLname);
        mDTO.setUserTel(userTel);
        mDTO.setUserEmail(userEmail);
        mDTO.setUserBirth(userBirth);
        mDTO.setUserGender(userGender);
        mDTO.setUserMajor(userMajor);
        mDTO.setUserSnumber(userSnumber);

        UserDAO userDao = new UserDAO();
        boolean isRegistered = userDao.memberInsert(mDTO);

        if (isRegistered) {
            // 회원가입이 성공했을 때
            String successMessage = "회원가입이 성공적으로 완료되었습니다.";
            request.setAttribute("message", successMessage);
            request.setAttribute("redirect", "../JEIUdelivery/main/index.jsp");
        } else {
            // 회원가입이 실패했을 때
            String errorMessage = "회원가입에 실패했습니다. 다시 시도해 주세요.";
            request.setAttribute("message", errorMessage);
            request.setAttribute("redirect", "register.jsp");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/main/JoinSuccess.jsp");
        dispatcher.forward(request, response);
    }
}
