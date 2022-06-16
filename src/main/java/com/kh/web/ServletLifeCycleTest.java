package com.kh.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet
 * - GenericServlet(추상클래스) : Servlet 인터페이스를 구현하고 있음
 * 		-> HttpServlet(추상클래스)
 * 			-> ServletLifeCycle
 * - 사용자 요청이 접수되면 HttpServlet#service 메소드가 호출, 그 안에서 전송 방식에 따라 doGet/doPost호출
 * 
 * - Servlet은 tomcat(WAS/Web Container)에 의해 Singletone패턴으로 관리된다.
 * 	(Singletone: 프로그램 운영중에 단 하나의 객체만 만들어서 운영(요청여러번 들어와도 객체 하나 만들어둔거 계속 사용)) 
 * - 사용자 요청 당 하나의 스레드가 생성되어 처리(응답성 향상)
 * 
 * - Servlet LifeCycle
 * 1. 생성자 호출
 * 2. init호출
 * 
 * 3. service - doGet/doPost 호출
 * 
 * 4. destroy 호출
 * 
 * @WebServlet -> web.xml의 url-pattern과 servlet클래스 바인딩하는것과 동일한 작업을 한다. 이거쓰면 web.xml파일에 따로 등록 안해도 됨
 */
@WebServlet("/servlet/lifeCycle.do")
public class ServletLifeCycleTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLifeCycleTest() {
    	System.out.println("[ServletLifeCycleTest 생성자 호출]");
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("[inint 호출]");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("[destroy 호출]");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[GET /servlet/lifeCycle.do 호출!]");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
