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
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; padding: 20px; }
        .container { max-width: 600px; margin: auto; }
        .note { border: 1px solid #ddd; padding: 10px; margin-bottom: 10px; padding: 10px; }
        form { margin-bottom: 20px; display: inline; }
        input, textarea { width: 100%; padding: 8px; margin: 5px 0; }
        button { background: blue; color: white; padding: 8px; border: none; cursor: pointer; }
        .edit-btn { background: orange; }
        .delete-btn { background: red; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Enote</h2>

        <!-- ✅ Add Note Form -->
        <form action="AddNoteServlet" method="post">
            <input type="text" name="title" placeholder="Title" required>
            <textarea name="content" placeholder="Enter your note here..." required></textarea>
            <button type="submit">Add Note</button>
        </form>

        <h3>Your Notes:</h3>
        
        <% for (Note note : notes) { %>
            <div class="note">
                <h4><%= note.getTitle() %></h4>
                <p><%= note.getContent() %></p>
                
                <!-- View Note -->
                <form action="ViewNoteServlet" method="get">
                    <input type="hidden" name="noteId" value="<%= note.getId() %>">
                    <button type="submit">View</button>
                </form>

                <!-- Edit Note -->
                <form action="edit_note.jsp" method="get">
                    <input type="hidden" name="noteId" value="<%= note.getId() %>">
                    <input type="hidden" name="title" value="<%= note.getTitle() %>">
                    <input type="hidden" name="content" value="<%= note.getContent() %>">
                    <button type="submit" class="edit-btn">Edit</button>
                </form>

                <!-- Delete Note -->
                <form action="DeleteNoteServlet" method="post">
                    <input type="hidden" name="noteId" value="<%= note.getId() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </div>
        <% } %>
    </div>
</body>
</html>
