package model;

import java.sql.Timestamp;

public class Note {
    private int id;
    private String userEmail;
    private String title;
    private String content;
    private Timestamp createdAt;

    public Note(int id, String userEmail, String title, String content, Timestamp createdAt) {
        this.id = id;
        this.userEmail = userEmail;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
    }

    public int getId() { return id; }
    public String getUserEmail() { return userEmail; }
    public String getTitle() { return title; }
    public String getContent() { return content; }
    public Timestamp getCreatedAt() { return createdAt; }
}
