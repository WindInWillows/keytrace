package com.keytrac.dao;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

/**
 * Created by google on 2017/4/27.
 */

public class VerifyCode extends ActionSupport{

    private ByteArrayInputStream inputStream;
    private static int WIDTH = 60;
    private static int HEIGHT = 25;

    public ByteArrayInputStream getInputStream() {return inputStream;}
    public void setInputStream(ByteArrayInputStream inputStream) {this.inputStream = inputStream;}

    //随机生成4位验证码
    private static String createRandom() {
        String str = "0123456789qwertyuiopasdfghjklzxcvbnm";
        char[] rands = new char[4];
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            rands[i] = str.charAt(random.nextInt(36));
        }
        return new String(rands);
    }

    private void drawBackground(Graphics g)
    {
        // 画背景
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, WIDTH, HEIGHT);
        // 随机产生 120 个干扰点
        for (int i = 0; i < 120; i++) {
            int x = (int) (Math.random() * WIDTH);
            int y = (int) (Math.random() * HEIGHT);
            int red = (int) (Math.random() * 255);
            int green = (int) (Math.random() * 255);
            int blue = (int) (Math.random() * 255);
            g.setColor(new Color(red, green, blue));
            g.drawOval(x, y, 1, 0);
        }
    }

    // 在图片不同坐标处嵌入验证码
    private void drawRands(Graphics g, String rands) {
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));
        g.drawString("" + rands.charAt(0), 1, 17);
        g.drawString("" + rands.charAt(1), 16, 15);
        g.drawString("" + rands.charAt(2), 31, 18);
        g.drawString("" + rands.charAt(3), 46, 16);
        System.out.println(rands);
    }

    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        // 设置浏览器不要缓存此图片
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String rands = createRandom();
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        // 产生带有4位随机验证码的图像
        drawBackground(g);
        drawRands(g, rands);
        g.dispose();

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(image, "jpeg", outputStream);
        ByteArrayInputStream input = new ByteArrayInputStream(outputStream.toByteArray());
        this.setInputStream(input);
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("checkCode", rands);

        input.close();
        outputStream.close();
        return SUCCESS;
    }
}
