<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajax.mem.db.MemoDto"%>
<%@page import="ajax.mem.db.MemoDao"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemoDao dao = new MemoDao();
	String num = request.getParameter("num");
	MemoDto dto = dao.getData(num);
	JSONObject ob = new JSONObject();
	ob.put("num", dto.getNum());
	ob.put("nickname", dto.getNickname());
	ob.put("content", dto.getContent());
	ob.put("avata", dto.getAvata());
%>
<%=ob.toString()%>