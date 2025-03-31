package servlet;

import java.io.IOException;
import model.Note;
import dao.NoteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ViewNoteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int noteId = Integer.parseInt(request.getParameter("noteId"));
            Note note = NoteDAO.getNoteById(noteId);

            if (note != null) {
                request.setAttribute("note", note);
                request.getRequestDispatcher("view_note.jsp").forward(request, response);
            } else {
                response.getWriter().println("❌ Note not found.");
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("❌ Invalid Note ID.");
        }
    }
}
