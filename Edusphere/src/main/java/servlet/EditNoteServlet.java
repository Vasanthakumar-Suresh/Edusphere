package servlet;

import java.io.IOException;
import dao.NoteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int noteId = Integer.parseInt(request.getParameter("noteId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        boolean success = NoteDAO.updateNote(noteId, title, content);

        if (success) {
            response.sendRedirect("enote.jsp");
        } else {
            response.getWriter().println("Error updating note.");
        }
    }
}
