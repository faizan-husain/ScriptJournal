<%-- 
    Document   : login_page
    Created on : 21-May-2025, 5:23:54 pm
    Author     : Dell
--%>
<%@page import="com.tech.blog.entities.Message"%>
<%--<%@page import="com.tech.blog.entities.Message"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <!--css bootsrap link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!--css external-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--font awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .about-header {
                background: #E9ECEF;
                color: #000;
                padding: 60px 0;
            }
            .about-header h1 {
                font-weight: 700;
            }
            .section {
                padding: 60px 15px;
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include  file="normal_navbar.jsp" %>


        <!-- About Header -->
        <div class="about-header text-center">
            <div class="container">
                <h1>About ScriptJournal</h1>
                <p class="lead">Empowering Coders, One Blog at a Time</p>
            </div>
        </div>

        <!-- About Content -->
        <div class="section">
            <div class="container">
                <div class="row text-center mb-4">
                    <div class="col">
                        <h2>Our Mission</h2>
                        <p class="text-muted">To empower learners and developers by providing clear, practical, and well-structured technical content.</p>
                    </div>
                </div>

                <div class="row text-center mb-4">
                    <div class="col-md-4">
                        <h4>🧠 Learn</h4>
                        <p>Explore curated tutorials, step-by-step guides, and insightful articles across various development topics.</p>
                    </div>
                    <div class="col-md-4">
                        <h4>📘 Share</h4>
                        <p>Every contributor shares their real-world coding experience to help others in their journey.</p>
                    </div>
                    <div class="col-md-4">
                        <h4>🌐 Connect</h4>
                        <p>Join a growing community of passionate coders and tech enthusiasts from around the world.</p>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col">
                        <h2>Meet ScriptJournal</h2>
                        <p>ScriptJournal is a collaborative blogging platform started by developers, for developers. We’re dedicated to making coding education accessible and enjoyable for all levels of learners.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="normal_footer.jsp" %>   


        <!--javascript bootstrap link-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!--javascript external-->
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
