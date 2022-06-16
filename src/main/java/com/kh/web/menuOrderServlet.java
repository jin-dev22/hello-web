package com.kh.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/menuOrder.do")
public class menuOrderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.인코딩처리
		req.setCharacterEncoding("utf-8");
		
		//2.사용자입력값처리
		
		//3.업무로직
		int payment = 0;
		HashMap<String, Integer> priceTags = (HashMap<String, Integer>) req.getAttribute("priceTags");
		String mainMenu = req.getParameter("mainMenu");
		String sideMenu = req.getParameter("sideMenu");
		String drinkMenu = req.getParameter("drinkMenu");
		payment += priceTags.get(mainMenu);
		payment += priceTags.get(sideMenu);
		payment += priceTags.get(drinkMenu);
		
		
		//4.응답메세지->jsp
		req.setAttribute("payment", resp);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/menu/menuEnd.jsp");
		reqDispatcher.forward(req, resp);
		
	}
}
