<%-- 
    Document   : index
    Created on : 21-January-2025, 12:07:42 pm, Wednesday
    Author     : Dell
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TechBlog</title>
        <!--css bootsrap link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!--css external-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--font awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .background-clips{
                clip-path: ellipse(58% 80% at 50% 20%);
            }
            /* Custom active and hover styles */
            .dropdown-item.active,
            .dropdown-item:active {
                background-color: #5D4037 !important; /* Green background */
                color: white !important;
            }

            .dropdown-item:hover {
                background-color: lightgray !important; /* Darker green on hover */
                color: black !important;
            }
            .poster-image {
                width: 100% !important;
                height: auto !important;
                object-fit: contain;
                max-height: 400px;
            }
        </style>
    </head>
    <body>
        <!--navbar start-->
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <i><span class="fa fa-code"></span> Script<b style="margin-left: 1.5px">Journal</b></i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="about_page.jsp">About</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <a class="dropdown-item c-link dropdown-item dropdown-item-action dropdown-item-secondary active" href="#" onclick="getPosts(0, this)" >All Posts</a>

                            <%  PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {

                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="dropdown-item c-link dropdown-item dropdown-item-action dropdown-item-secondary "><%= cc.getName()%></a>


                            <%
                                }
                            %>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://faizan-husain.github.io/.com/" target="_blank">Developer</a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="register_page.jsp"   > <span class="fa fa-plus-circle"></span> POST</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right">


                    <li class="nav-item">
                        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user"></span> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Register</a>
                    </li>

                </ul>
            </div>
        </nav>
        <!--navbar end-->

        <!--banner-->
        <div class="container-fluid m-0 p-0 ">
            <div class="jumbotron">
                <div class="container mb-3">
                    <h3 class="display-4">Welcome to <i>ScriptJournal</i></h3>
                    <p>a wonderful platform where software developers and tech enthusiasts write and share their technical insights, code snippets, tutorials, and thought pieces all centered around the structure and logic of programming.</p>
                    <!--<button class="btn btn-outline-secondary btn-lg">Let's Start</button>&nbsp;-->
                    <a href="login_page.jsp" class="btn btn-outline-secondary btn-lg">Login</a>
                    <a href="register_page.jsp" class="btn btn-outline-secondary btn-lg"><span class="fa fa-user-plus"></span> Let's Start</a>
                </div>
            </div>
        </div>

        <%
            PostDao postDao = new PostDao(ConnectionProvider.getConnection());
            Post latestPost = postDao.getLatestPost();  // You need to have this method in PostDao

            if (latestPost != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
                String postDate = sdf.format(latestPost.getpDate());  // Assuming getpDate() returns java.util.Date
        %>


        <!--main poster blog-->


        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= latestPost.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <!--<img class="card-img-top my-2 poster-image" src="blog_pics/<%= latestPost.getpPic()%>" alt="Card image cap">-->
                            <img class="card-img-top my-2 poster-image" src="blog_pics/<%= latestPost.getpPic()%>" alt="Card image cap">
                            <div class="row my-3 row-user">

                                <div class="container text-center">
                                    <p class="post-date">Latest Posted : <%= postDate%></p>
                                </div>
                            </div>

                            <p class="post-content">
                                <%= latestPost.getpContent().length() > 500 ? latestPost.getpContent().substring(0, 500) + "..." : latestPost.getpContent()%>
                            </p>

                            <% if (latestPost.getpCode() != null && !latestPost.getpCode().trim().isEmpty()) {%>
                            <br><br>
                            <div class="post-code">
                                <pre><%= latestPost.getpCode()%></pre>
                            </div>
                            <% }%>
                        </div>
                        <div class="card-footer primary-background text-center">
                            <a href="show_blog_page.jsp?post_id=<%= latestPost.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else {
        %>
        <h3 class="text-center">No blog posts available.</h3>
        <%
            }
        %>




        <!--end of poster blog-->

        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4 mb-4">
                    <!--first col-->




                    <!--second col-->
                    <div class="col-md-12" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>


        </main>


        <!--end main body of the page-->

        <%@include file="normal_footer.jsp" %>


        <!--javascript bootstrap link-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!--javascript external-->
        <script src="js/myjs.js" type="text/javascript"></script>

        <!--loading post using ajax-->
        <script>
                                function getPosts(catId, temp) {
                                    $("#loader").show();
                                    $("#post-container").hide()

                                    $(".c-link").removeClass('active')


                                    $.ajax({
                                        url: "load_posts.jsp",
                                        data: {cid: catId},
                                        success: function (data, textStatus, jqXHR) {
                                            console.log(data);
                                            $("#loader").hide();
                                            $("#post-container").show();
                                            $('#post-container').html(data)
                                            $(temp).addClass('active')

                                        }
                                    })

                                }

                                $(document).ready(function (e) {

                                    let allPostRef = $('.c-link')[0]
                                    getPosts(0, allPostRef)


                                })
        </script>
    </body>
</html>
