<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과 페이지</title>
<style>
span#mainMenu {
	color: navy;
	font-size: 2em;
}

span#sideMenu {
	color: indigo;
	font-size: 1.5em;
}

span#drinkMenu {
	color: yellowgreen;
}

span#price {
	color: maroon;
	font-size: 2.5em;
}
</style>
</head>
<body>
	<h2>감사합니다.</h2>
	<span id="mainMenu"><%=request.getParameter("mainMenu") %></span>,
	<span id="sideMenu"><%=request.getParameter("sideMenu") %></span>,
	<span id="drinkMenu"><%=request.getParameter("drinkMenu") %></span>을/를 주문하셨습니다.
	<br /> 총 결제금액은
	<span id="price"><%=request.getAttribute("payment") %>원</span> 입니다.
</body>
</html>
