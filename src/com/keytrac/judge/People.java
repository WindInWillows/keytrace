/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;


import java.util.ArrayList;

class People {
    private int[] charList, stateList, timeList;//分别是字符数组(元素是整型的键盘码)，状态数组(元素是0或1，0按下1抬起)，时间数组(毫秒)

    public People(int[] charList, int[] stateList, int[] timeList) throws IllegalArgumentException {
        this.charList = charList;
        this.stateList = stateList;
        this.timeList = timeList;
        if (charList.length != stateList.length || stateList.length != timeList.length) {
            throw new IllegalArgumentException("The length of list must equal!");
        }
    }
    public People(ArrayList<Integer> charList, ArrayList<Integer> stateList , ArrayList<Integer> timeList){
        int[] c = new int[charList.size()];
        int[] s= new int[stateList.size()];
        int[] t = new int[timeList.size()];
        for (int i = 0; i < c.length; i++) {
            c[i] = charList.get(i);
            s[i] = stateList.get(i);
            t[i] = timeList.get(i);
        }
        this.charList = c;
        this.stateList = s;
        this.timeList = t;
    }

    public int[] getCharList() {
        return charList;
    }

    public int[] getStateList() {
        return stateList;
    }

    public int[] getTimeList() {
        return timeList;
    }

    public void setCharList(int[] charList) {
        this.charList = charList;
    }

    public void setStateList(int[] stateList) {
        this.stateList = stateList;
    }

    public void setTimeList(int[] timeList) {
        this.timeList = timeList;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("charList: ");
        for (int i = 0; i < charList.length; i++) {
            sb.append(charList[i] + " ");
        }
        sb.append("\nstateList: ");
        for (int i = 0; i < stateList.length; i++) {
            sb.append(stateList[i] + " ");
        }
        sb.append("\ntimeList: ");
        for (int i = 0; i < timeList.length; i++) {
            sb.append(timeList[i] + " ");
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        int[] a = new int[10];
        int[] b = new int[10];
        int[] c = new int[10];
        for (int i = 0; i < 10; i++) {
            a[i] = i;
            b[i] = i;
            c[i] = i;
        }

        People p = new People(a, b, c);
        System.out.println(p.toString());
    }
}
