<%@ page import="model.Note" %>
<%@ page import="dao.NoteDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String noteIdParam = request.getParameter("noteId");
    if (noteIdParam == null) {
        response.sendRedirect("enote.jsp");
        return;
    }

    int noteId = Integer.parseInt(noteIdParam);
    Note note = NoteDAO.getNoteById(noteId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Note</title>
</head>
<body>
    <h2>View Note</h2>
    <h3>Title: <%= note.getTitle() %></h3>
    <p><%= note.getContent() %></p>
    <a href="enote.jsp">Back to Notes</a>
</body>
</html>
