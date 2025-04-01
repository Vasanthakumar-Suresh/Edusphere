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
     <video autoplay muted loop id="background-video">
    <source src="images/bgvideo.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>
     

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
        <h1>Transform Your Learning Experience with Edusphere</h1>
        <p>Edusphere is your all-in-one platform for managing notes, tracking tasks, and submitting assignments seamlessly. Stay organized and enhance your learning efficiency.</p>
        <div class="hero-buttons">
            <a href="register.jsp" class="apply-now-button">Get Started</a>
            
        </div>
        <div class="social-icons">
    <a href="https://github.com/your-repo" title="GitHub"><img src="images/github.png" alt="GitHub"></a>
    <a href="contact.jsp" title="Contact Us"><img src="images/email.png" alt="Contact"></a>
</div>
        
    </div>
    
</div>


    <div class="dashboard-container">
        <h1>🎓 Welcome to Edusphere, <%= session.getAttribute("email") %>!</h1>

        <div class="feature-container">
            <div class="feature-card">
              	<img src="images/enote.png" alt="Enote Icon" class="feature-icon">
                
                <p>A powerful notes application to organize your thoughts.</p>
                <a href="enote.jsp">Go to Enote</a>
            </div>
            <div class="feature-card">
                <img src="images/edutask.png" id="edutask"alt="Enote Icon" >
                <p>Manage your tasks efficiently with deadlines and priorities.</p>
                <a href="edutask.jsp">Go to Edutask</a>
            </div>
            <div class="feature-card">
                <img src="images/eduxplore.png" alt="Enote Icon" class="feature-icon">
                <p>Submit assignments with deadline tracking and enforcement.</p>
                <a href="eduxplore.jsp">Go to Eduxplore</a>
            </div>
            <div class="feature-card">
                <img src="images/eduscribe.png" alt="Enote Icon" id="eduscribe">
                <p>Where teaching meets efficiency.</p>
                <a href="eduxplore.jsp">Go to Eduxplore</a>
            </div>
        </div>
    </div>

</body>
</html>