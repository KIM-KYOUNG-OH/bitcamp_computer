<%@page import="ajax.note.db.NoteDao"%>
<%@page import="ajax.note.db.NoteDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String commention = request.getParameter("commention");
	String image = request.getParameter("image");
	String dueDate = request.getParameter("dueDate");
	
	NoteDto dto = new NoteDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setDescription(description);
	dto.setCommention(commention);
	dto.setImage(image);
	dto.setDueDate(dueDate);
	
	NoteDao dao = new NoteDao();
	dao.updateData(dto);
%>