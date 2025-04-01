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
    <link rel="stylesheet" href="view_notestyles.css">
</head>
<body>
    <div class="navbar">
        <a href="dashboard.jsp">🏠 Home</a>
        <a href="enote.jsp">📓 Enote</a>
        <a href="edutask.jsp">✅ Edutask</a>
        <a href="eduxplore.jsp">📂 Eduxplore</a>
        <a href="https://ksm05.github.io/eduscribe/">📂 Eduscribe</a>
        <a href="LogoutServlet" class="logout-button">🚪 Logout</a>
    </div>
    <div class="container">
        <h2><%= note.getTitle() %></h2>
        <p><%= note.getContent() %></p>
        <a href="enote.jsp">Back to Notes</a>
    </div>
</body>
</html>