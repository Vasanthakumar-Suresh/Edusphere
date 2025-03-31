<%@ page import="model.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Note note = (Note) request.getAttribute("note");
    if (note == null) {
        response.sendRedirect("enote.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Note</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .container { max-width: 600px; margin: auto; }
    </style>
</head>
<body>
    <div class="container">
        <h2><%= note.getTitle() %></h2>
        <p><%= note.getContent() %></p>
        <a href="enote.jsp">Back to Notes</a>
    </div>
</body>
</html>
