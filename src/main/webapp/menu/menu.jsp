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
<script>
	function today(){
         function f(n){
             return n < 10 ? "0" + n : n;
         }
         const now = new Date();
         const yyyy = now.getFullYear();
         const MM = f(now.getMonth() +1);
         const dd = f(now.getDate());
         const day = now.getDay();
         const days = ['일', '월', '화', '수', '목', '금', '토'];		         
         return `${'${yyyy}'}년 ${'${MM}'}월  ${'${dd}'}일 ${'${days[day]}'}요일`;
	}
 
	function getPriceTags(){
		const menulist = [];		    	
		document.querySelectorAll("tr td:nth-last-child(2)").forEach((elem)=>{
		 menulist.push(elem.innerHTML);
		});
		const pricelist = [];
		document.querySelectorAll("tr td:last-child").forEach((elem)=>{
		           const priceStr = elem.innerHTML;
		           const price = priceStr.substring(0, (priceStr.length-1));
		 pricelist.push(price);
		})
		
		const priceTags = {};
		for(let i = 0; i < menulist.length; i++){
		 priceTags[menulist[i]] = pricelist[i];
		}
		
		return priceTags;
     } 
      
     window.onload = ()=>{
  	   document.querySelector("h2 sub").innerHTML = today();
     }

</script>
<%
// 가격표 자바 해시맵으로 만들어서 servlet에 전달하는 방법 있는지 찾아보기
%>
</head>
<body>
	<h2>
		오늘의 메뉴 <sub style="color: lightgray"></sub>
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

	<form name="menuFrm" action="/web/menuOrder.do" method="post">
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
