/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.ArrayList;

/**
 * 作为围绕用户输入密码的类，继承自People类，成员变量同People类
 * 目前有两个重载的getFeature类，一个是对一组数据提取特征，一个是对多组数据提取特征
 */
public class PeoplePassword extends People {
    public PeoplePassword(int[] charList, int[] stateList, int[] timeList) {
        super(charList, stateList, timeList);
    }

    public PeoplePassword(ArrayList<Integer> charList, ArrayList<Integer> stateList, ArrayList<Integer> timeList) {
        super(charList, stateList, timeList);
    }

    /**
     * 静态方法，用以对存储的密码敲击数据提取特征，是将密码中的每一个字符的按键时间和飞跃时间做记录，封装成PwdFeature
     * @param pp 一组数据
     * @param password 密码对应的原文，以便于从按键数据中提取有用的信息
     * @return 这组特征对应的特征
     */
    public static PwdFeature getFeature(PeoplePassword pp, String password) {
        password = password.toUpperCase();
        int len = password.length();
        int[] charList = pp.getCharList();
        int[] stateList = pp.getStateList();
        int[] timeList = pp.getTimeList();
        float[] pressTime = new float[len];
        float[] flightTime = new float[len - 1];
        int[] startTime = new int[len];
        int cur = 0;
        float deltaTime = 0;
        int i = 0;
        while (i < charList.length && cur < len) {
            if (password.charAt(cur) != '_') {
                if (PeoplePassword.isKeycode(password.charAt(cur),charList[i]) && stateList[i] == 0) {
                    startTime[cur] = timeList[i];
                    pressTime[cur] = timeList[i];
                    for (int j = i; j < charList.length; j++) {
                        if (charList[j] == (int) password.charAt(cur) && stateList[j] == 1) {
                            deltaTime = timeList[j] - pressTime[cur];
                            pressTime[cur] = deltaTime;
                            break;
                        }
                    }
                    cur++;
                }
            } else {
                if (charList[i] == 189 && stateList[i] == 0) {
                    startTime[cur] = timeList[i];
                    pressTime[cur] = timeList[i];
                    for (int j = i; j < charList.length; j++) {
                        if (charList[j] == 189 && stateList[j] == 1) {
                            pressTime[cur] = timeList[j] - pressTime[cur];
                            break;
                        }
                    }
                    cur++;
                }
            }
            i++;
        }
        for (i = 0; i < len - 1; i++) {
            flightTime[i] = startTime[i + 1] - pressTime[i] - startTime[i];
        }
        return new PwdFeature(pressTime, flightTime);
    }

    /**
     * 其功能大致上与单组数据的getFeature类似，但通过多组数据可以额外提取出方差，最大，最小值等信息，一并封装进PwdFeature类中
     * @param pp 多组数据的数组
     * @param password 密码原文
     * @return
     */
    public static PwdFeature getFeature(PeoplePassword[] pp, String password) {
        int len = password.length();
        float[] pressTime = new float[len];
        float[] flightTime = new float[len - 1];
        float[] minPressTime = new float[len];
        float[] maxPressTime = new float[len];
        float[] maxFlightTime = new float[len - 1];
        float[] minFlightTime = new float[len - 1];
        float[] varPress = new float[len];
        float[] varFlight = new float[len - 1];
        float temp = 0;
        for (int i = 0; i < len; i++) {
            minPressTime[i] = 100000;
            maxPressTime[i] = -100;
        }
        for (int i = 0; i < len - 1; i++) {
            maxFlightTime[i] = -100;
            minFlightTime[i] = 100000;
        }
        for (int i = 0; i < pp.length; i++) {
            for (int j = 0; j < len; j++) {
                pressTime[j] += PeoplePassword.getFeature(pp[i], password).getPressTime()[j];
                if (PeoplePassword.getFeature(pp[i], password).getPressTime()[j] > maxPressTime[j]) {
                    maxPressTime[j] = PeoplePassword.getFeature(pp[i], password).getPressTime()[j];
                }
                if (PeoplePassword.getFeature(pp[i], password).getPressTime()[j] < minPressTime[j]) {
                    minPressTime[j] = PeoplePassword.getFeature(pp[i], password).getPressTime()[j];
                }
            }
            for (int j = 0; j < len - 1; j++) {
                flightTime[j] += PeoplePassword.getFeature(pp[i], password).getFlightTime()[j];
                if (PeoplePassword.getFeature(pp[i], password).getFlightTime()[j] > maxFlightTime[j]) {
                    maxFlightTime[j] = PeoplePassword.getFeature(pp[i], password).getFlightTime()[j];
                }
                if (PeoplePassword.getFeature(pp[i], password).getFlightTime()[j] < minFlightTime[j]) {
                    minFlightTime[j] = PeoplePassword.getFeature(pp[i], password).getFlightTime()[j];
                }
            }
        }
        for (int i = 0; i < len; i++) {
            pressTime[i] = pressTime[i] / pp.length;
        }
        for (int i = 0; i < len - 1; i++) {
            flightTime[i] = flightTime[i] / pp.length;
        }
        for (int i = 0; i < len; i++) {
            temp = 0;
            for (int j = 0; j < pp.length; j++) {
                temp += Math.pow((pressTime[i] - PeoplePassword.getFeature(pp[j], password).getPressTime()[i]), 2);
            }
            varPress[i] = temp / pp.length;
        }
        for (int i = 0; i < len - 1; i++) {
            temp = 0;
            for (int j = 0; j < pp.length; j++) {
//                System.out.println("flightTime[i] " + flightTime[i]);
//                System.out.println("PeoplePassword.getFeature(pp[j], password).getFlightTime()[i] " + PeoplePassword.getFeature(pp[j], password).getFlightTime()[i]);
                temp += Math.pow((flightTime[i] - PeoplePassword.getFeature(pp[j], password).getFlightTime()[i]), 2);
            }
            varFlight[i] = temp / pp.length;
            //System.out.println("varFlight[i] " + varFlight[i]);
        }
        return new PwdFeature(pressTime, flightTime, maxPressTime, minPressTime, maxFlightTime, minFlightTime, varPress, varFlight);
    }

    /**
     * 判断字符与键盘码是否对应
     * @param key 字符
     * @param code 整型键盘码
     * @return 如果是返回true，否则false
     */
    private static boolean isKeycode(char key,int code){
        if ((int) key == code){
            return true;
        }
        else {
            switch (code){
                case 96:
                    if (key == '0'){
                        return true;
                    }
                    break;
                case 97:
                    if (key == '1'){
                        return true;
                    }
                    break;
                case 98:
                    if (key == '2'){
                        return true;
                    }
                case 99:
                    if (key == '3'){
                        return true;
                    }
                    break;
                case 100:
                    if (key == '4'){
                        return true;
                    }
                    break;
                case 101:
                    if (key == '5'){
                        return true;
                    }
                    break;
                case 102:
                    if (key == '6'){
                        return true;
                    }
                    break;
                case 103:
                    if (key == '7'){
                        return true;
                    }
                    break;
                case 104:
                    if (key == '8'){
                        return true;
                    }
                    break;
                case 105:
                    if (key == '9'){
                        return true;
                    }
                    break;
            }
        }
        return false;
    }
    public static void main(String[] args) {
        int[] train_char1 = {65, 65, 80, 83, 80, 83, 76, 76, 76, 76, 75, 75, 81, 87, 81, 87, 49, 50, 49, 50};
        int[] train_state1 = {0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1};
        int[] train_time1 = {0, 119, 141, 209, 228, 299, 359, 419, 479, 549, 629, 699, 929, 1039, 1090, 1149, 1229, 1309, 1369, 1419};
        PeoplePassword p1 = new PeoplePassword(train_char1, train_state1, train_time1);
        System.out.println("press ");
        for (float i : PeoplePassword.getFeature(p1, "apsllkqw12").getPressTime()
                ) {
            System.out.print(" " + i);
        }
        System.out.println("\nflight");
        for (float i : PeoplePassword.getFeature(p1, "apsllkqw12").getFlightTime()
                ) {
            System.out.print(" " + i);
        }
    }
}
