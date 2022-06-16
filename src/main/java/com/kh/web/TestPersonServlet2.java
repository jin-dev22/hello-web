package com.kh.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestPersonServlet2 extends HttpServlet{
	/**
	 * Post요청 처리시 doPost오버라이드
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 인코딩처리(POST 요청시 필수, 요청 메시지 바디부분 한글 깨질 수 있음)
		req.setCharacterEncoding("utf-8");
		
		//2. 사용자입력값 처리
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		String animal = req.getParameter("animal");
		String[] foods = req.getParameterValues("food");//값이 복수일 경우 ~Values()사용
		
		System.out.println("name = " + name);
		System.out.println("color = " + color);
		System.out.println("animal = " + animal);
		System.out.println("foods = " + (foods != null? Arrays.toString(foods) : null));
		
		//3. 업무로직
		
		//4. 응답메세지 작성
		//헤더(응답메시지 설정정보)
		resp.setContentType("text/html; charset=utf-8");
		
		//바디(html)
		PrintWriter out = resp.getWriter();//응답메세지를 대상으로하는 문자기반 출력스트림
		out.println("<!doctype html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8'>");
		out.println("<title>개인취향검사결과</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>개인취향검사결과" + req.getMethod() + "</h1>");		
		out.println("<p>이름 : "+ name + "</p>");		
		out.println("<p>선호색상 : "+ color + "</p>");		
		out.println("<p>선호동물 : "+ animal + "</p>");		
		out.println("<p>선호중국음식 : "+ (foods != null? Arrays.toString(foods) : "없음") + "</p>");		
		out.println("</body>");
		out.println("</html>");
	}
}
