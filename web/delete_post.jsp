<%@page import="com.tech.blog.entities.User"%>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login_page.jsp");
        return;
    }

    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao dao = new PostDao(ConnectionProvider.getConnection());

    boolean deleted = dao.deletePost(postId, currentUser.getId());

    if (deleted) {
        response.sendRedirect("profile.jsp"); // or the page where posts reload
    } else {
        out.println("<h3>Failed to delete the post.</h3>");
    }
%>
