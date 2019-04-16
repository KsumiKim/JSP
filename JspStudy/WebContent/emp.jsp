------------------------------------------db 연결: db와 연결하기 전에는 db 서버가 구동 중인지 
확인해야 한다. (서비스 -> mySQL 확인한다.
1. log4sql : 라이브러리를 받아서 WebContent의 lib 밑에 넣어준다. 

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
try {
	DBManager db = DBManager.getInstance();
	Connection con = db.open();
	
	// 3. Query 실행 준비
	String sql = "select empno, ename, job, hiredate from emp";
	PreparedStatement stmt = con.prepareStatement(sql);
	
	// 4. Query 실행
	ResultSet rs = stmt.executeQuery();
%>
	<table border="1">
		<tr><td>번호</td><td>이름</td><td>직무</td><td>일자</td></tr>
<%	
	while(rs.next()) {
		out.println("<tr>");
		int empno = rs.getInt("empno");
		String ename = rs.getString("ename");
		String job = rs.getString("job");
		String hiredate = rs.getString("hiredate");
		out.println("<td>" + empno + "</td>");
		out.println("<td>" + ename + "</td>");
		out.println("<td>" + job + "</td>");
		out.println("<td>" + hiredate + "</td>");
		out.println("</tr>");
	}
%>
	</table>
<%
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>



<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
try {
	DBManager db = DBManager.getInstance(); //db Manager 코드를 활용해서 바로 db에 접속한다. 
	Connection con = db.open(); 
	
	// 3. Query ½ÇÇà ÁØºñ
	String sql = "select id, name from test";
	PreparedStatement stmt = con.prepareStatement(sql);
	
	// 4. Query ½ÇÇà
	ResultSet rs = stmt.executeQuery();
	while(rs.next()) {
		int id2 = rs.getInt("id");
		String name = rs.getString("name");
		out.println(id2 + "  " + name);
	}
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>



db 접속 코드-------------------------------------------------------------------

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {	// 내 ip/db이름 으로 변경한다.
	private String url = "jdbc:mysql://localhost:3306/java";
	private String id = "root";
	private String pw = "mysql";
	private Connection con = null;
	// private static Connector connector = new Connector();
	private static DBManager connector = null;

	private DBManager() {
	}

	public synchronized static DBManager getInstance() {
		if (connector == null) {
			connector = new DBManager();
		}
		return connector;
	}

	public Connection open() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver"); // 전달인자 안에 이렇게 넣어주면 jsp 파일 실행 시 나오는 
오류 문구를 좀 더 보기 편하게 바꿔준다.
		con = DriverManager.getConnection(url, id, pw);
		return con;
	}

	public void close(Connection con, PreparedStatement stmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
