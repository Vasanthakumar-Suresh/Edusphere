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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <div class="navbar">
        <a href="dashboard.jsp">🏠 Home</a>
        <a href="enote.jsp">📓 Enote</a>
        <a href="edutask.jsp">✅ Edutask</a>
        <a href="eduxplore.jsp">📂 Eduxplore</a>
        <a href="https://ksm05.github.io/eduscribe/">📂 Eduscribe</a>
        <a href="LogoutServlet" class="logout-button">🚪 Logout</a>
    </div>

    <div class="hero-section">
        <div class="hero-content">
            <h1>Lets E-learning at your home</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
            <div class="hero-buttons">
                <a href="#" class="apply-now-button">Apply now</a>
                <a href="#" class="read-more-button">Read More</a>
            </div>
            <div class="social-icons">
                <a href="#"><img src="facebook-icon.png" alt="Facebook"></a>
                <a href="#"><img src="twitter-icon.png" alt="Twitter"></a>
                <a href="#"><img src="instagram-icon.png" alt="Instagram"></a>
                <a href="#"><img src="linkedin-icon.png" alt="LinkedIn"></a>
            </div>
        </div>
        <div class="hero-image">
            <img src="images/hero.jpg" alt="E-learning Illustration">
        </div>
    </div>

    <div class="dashboard-container">
        <h1>🎓 Welcome to Edusphere, <%= session.getAttribute("email") %>!</h1>

        <div class="feature-container">
            <div class="feature-card">
                <h3>📓 Enote</h3>
                <p>A powerful notes application to organize your thoughts.</p>
                <a href="enote.jsp">Go to Enote</a>
            </div>
            <div class="feature-card">
                <h3>✅ Edutask</h3>
                <p>Manage your tasks efficiently with deadlines and priorities.</p>
                <a href="edutask.jsp">Go to Edutask</a>
            </div>
            <div class="feature-card">
                <h3>📂 Eduxplore</h3>
                <p>Submit assignments with deadline tracking and enforcement.</p>
                <a href="eduxplore.jsp">Go to Eduxplore</a>
            </div>
        </div>
    </div>

</body>
</html>