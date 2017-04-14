package com.keytrac.action;

import com.keytrac.dao.Dao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhao on 2017/2/25.
 */
public class KeyTrac extends ActionSupport{
    private Dao dao = new Dao();
    private String record = "";
    private String ran = "";
    private String downloadURL = "";
    final int NUM = 3;

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

    public String downloadFile() {
        String path = getWebRootPath();
        final String filename = "record/test"+ran+".csv";
        downloadURL = filename;
        try {
            File file = new File(path+filename);
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(record.getBytes());
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            downloadURL = "error.jsp";
        } catch (IOException e) {
            e.printStackTrace();
            downloadURL = "error.jsp";
        }
        return SUCCESS;
    }

    private String getWebRootPath() {
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

}
