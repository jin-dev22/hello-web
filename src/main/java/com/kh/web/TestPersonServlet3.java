package com.kh.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testPerson3.do")
public class TestPersonServlet3 extends HttpServlet{
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
		//추천서비스 만들기
		String recommendation = "";
		switch(color) {
		case"빨강" : recommendation = "빨간 초장을 버무린 회덮밥"; break;
		case"노랑" : recommendation = "산뜻한 노란 우산"; break;
		case"초록" : recommendation = "초록색 배춧입"; break;
		case"파랑" : recommendation = "파랑색 시원한 죠스바"; break;		
		}
		
		
		//4. 응답메세지 작성 -> jsp에 위임
		// jsp에 데이터 전달하는법. request에 속성으로 전달한다.
		req.setAttribute("recommendation", recommendation);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/testPersonResult.jsp");
		reqDispatcher.forward(req, resp);
		
	}
}
