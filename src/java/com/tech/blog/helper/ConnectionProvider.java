/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection()
    {
        try{
            if(con == null)
            {
                //load jdbc driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                //create connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "admin");
            }
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
