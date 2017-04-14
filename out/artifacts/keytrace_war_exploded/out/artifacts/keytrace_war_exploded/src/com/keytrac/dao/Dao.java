package com.keytrac.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
}
