<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<style>
    .card-img-top {
        height: 200px; /* fixed height */
        width: 100%;
        object-fit: cover;
        border-top-left-radius: 0.2rem;
        border-top-right-radius: 0.2rem;
    }
</style>

<div class="row">

    <%

        User uuu = (User) session.getAttribute("currentUser");

        // if you publish web appp when thread shoud remove
        Thread.sleep(400);
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>no posts in this category..</h3>");
            return;
        }

        for (Post p : posts) {
    %>

    <div class="col-md-4 d-flex align-items-stretch mb-4">
        <div class="card">
            <%
                String imagePath = request.getContextPath() + "/blog_pics/" + p.getpPic();
                java.io.File imageFile = new java.io.File(application.getRealPath("/blog_pics/" + p.getpPic()));
                String finalImagePath = imageFile.exists() ? imagePath : request.getContextPath() + "/img/default.png";
            %>

            <img class="card-img-top" src="<%= finalImagePath%>" alt="Blog Image">

            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <%
                    String content = p.getpContent();
                    String preview = content.length() > 100 ? content.substring(0, 100) + "..." : content;
                %>
                <p><%= preview%></p>


            </div>
            <div class="card-footer primary-background text-center">
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
            </div>

        </div>


    </div>


    <%
        }


    %>

</div>