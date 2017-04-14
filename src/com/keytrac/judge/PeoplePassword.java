/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.ArrayList;


public class PeoplePassword extends People {
    public PeoplePassword(int[] charList, int[] stateList, int[] timeList) {
        super(charList, stateList, timeList);
    }

    public PeoplePassword(ArrayList<Integer> charList, ArrayList<Integer> stateList, ArrayList<Integer> timeList) {
        super(charList, stateList, timeList);
    }

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
//            System.out.println("i: "+i);
//            System.out.println("cur " +cur);
            if (password.charAt(cur) != '_') {
                if (charList[i] == (int) password.charAt(cur) && stateList[i] == 0) {
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
