package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("noteId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        response.sendRedirect("editNote.jsp?noteId=" + noteId + "&title=" + title + "&content=" + content);
    }
}
