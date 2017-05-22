/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.ArrayList;

/**
 * Created by 56363 on 2017/4/16.
 */
public class Postman {
    /**
     * @param test    为前端发送数据
     * @param train    数据库内数据
     * @param pass 密码明文
     * @return 相似度，float型，取值[0,1]
     */
    public static float comparePass(String test, String train, String pass) {
        String[] aList = test.split("\n|,");
        String[] bList = train.split("\n|,");
        int aLength = aList.length;
        int bLength = bList.length;
        ArrayList<Integer> aCharList = new ArrayList<>();
        ArrayList<Integer> aStateList = new ArrayList<>();
        ArrayList<Integer> aTimeList = new ArrayList<>();
        ArrayList<Integer> bCharList1 = new ArrayList<>();
        ArrayList<Integer> bStateList1 = new ArrayList<>();
        ArrayList<Integer> bTimeList1 = new ArrayList<>();
        ArrayList<Integer> bCharList2 = new ArrayList<>();
        ArrayList<Integer> bStateList2 = new ArrayList<>();
        ArrayList<Integer> bTimeList2 = new ArrayList<>();
        for (int i = 3; i < aLength; i++) {
            if (i % 3 == 0) {
                aCharList.add(Integer.parseInt(aList[i]));
            } else if (i % 3 == 1) {
                aTimeList.add(Integer.parseInt(aList[i]));
            } else {
                aStateList.add(Integer.parseInt(aList[i]));
            }
        }
        int flag = 0;
        for (int i = 3; i < bLength; i++) {
            if (flag == 0) {
                if (Character.isDigit(bList[i].charAt(0))) {
                    if (i % 3 == 0) {
                        bCharList1.add(Integer.parseInt(bList[i]));
                    } else if (i % 3 == 1) {
                        bTimeList1.add(Integer.parseInt(bList[i]));
                    } else {
                        bStateList1.add(Integer.parseInt(bList[i]));
                    }
                } else {
                    flag = 1;
                }
            } else {
                if (Character.isDigit(bList[i].charAt(0))) {
                    if (i % 3 == 0) {
                        bCharList2.add(Integer.parseInt(bList[i]));
                    } else if (i % 3 == 1) {
                        bTimeList2.add(Integer.parseInt(bList[i]));
                    } else {
                        bStateList2.add(Integer.parseInt(bList[i]));
                    }
                }
            }
        }
        try {
            System.out.println("aCharList = ");
            for (int i : aCharList
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\naStateList = ");
            for (int i : aStateList
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\naTimeList = ");
            for (int i : aTimeList
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\nbCharList1 = ");
            for (int i : bCharList1
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\nbStateList1 = ");
            for (int i : bStateList1
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\nbTimeList1 = ");
            for (int i : bTimeList1
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\nbCharList2 = ");
            for (int i : bCharList2
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\nbStateList2 = ");
            for (int i : bStateList2
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\nbTimeList2 = ");
            for (int i : bTimeList2
                    ) {
                System.out.print(i + " ");
            }
            System.out.println("\npass "+pass);
            PeoplePassword aPwd = new PeoplePassword(aCharList, aStateList, aTimeList);
            PeoplePassword bPwd1 = new PeoplePassword(bCharList1, bStateList1, bTimeList1);
            PeoplePassword bPwd2 = new PeoplePassword(bCharList2, bStateList2, bTimeList2);
            PeoplePassword[] bPwd = {bPwd1, bPwd2};
            PwdJudger pj = new PwdJudger(0.5f);
            return pj.compare(bPwd, aPwd, pass);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            return 0.79f;
        }
    }

    public static float compareText(String test,String train) {
        String[] aList = test.split("\n|,");
        String[] bList = train.split("\n|,");
        int aLength = aList.length;
        int bLength = bList.length;
        ArrayList<Integer> aCharList = new ArrayList<>();
        ArrayList<Integer> aStateList = new ArrayList<>();
        ArrayList<Integer> aTimeList = new ArrayList<>();
        ArrayList<Integer> bCharList1 = new ArrayList<>();
        ArrayList<Integer> bStateList1 = new ArrayList<>();
        ArrayList<Integer> bTimeList1 = new ArrayList<>();
        ArrayList<Integer> bCharList2 = new ArrayList<>();
        ArrayList<Integer> bStateList2 = new ArrayList<>();
        ArrayList<Integer> bTimeList2 = new ArrayList<>();
        for (int i = 3; i < aLength; i++) {
            if (i % 3 == 0) {
                aCharList.add(Integer.parseInt(aList[i]));
            } else if (i % 3 == 1) {
                aTimeList.add(Integer.parseInt(aList[i]));
            } else {
                aStateList.add(Integer.parseInt(aList[i]));
            }
        }
        int flag = 0;
        for (int i = 3; i < bLength; i++) {
            if (flag == 0) {
                if (Character.isDigit(bList[i].charAt(0))) {
                    if (i % 3 == 0) {
                        bCharList1.add(Integer.parseInt(bList[i]));
                    } else if (i % 3 == 1) {
                        bTimeList1.add(Integer.parseInt(bList[i]));
                    } else {
                        bStateList1.add(Integer.parseInt(bList[i]));
                    }
                } else {
                    flag = 1;
                }
            } else {
                if (Character.isDigit(bList[i].charAt(0))) {
                    if (i % 3 == 0) {
                        bCharList2.add(Integer.parseInt(bList[i]));
                    } else if (i % 3 == 1) {
                        bTimeList2.add(Integer.parseInt(bList[i]));
                    } else {
                        bStateList2.add(Integer.parseInt(bList[i]));
                    }
                }
            }
        }
        try {
            PeopleText p1 = new PeopleText(aCharList,aStateList,aTimeList);
            PeopleText p2 = new PeopleText(bCharList1,bStateList1,bTimeList1);
            PeopleText p3 = new PeopleText(bCharList2,bStateList2,bTimeList2);
            PeopleText[] list = {p2,p3};
            TextJudger tj = new TextJudger();
            return tj.compare(list,p1);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            return 0.79f;
        }
    }

    public static void main(String[] args) {

    }
}
