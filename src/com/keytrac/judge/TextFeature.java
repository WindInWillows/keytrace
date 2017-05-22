/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.HashMap;
import java.util.Map;

/**
 * 用以封装为了表示特征的几个变量，设计这个包装类。
 * 主要功能是用于将特征从PeopleText的getFeature送入到TextJudger的compare里
 */
class TextFeature {
    private Map<Integer, Float> press; //按键持续时间的map，第一个整型是键盘码，第二个浮点数是平均时间
    private Map<String, Float> flight;//飞跃时间的map，第一个字符串是后-前的键盘码，例如"79-23",第二个是平均时间
    private Map<Integer, Integer> pressTimes;//记录按键对应次数
    private Map<String, Integer> flightTimes;//记录飞跃事件对应的次数

    public TextFeature() {
        press = new HashMap<>();
        flight = new HashMap<>();
    }

    public TextFeature(Map<Integer, Float> press, Map<String, Float> flight, Map<Integer, Integer> pressTimes, Map<String, Integer> flightTimes) {
        this.press = press;
        this.flight = flight;
        this.pressTimes = pressTimes;
        this.flightTimes = flightTimes;
    }

    public Map<Integer, Float> getPress() {
        return press;
    }

    public Map<String, Float> getFlight() {
        return flight;
    }

    public void setFlight(Map<String, Float> flight) {
        this.flight = flight;
    }

    public void setFlightTimes(Map<String, Integer> flightTimes) {
        this.flightTimes = flightTimes;
    }

    public void setPress(Map<Integer, Float> press) {
        this.press = press;
    }

    public void setPressTimes(Map<Integer, Integer> pressTimes) {
        this.pressTimes = pressTimes;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("press: ");
        for (Integer i : press.keySet()
                ) {
            sb.append(i.toString() + ":" + press.get(i) + " ");
        }
        sb.append("flight: ");
        for (String i : flight.keySet()
                ) {
            sb.append(i + ":" + flight.get(i) + " ");
        }
        return sb.toString();
    }

    public Map<Integer, Integer> getPressTimes() {
        return pressTimes;
    }

    public Map<String, Integer> getFlightTimes() {
        return flightTimes;
    }

    public static void main(String[] args) {
        TextFeature test = new TextFeature();
        Map<Integer, Float> p = new HashMap<>();
        Map<String, Float> f = new HashMap<>();
        String k = "";
        p.put(10, 12.3f);
        p.put(22, 99.2f);
        k = "12-57";
        f.put(k, 15.7f);
        k = "33-87";
        f.put(k, 89.9f);
        test.setFlight(f);
        test.setPress(p);
        System.out.println(test.toString());
    }
}
