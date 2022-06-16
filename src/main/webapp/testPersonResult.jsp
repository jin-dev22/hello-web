<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Arrays"%>
<%
	//<%~ jsp scriptlet : java코드 영역
	//request, response객체에 선언없이(servlet 매개변수없이) 접근가능. 아까 forward()에서 매개변수로 받았기 때문에..
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String animal = request.getParameter("animal");
	String[] foods = request.getParameterValues("food");
	
	System.out.println("name@jsp = " + name);
	System.out.println("color@jsp = " + color);
	System.out.println("animal@jsp = " + animal);
	System.out.println("food@jsp = " + (foods != null ? Arrays.toString(foods): null));
	
	String recommendation = (String) request.getAttribute("recommendation");
	System.out.println("recommendation@jsp =" + recommendation);
%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>개인취향검사결과</title>
</head>
<body>
<h1>개인취향검사결과 <%=request.getMethod() %></h1>
<p>이름 : <%= name %></p><%-- 출력식 --%>
<p>선호색상 : <%= color %></p>
<p>선호동물 : <%= animal %></p>
<p>선호중국음식 : <%= foods != null ? Arrays.toString(foods) : "없음" %></p>
<hr />
<h2><span><%=name %></span>님, 오늘은 <mark><%=recommendation %></mark>어떠세요?</h2>
</body>
</html>