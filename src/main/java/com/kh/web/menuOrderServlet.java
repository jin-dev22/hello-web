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
		String mainMenu = req.getParameter("mainMenu");
		String sideMenu = req.getParameter("sideMenu");
		String drinkMenu = req.getParameter("drinkMenu");
		
		//3.업무로직
		int payment = 0;
		HashMap<String, Integer> priceTags = new HashMap<>();
		priceTags.put("한우버거", 5000);
		priceTags.put("밥버거", 4500);
		priceTags.put("치즈버거", 4000);
		priceTags.put("감자튀김", 1500);
		priceTags.put("어니언링", 1700);
		priceTags.put("콜라", 1000);
		priceTags.put("사이다", 1000);
		priceTags.put("커피", 1500);
		priceTags.put("밀크쉐이크", 2500);
		payment += priceTags.get(mainMenu);
		payment += priceTags.get(sideMenu);
		payment += priceTags.get(drinkMenu);
		
		
		//4.응답메세지->jsp
		req.setAttribute("payment", payment);
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/menu/menuEnd.jsp");
		reqDispatcher.forward(req, resp);
		
	}
}
