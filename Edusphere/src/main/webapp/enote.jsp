<%@ page import="java.util.List" %>
<%@ page import="model.Note" %>
<%@ page import="dao.NoteDAO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userEmail = (String) sessionUser.getAttribute("email");
    List<Note> notes = NoteDAO.getNotes(userEmail);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enote - Manage Your Notes</title>
    <link rel="stylesheet" href="enotestyles.css"> 
</head>
<body >
    <div class="navbar">
        <a href="dashboard.jsp">🏠 Home</a>
        <a href="enote.jsp">📓 Enote</a>
        <a href="edutask.jsp">✅ Edutask</a>
        <a href="eduxplore.jsp">📂 Eduxplore</a>
        <a href="https://ksm05.github.io/eduscribe/">📂 Eduscribe</a>
        <a href="LogoutServlet" class="logout-button">🚪 Logout</a>
    </div>
    <div class="container">
        <h2>Welcome to Enote</h2>

        <form action="AddNoteServlet" method="post">
            <input type="text" name="title" placeholder="Title" required>
            <textarea name="content" placeholder="Enter your note here..." required></textarea>
            <button type="submit">Add Note</button>
        </form>

        <h3>Your Notes:</h3>
        
        <% for (Note note : notes) { %>
            <div class="note">
                <div>
                    <h4><%= note.getTitle() %></h4>
                    <p><%= note.getContent() %></p>
                </div>
                <div class="note-actions">
                    <form action="ViewNoteServlet" method="get">
                        <input type="hidden" name="noteId" value="<%= note.getId() %>">
                        <button type="submit">View</button>
                    </form>

                    <form action="edit_note.jsp" method="get">
                        <input type="hidden" name="noteId" value="<%= note.getId() %>">
                        <input type="hidden" name="title" value="<%= note.getTitle() %>">
                        <input type="hidden" name="content" value="<%= note.getContent() %>">
                        <button type="submit" class="edit-btn">Edit</button>
                    </form>

                    <form action="DeleteNoteServlet" method="post">
                        <input type="hidden" name="noteId" value="<%= note.getId() %>">
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>