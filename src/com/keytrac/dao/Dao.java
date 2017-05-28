package com.keytrac.dao;

import com.keytrac.judge.Postman;

import java.sql.*;
import java.util.Random;

/**
 * Created by zhao on 2017/3/10.
 */
public class Dao {
    private static DBConnection dbConnection = new DBConnection();
    private static Connection con = null;
    private final double PASS_FACT = 0.85;
    private final double TEXT_FACT = 0.84;

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

    private float map(float res, double fact) {
/*        if(res<fact) {
            res = (float) Math.pow(res,4);
        } else {
            res = (float) Math.sqrt(res);
        }*/
        return res;
    }

    private float comparePass(String a, String b, String pass) {
        float res = Postman.comparePass(a,b,pass);
        return map(res, PASS_FACT);
    }

    private float compareText(String a, String b) {
        float res = Postman.compareText(a,b);
        return map(res, TEXT_FACT);
    }

    public String login(String user_name, String user_pass, String pass_record) {
        con = dbConnection.getConnection();
        String res = "";
        PreparedStatement ps = null;
        String sql = "SELECT * FROM user where user_name=? and user_pass_hash=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String pass_rec = rs.getString("user_pass_record");
                String pass = rs.getString("user_pass_hash");
                double a = 100 * comparePass(pass_record,pass_rec, pass);
                res += String.format("%.2f",a);;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    public String judgeText(String a, String b) {
        System.out.println(a);
        System.out.println(b);
        return String.format("%.2f",100 * compareText(a, b));
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
