package com.keytrac.action;

import com.keytrac.dao.Dao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.ServletContext;


import com.sun.deploy.association.Action;
import org.apache.struts2.ServletActionContext;


import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by zhao on 2017/2/25.
 */
public class KeyTrac extends ActionSupport{
    private Dao dao = new Dao();
    private String record = "";
    private String ran = "";
    final int NUM = 2;

    private String user_name = "";
    private String user_pass = "";

    private String result = "";

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public String getRan() {
        return ran;
    }

    public void setRan(String ran) {
        this.ran = ran;
    }

    private List<String> list = new ArrayList<>();

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String loadRandomText() throws Exception {
        for(int i=0;i<NUM;i++) {
            list.add(dao.getRandomText());
        }
        return "success";
    }

    public String signup() throws Exception {
        boolean res = dao.signup(user_name, user_pass, record);
        result = res ? "success" : "";
//        System.out.println(record);
        return SUCCESS;
    }

    public String login() throws Exception {
        result = dao.login(user_name,user_pass,record);
        return "success";
    }

    public String learnPattern() throws Exception {
        ActionContext.getContext().getSession().put("record",record);
//        System.out.println(record);
        return "success";
    }

    public String judgeText() throws Exception {
        result = dao.judgeText(record, (String) ActionContext.getContext().getSession().get("record"));
//        System.out.println(record);
        return "success";
    }

    public String toJudge() throws Exception {
        return "success";
    }

    public String toSignup() throws Exception {
        return "success";
    }

    public String toLogin() throws Exception {
        return "success";
    }

    public String toFreetext() throws Exception {
        return "success";
    }

    public String hasUser() throws Exception {
        result = dao.hasUser(user_name);
        return "success";
    }
}
