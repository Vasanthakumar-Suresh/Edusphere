<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Edusphere Dashboard</title>
    <link rel="stylesheet" type="text/css" href="dbstyle.css">
</head>
<body>
    <div class="dashboard-container">
        <h1>🎓 Edusphere Dashboard</h1>
        <h3>Welcome, <%= session.getAttribute("email") %>!</h3>

        <div class="app-links">
            <a href="enote.jsp" class="app-card">📓 Enote - Notes Application</a>
            <a href="edutask.jsp" class="app-card">✅ Edutask - To-Do List</a>
            <a href="eduxplore.jsp" class="app-card">📂 Eduxplore - Assignment Submission</a>
        </div>

        <a href="LogoutServlet" class="logout-button">🚪 Logout</a>
    </div>
</body>
</html>
