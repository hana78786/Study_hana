package hello.servlet.basic.request;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name="requestParamServlet", urlPatterns = "/request-param")
public class RequestParamServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("전체 파라메터 조회 start");

        request.getParameterNames().asIterator().forEachRemaining(paramName -> System.out.println(paramName + "=" + request.getParameter(paramName)));
        System.out.println("전체 파라메터 조회 end");
        System.out.println();
        System.out.println("단일파라메터 조회");
        String username = request.getParameter("username");
        String age = request.getParameter("age");
        System.out.println("age = "+ age);
        System.out.println("name ="+ username);
        System.out.println("이름같음");
        String[] usernames = request.getParameterValues("username");
        for (String name : usernames){
            System.out.println("username =-" + name);
        }

        response.getWriter().write("ok"); //응답보내기
    }
}