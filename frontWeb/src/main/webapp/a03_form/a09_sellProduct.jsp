<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	ex) a09_sellProduct.jsp
		물건명:[    ] 구매갯수:[  ]
		[구매]
		
		구매내역
		물건명 : @@@
		갯수 : @@
	 -->
	<h2>물건구매</h2>
	<form method="post">
		물건명:<input type="text" name="name"/><br>
		가격:<input type="text" name="price"/><br>
		구매갯수:<input type="text" name="cnt"/><br>
		<input type="submit" value="구매"/>
	</form>
	
	<h4>구매내역</h4>
	물건명:${param.name}<br>
	가격:${param.price}<br>
	갯수:${param.cnt}<br>
	총계:${param.price*param.cnt}<br>
</body>
</html>