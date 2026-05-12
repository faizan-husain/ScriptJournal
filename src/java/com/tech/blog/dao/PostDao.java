/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // method for save post(blog) data into database table posts
    public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // method for get all posts from db
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
//            PreparedStatement p = con.prepareStatement("select * from posts where userId = 2");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // method for get post by categories id
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // method for fetching post by its id to showing on show_blog_page.jsp
    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid = set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    //gpt
    // Get posts by user ID
    public List<Post> getPostsByUser(int userId) {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM posts WHERE userId = ? ORDER BY pid DESC");
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                Post post = new Post(
                        set.getInt("pid"),
                        set.getString("pTitle"),
                        set.getString("pContent"),
                        set.getString("pCode"),
                        set.getString("pPic"),
                        set.getTimestamp("pDate"),
                        set.getInt("catId"),
                        userId
                );
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

// Get posts by user ID and category
    public List<Post> getPostsByUserAndCategory(int userId, int catId) {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM posts WHERE userId = ? AND catId = ? ORDER BY pid DESC");
            p.setInt(1, userId);
            p.setInt(2, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                Post post = new Post(
                        set.getInt("pid"),
                        set.getString("pTitle"),
                        set.getString("pContent"),
                        set.getString("pCode"),
                        set.getString("pPic"),
                        set.getTimestamp("pDate"),
                        catId,
                        userId
                );
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deletePost(int postId, int userId) {
        boolean success = false;
        try {
            String query = "DELETE FROM posts WHERE pid = ? AND userId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    public Post getLatestPost() {
        Post post = null;
        try {
            String query = "SELECT * FROM posts ORDER BY pDate DESC LIMIT 1";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                post = new Post();
                post.setPid(rs.getInt("pid"));
                post.setpTitle(rs.getString("pTitle"));
                post.setpContent(rs.getString("pContent"));
                post.setpCode(rs.getString("pCode"));
                post.setpPic(rs.getString("pPic"));
                post.setpDate(rs.getTimestamp("pDate"));
                // Set the user object here, if your Post entity holds it
                // e.g. fetch User by userId and set post.setUser(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    public int getTotalPostCount() {
        int count = 0;
        try {
            String q = "SELECT COUNT(*) FROM posts";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Post> getBlogsByLimit(int start, int limit) {
        List<Post> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM posts ORDER BY pid DESC LIMIT ?, ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, start);
            pstmt.setInt(2, limit);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
