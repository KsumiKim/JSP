<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%!
	public String method() {
		return "�޼ҵ����";
	}
%>
<%
	// ��ũ��Ʋ�� Scriptlet
	String n = method();
	out.print(n);
	String name = "";
	name = "JSP";
	out.println(name);
%>
<br>
	<%=name%>








