package com.keytrac;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.ServletContext;


import org.apache.struts2.ServletActionContext;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by zhao on 2017/2/25.
 */
public class KeyTrac extends ActionSupport{
    private String record = "";
    private String text = "";
    private String downloadURL = "";

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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
        final String filename = "record/test.csv";
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

}
