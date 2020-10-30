<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajax.note.db.NoteDto"%>
<%@page import="java.util.List"%>
<%@page import="ajax.note.db.NoteDao"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoteDao dao = new NoteDao();
	List<NoteDto> list = dao.showDatas();
	
	JSONArray ja = new JSONArray();
	JSONObject jo = null;
	for(NoteDto dto : list){
		jo = new JSONObject();
		jo.put("num", dto.getNum());
		jo.put("title",dto.getTitle());
		jo.put("description", dto.getDescription());
		jo.put("commention", dto.getCommention());
		jo.put("image", dto.getImage());
		jo.put("dueDate", dto.getDueDate());
		ja.add(jo);
	}
%>
<%=ja.toString()%>