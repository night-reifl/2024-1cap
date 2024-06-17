package user.mvc;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login.do")
public class LoginServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        // 초기화 작업 (필요 시)
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청 처리 (필요 시)
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");

        UserDAO userDao = new UserDAO();
        UserDTO user = userDao.loginCheck(userID, userPW);

        if (user != null) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("loginCheck", userID);
            session.setAttribute("userName", user.getUserFname() + " " + user.getUserLname());
            session.setAttribute("UserDTO", user);
            // 로그 확인
            System.out.println("로그인 성공: " + userID + ", " + user.getUserFname() + " " + user.getUserLname());

            // 로그인 성공 메시지를 alert로 표시하고 메인 페이지로 이동
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('로그인 성공'); location.href='../JEIUdelivery/main/index.jsp';</script>");
            
        } else {
            // 로그인 실패 메시지를 alert로 표시하고 로그인 페이지로 이동
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인 해주세요.'); location.href='../JEIUdelivery/main/login.jsp';</script>");
            
            // 로그 확인
            System.out.println("로그인 실패: " + userID);
        }
    }
}
