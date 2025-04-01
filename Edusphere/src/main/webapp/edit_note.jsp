<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String noteId = request.getParameter("noteId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Note</title>
    <link rel="stylesheet" href="edit_notestyles.css">
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
        <h2>Edit Note</h2>
        <form action="EditNoteServlet" method="post">
            <input type="hidden" name="noteId" value="<%= noteId %>">
            <input type="text" name="title" value="<%= title %>" required>
            <textarea name="content" required><%= content %></textarea>
            <button type="submit">Save Changes</button>
        </form>
        <a href="enote.jsp">Cancel</a>
    </div>
</body>
</html>