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
    private String downloadURL = "";
    private static final String PATH = "record/";
    private String datazip = "";
    final int NUM = 2;
    private final static String ZIP_OUT = getWebRootPath()+"data/alldata.zip";

    private String user_name = "";
    private String user_pass = "";
    private String pass_record = "";

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

    public String getPass_record() {
        return pass_record;
    }

    public void setPass_record(String pass_record) {
        this.pass_record = pass_record;
    }

    public String getDatazip() {
        return datazip;
    }

    public void setDatazip(String datazip) {
        this.datazip = datazip;
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

    public String getDownloadURL() {
        return downloadURL;
    }

    public void setDownloadURL(String downloadURL) {
        this.downloadURL = downloadURL;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public static void main(String[] args) {

    }

    public static String generateFileName() {
        Date date = new Date();
        return PATH + System.currentTimeMillis()+new Random().nextInt(100)+".csv";
    }


    public String downloadFile() {
        String path = getWebRootPath();
        final String filename = generateFileName();
        downloadURL = filename;
        try {
            File file = new File(path+filename);
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(record.getBytes());
            fos.flush();
            fos.close();
            dao.saveFile(filename);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            downloadURL = "";
        } catch (IOException e) {
            e.printStackTrace();
            downloadURL = "";
        }

        return SUCCESS;
    }

    private static String getWebRootPath() {
        ActionContext actionContext = ActionContext.getContext();
        ServletContext servletContext = (ServletContext)actionContext.get(ServletActionContext.SERVLET_CONTEXT);
        String rootPath = servletContext.getRealPath("/");
        return rootPath;
    }

    public String loadRandomText() throws Exception {
        for(int i=0;i<NUM;i++) {
            list.add(dao.getRandomText());
        }
        return "success";
    }

    public String downloadData() {
        String head = getWebRootPath();
        File dir = new File(head+PATH);
        if(compress(dir)) {
            File f = new File(ZIP_OUT);
            datazip = "data/"+f.getName();
            return SUCCESS;
        }
        return ERROR;
    }

    private boolean compress(File dir) {
        File zipfile = new File(ZIP_OUT);
        try {
            ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipfile));
            if(dir.isDirectory()) {
                File[] files = dir.listFiles();
                for (File file:files){
                    byte[] buf = new byte[1024*10];
                    InputStream input = new FileInputStream(file);
                    zos.putNextEntry(new ZipEntry(file.getName()));
                    int len;
                    while((len = input.read(buf)) != -1){
                        zos.write(buf, 0, len);
                    }
                    input.close();
                }
            }
            zos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public String signup() throws Exception {
        boolean res = dao.signup(user_name, user_pass, pass_record);
        if(res)
            record="success";
        else record = "";
        return SUCCESS;
    }

    public String login() throws Exception {
        record = dao.login(user_name,user_pass,pass_record);
        return "success";
    }

    public String learnPattern() throws Exception {
        ActionContext.getContext().getSession().put("record",record);
        return "success";
    }

    public String judgeText() throws Exception {
        result = dao.judgeText(record, (String) ActionContext.getContext().getSession().get("record"));
        return "success";
    }

    public String toJudge() throws Exception {
        System.out.println(ActionContext.getContext().getSession().get("record"));

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
}
