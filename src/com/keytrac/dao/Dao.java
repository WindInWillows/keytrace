package com.keytrac.dao;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.Random;

/**
 * Created by zhao on 2017/3/10.
 */
public class Dao {
    private static DBConnection dbConnection = new DBConnection();
    private static Connection con = null;

    private int getTextNum() {
        String sql = "SELECT count(*) FROM keytrace.random_text;";
        con = dbConnection.getConnection();
        Statement statement = null;
        try {
            statement = con.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next())
                return rs.getInt(1);
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String getRandomText() {
        Random ran = new Random();
        int id = ran.nextInt(getTextNum())+1;
        String sql = "SELECT * FROM keytrace.random_text WHERE id="+id;
        con = dbConnection.getConnection();
        Statement statement = null;
        try {
            statement = con.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next())
                return rs.getString("text");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Load Random text error!";
    }

    public boolean signup(String name, String pass, String rec) {
        con = dbConnection.getConnection();
        PreparedStatement ps = null;
        String sql = "INSERT INTO user VALUES (NULL,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,pass);
            ps.setString(3,rec);
            return !ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private float comparePass(String a, String b, String pass) {

        return 98.0f;
    }

    private float compareText(String a, String b) {

        return 98.0f;
    }

    public String login(String user_name, String user_pass, String pass_record, String verify_code) {
        HttpSession session = ServletActionContext.getRequest().getSession();
        con = dbConnection.getConnection();
        String res = "";
        PreparedStatement ps = null;

        String checkCode2 = (String)session.getAttribute("checkCode");
        if(checkCode2.equals(verify_code)){
            res+="right";
        }else{
            res+="false";
        }
        String sql = "SELECT * FROM user where user_name=? and user_pass_hash=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String pass_rec = rs.getString("user_pass_record");
                String pass = rs.getString("user_pass_hash");
                double a = comparePass(pass_record,pass_rec, pass);
                res += a ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public String judgeText(String a, String b) {
        return ""+compareText(a,b);
    }

    public String hasUser(String user_name) {
        con = dbConnection.getConnection();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM user where user_name=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "true";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "false";
    }
}
