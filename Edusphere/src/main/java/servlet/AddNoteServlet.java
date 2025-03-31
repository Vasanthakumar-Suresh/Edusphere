package servlet;

import java.io.IOException;
import dao.NoteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Don't create a new session if it doesn't exist
        
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp"); // Redirect if session is invalid
            return;
        }

        String userEmail = (String) session.getAttribute("email");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        boolean success = NoteDAO.addNote(userEmail, title, content);

        if (success) {
            response.sendRedirect("enote.jsp"); // ✅ Redirect to Enote after adding note
        } else {
            response.getWriter().println("Error adding note.");
        }
    }
}
