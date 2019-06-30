textarea-----------------------------------------------------------------

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form method="post" action="textarea_proc.jsp">
	<textarea name="content"></textarea>
	<input type="submit">
</form>

form은 jsp 기본 문법, form 관련 html 테그들을 찾아보자. 
submit을 해야 webContainer가 받을 수 있음

textarea_proc------------------------------------------------------------
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr"); // 한글 안 깨지게 함.
	String content = request.getParameter("content");
	content = content.replace("\n", "<br>"); // 줄 바꿈이 웹에 표현되게 함.
%>

<%=content%>
<textarea><%=content%></textarea>


둘 다 서버에 존재하지만 textarea는 클라이언트, textarea_proc는 서버를 담당한다고 보면 됨.
1. 클라이언트에서는 html 문법을 사용하여 사용자가 코드를 통해 원하는 것을 추가한다.
2. 서버와 소통 시에는 jsp, java 문법을 사용한다. 
