<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="oracle.db.OracleConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/JSON; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from ajaxboard order by num asc";
	OracleConnect db = OracleConnect.getInstance();
	conn = db.getConnection();
	JSONArray arr = new JSONArray(); 
	try{
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int num = rs.getInt("num");
			String writer = rs.getString("writer");
			String subject = rs.getString("subject");
			String content = rs.getString("content");
			String photo = rs.getString("photo");
			Timestamp writeday = rs.getTimestamp("writeday");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			// json형태로 만든후 arr에 추가하기
			JSONObject ob = new JSONObject();
			ob.put("num",num);
			ob.put("writer",writer);
			ob.put("subject",subject);
			ob.put("content",content);
			ob.put("photo",photo);
			ob.put("writeday",df.format(writeday));
			
			arr.add(ob);
		}
	}catch(SQLException e){
		System.out.println("board json 변환시 sql 오류:" +e.getMessage());
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
%>
<%=arr.toString() %>