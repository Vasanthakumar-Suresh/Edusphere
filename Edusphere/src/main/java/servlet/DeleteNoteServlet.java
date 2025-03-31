package servlet;

import java.io.IOException;
import dao.NoteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("noteId"));
        boolean success = NoteDAO.deleteNote(noteId);

        if (success) {
            response.sendRedirect("enote.jsp");
        } else {
            response.getWriter().println("Error deleting note.");
        }
    }
}
