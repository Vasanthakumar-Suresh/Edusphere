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
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .container { max-width: 600px; margin: auto; }
    </style>
</head>
<body>
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
