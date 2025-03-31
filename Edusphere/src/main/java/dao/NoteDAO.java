package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;
import model.Note;

public class NoteDAO {

    public static boolean addNote(String userEmail, String title, String content) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO notes (user_email, title, content) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            stmt.setString(2, title);
            stmt.setString(3, content);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Note> getNotes(String userEmail) {
        List<Note> notes = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM notes WHERE user_email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Note note = new Note(
                    rs.getInt("id"), 
                    rs.getString("user_email"), 
                    rs.getString("title"), 
                    rs.getString("content"), 
                    rs.getTimestamp("created_at")
                );
                notes.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notes;
    }

    public static boolean deleteNote(int noteId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM notes WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, noteId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static Note getNoteById(int noteId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM notes WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, noteId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Note(
                    rs.getInt("id"), 
                    rs.getString("user_email"), 
                    rs.getString("title"), 
                    rs.getString("content"), 
                    rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean updateNote(int noteId, String title, String content) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE notes SET title = ?, content = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, noteId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
