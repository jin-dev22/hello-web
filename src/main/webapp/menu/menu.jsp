<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 메뉴</title>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 10px;
}
</style>
<script src="/web/js/jquery-3.6.0.js"></script>
<%
// servlet에서 계산해야됨 -> 가격표 자바 해시맵으로 만들어서 servlet에 전달하는 방법 있는지 찾아보기
	int payment = 0;
	HashMap<String, Integer> priceTags = new HashMap<>();
	//자바로는 document.querySelectorAll 같은거 없는지 찾아보기
	priceTags.put("한우버거", 5000);
	priceTags.put("밥버거", 4500);
	priceTags.put("치즈버거", 4000);
	priceTags.put("감자튀김", 1500);
	priceTags.put("어니언링", 1700);
	priceTags.put("콜라", 1000);
	priceTags.put("사이다", 1000);
	priceTags.put("커피", 1500);
	priceTags.put("밀크쉐이크", 2500);
	
	//servlet에 전달하는 방법은...?
	//session사용해보기 ----------
	session.setAttribute("priceTags", priceTags);
	
%>	
</head>
<body>
	<h2>
		오늘의 메뉴 <sub style="color: lightgray"><%@ include file="/menu/today.jsp" %></sub>
	</h2>

	<table>
		<tr>
			<th>메뉴</th>
			<th>품목</th>
			<th>가격</th>
		</tr>
		<tr>
			<td rowspan="3">메인메뉴</td>
			<td>한우버거</td>
			<td>5000원</td>
		</tr>
		<tr>
			<td>밥버거</td>
			<td>4500원</td>
		</tr>
		<tr>
			<td>치즈버거</td>
			<td>4000원</td>
		</tr>
		<tr>
			<td rowspan="2">사이드메뉴</td>
			<td>감자튀김</td>
			<td>1500원</td>
		</tr>
		<tr>
			<td>어니언링</td>
			<td>1700원</td>
		</tr>
		<tr>
			<td rowspan="4">음료메뉴</td>
			<td>콜라</td>
			<td>1000원</td>
		</tr>
		<tr>
			<td>사이다</td>
			<td>1000원</td>
		</tr>
		<tr>
			<td>커피</td>
			<td>1500원</td>
		</tr>
		<tr>
			<td>밀크쉐이크</td>
			<td>2500원</td>
		</tr>
	</table>
	<br />
	<br />

	<form name="menuFrm" action="<%= request.getContextPath() %>/menuOrder.do" method="post">
		<label for="mainMenu">메인메뉴 :</label> <select id="mainMenu"
			name="mainMenu" required>
			<option value="" disabled selected>햄버거를 선택하세요.</option>
			<option value="한우버거">한우버거</option>
			<option value="치즈버거">치즈버거</option>
			<option value="밥버거">밥버거</option>
		</select> <br />
		<br /> <label for="sideMenu">사이드메뉴 :</label> <select id="sideMenu"
			name="sideMenu" required>
			<option value="" disabled selected>사이드메뉴를 선택하세요.</option>
			<option value="감자튀김">감자튀김</option>
			<option value="어니언링">어니언링</option>
		</select> <br />
		<br /> <label for="drinkMenu">음료메뉴 :</label> <select id="drinkMenu"
			name="drinkMenu" required>
			<option value="" disabled selected>음료를 선택하세요.</option>
			<option value="콜라">콜라</option>
			<option value="사이다">사이다</option>
			<option value="커피">커피</option>
			<option value="밀크쉐이크">밀크쉐이크</option>
		</select> <br />
		<br /> <input type="submit" value="주문" />&nbsp; <input type="reset"
			value="취소" />
	</form>
</body>
</html>
