<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>

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
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            out.println("<h4>Please log in to view your posts.</h4>");
            return;
        }

        int userId = currentUser.getId();
        int cid = Integer.parseInt(request.getParameter("cid"));

        PostDao dao = new PostDao(com.tech.blog.helper.ConnectionProvider.getConnection());
        List<Post> posts = (cid == 0) ? dao.getPostsByUser(userId) : dao.getPostsByUserAndCategory(userId, cid);

        if (posts.isEmpty()) {
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


                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
<!--                <a href="delete_post.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm" onclick="return confirm('Are you sure you want to delete this post?');">
                    <span class="fa fa-trash"></span>
                </a>-->


                <a href="javascript:void(0);" class="btn btn-outline-light btn-sm" onclick="confirmDelete(<%= p.getPid()%>)">
                    <span class="fa fa-trash"></span>
                </a>



            </div>

        </div>


    </div>

    <%
        }
    %>

</div>


<!-- Custom Confirm Dialog -->
<div id="confirmModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.6); z-index:9999;">
    <div style="background:#fff; max-width:400px; margin:10% auto; padding:20px; border-radius:10px; text-align:center; box-shadow:0 10px 25px rgba(0,0,0,0.2);">
        <h4 style="margin-bottom:15px;">Are you sure?</h4>
        <p>This post will be permanently deleted.</p>
        <div style="margin-top:20px;">
            <button onclick="confirmDeleteNow()" style="background:#e3342f; color:white; border:none; padding:8px 20px; border-radius:5px; cursor:pointer;">Yes, Delete</button>
            <button onclick="closeConfirm()" style="background:#6c757d; color:white; border:none; padding:8px 20px; border-radius:5px; margin-left:10px; cursor:pointer;">Cancel</button>
        </div>
    </div>
</div>


<!-- JavaScript for modal -->
<script>
    let deletePostId = null;

    function confirmDelete(postId) {
        deletePostId = postId;
        document.getElementById('confirmModal').style.display = 'block';
    }

    function closeConfirm() {
        document.getElementById('confirmModal').style.display = 'none';
        deletePostId = null;
    }

    function confirmDeleteNow() {
        if (deletePostId !== null) {
            window.location.href = 'delete_post.jsp?post_id=' + deletePostId;
        }
    }
</script>

