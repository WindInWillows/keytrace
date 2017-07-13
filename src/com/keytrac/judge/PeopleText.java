/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

class Pack {
    public String key;
    public float value;
    public int times;

    public Pack(String key, float value, int times) {
        this.key = key;
        this.value = value;
        this.times = times;
    }
}

public class PeopleText extends People {
    public PeopleText(int[] charList, int[] stateList, int[] timeList) {
        super(charList, stateList, timeList);
    }

    public PeopleText(ArrayList<Integer> charList, ArrayList<Integer> stateList, ArrayList<Integer> timeList) {
        super(charList, stateList, timeList);
    }

    public static TextFeature getFeature(PeopleText peopleText) {
        ArrayList<Pack> packs = new ArrayList<>();
        Map<Integer, Float> press = new HashMap<>();
        Map<String, Float> flight = new HashMap<>();
        Map<Integer, Integer> pressTimes = new HashMap<>();
        Map<String, Integer> flightTimes = new HashMap<>();
        Map<Integer, Integer> pressStack = new HashMap<>();
        String flightList;
        int[] lastPress = {0, 0};
        int[] charList = peopleText.getCharList();
        int[] stateList = peopleText.getStateList();
        int[] timeList = peopleText.getTimeList();
        float times;
        int thisTime;
        for (int i = 0; i < peopleText.getCharList().length; i++) {
            if (stateList[i] == 0) {
                if (lastPress[0] != 0) {
                    flightList = String.valueOf(charList[i]) + "-" + String.valueOf(lastPress[0]);
                    thisTime = timeList[i] - lastPress[1];
                    if (!flight.containsKey(flightList)) {
                        flight.put(flightList, (float) thisTime);
                        flightTimes.put(flightList, 1);
                        packs.add(new Pack(flightList, (float) thisTime, 1));
                    } else {
                        times = (float) (flightTimes.get(flightList) + 1);
                        flight.put(flightList, flight.get(flightList) * flightTimes.get(flightList) / times +
                                thisTime / times);
                        flightTimes.put(flightList, (int) times);
                        packs.add(new Pack(flightList, flight.get(flightList) * flightTimes.get(flightList) / times +
                                thisTime / times, (int) times));
                    }
                    pressStack.put(charList[i], timeList[i]);
                } else {
                    pressStack.put(charList[i], timeList[i]);
                }
            } else {
                thisTime = timeList[i] - pressStack.get(charList[i]);
                if (!press.containsKey(charList[i])) {
                    press.put(charList[i], (float) timeList[i] - pressStack.get(charList[i]));
                    pressTimes.put(charList[i], 1);
                } else {
                    times = (float) pressTimes.get(charList[i]) + 1;
                    press.put(charList[i], press.get(charList[i]) * pressTimes.get(charList[i]) / times + thisTime / times);
                    pressTimes.put(charList[i], (int) times);
                }
                lastPress[0] = charList[i];
                lastPress[1] = timeList[i];
            }
        }
        for (int i = 0; i < packs.size(); i++) {
            for (int j = 1; j < 4; j++) {
                if (i + j >= packs.size()) {
                    break;
                }
                StringBuilder concat = new StringBuilder();
                float concatTime = 0;
                for (int k = 0; k <= j; k++) {
                    concat.append(packs.get(i + k).key);
                    concatTime += packs.get(i + k).value;
                }
                flight.put(concat.toString(), concatTime);
            }
        }

        return new TextFeature(press, flight, pressTimes, flightTimes);
    }

    public static TextFeature getFeature(PeopleText[] peopleTexts) {
        ArrayList<Pack> packs = new ArrayList<>();
        Map<Integer, Float> press = new HashMap<>();
        Map<String, Float> flight = new HashMap<>();
        Map<Integer, Integer> pressTimes = new HashMap<>();
        Map<String, Integer> flightTimes = new HashMap<>();
        Map<Integer, Integer> pressStack = new HashMap<>();
        String flightList = "";
        float times;
        int thisTime;
        for (PeopleText peopleText : peopleTexts
                ) {
            int[] lastPress = {0, 0};
            int[] charList = peopleText.getCharList();
            int[] stateList = peopleText.getStateList();
            int[] timeList = peopleText.getTimeList();
            pressStack.clear();
            for (int i = 0; i < peopleText.getCharList().length; i++) {
                if (stateList[i] == 0) {
                    if (lastPress[0] != 0) {
                        flightList = String.valueOf(charList[i]) + "-" + String.valueOf(lastPress[0]);
                        thisTime = timeList[i] - lastPress[1];
                        if (!flight.containsKey(flightList)) {
                            flight.put(flightList, (float) thisTime);
                            flightTimes.put(flightList, 1);
                            packs.add(new Pack(flightList, (float) thisTime, 1));
                        } else {
                            times = (float) (flightTimes.get(flightList) + 1);
                            flight.put(flightList, flight.get(flightList) * flightTimes.get(flightList) / times +
                                    thisTime / times);
                            flightTimes.put(flightList, (int) times);
                            packs.add(new Pack(flightList, flight.get(flightList) * flightTimes.get(flightList) / times +
                                    thisTime / times, (int) times));
                        }
                        pressStack.put(charList[i], timeList[i]);
                    } else {
                        pressStack.put(charList[i], timeList[i]);
                    }
                } else {
                    thisTime = timeList[i] - pressStack.get(charList[i]);
                    if (!press.containsKey(charList[i])) {
                        press.put(charList[i], (float) thisTime);
                        pressTimes.put(charList[i], 1);
                    } else {
                        times = (float) pressTimes.get(charList[i]) + 1;
                        press.put(charList[i], press.get(charList[i]) * pressTimes.get(charList[i]) / times + thisTime / times);
                        pressTimes.put(charList[i], (int) times);
                    }
                    lastPress[0] = charList[i];
                    lastPress[1] = timeList[i];
                }
            }
        }
        for (int i = 0; i < packs.size(); i++) {
            for (int j = 1; j < 4; j++) {
                if (i + j >= packs.size()) {
                    break;
                }
                StringBuilder concat = new StringBuilder();
                float concatTime = 0;
                for (int k = 0; k <= j; k++) {
                    concat.append(packs.get(i + k).key);
                    concatTime += packs.get(i + k).value;
                }
                flight.put(concat.toString(), concatTime);
            }
        }
        return new TextFeature(press, flight, pressTimes, flightTimes);
    }

    public static void main(String[] args) {
        System.out.println("123");
    }
}
