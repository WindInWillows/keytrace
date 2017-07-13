/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.*;

/**
 * Created by 56363 on 2017/7/11.
 */

public class ManyText {
    private ArrayList<People> textList;

    public ManyText() {
        this.textList = new ArrayList<People>();
    }

    public void addText(People t) {
        textList.add(t);

    }

    private ArrayList getFeature(int n, People x) {
        ArrayList<HashMap<String,Float>> res = new ArrayList<>();
        Map<Integer, Integer> pressTimes = new HashMap<>();
        Map<String, Integer> flightTimes = new HashMap<>();
        Map<Integer, Integer> pressStack = new HashMap<>();
        String flightList;
        Queue<Integer> lastPress = new LinkedList<>();
        Queue<Integer> lastPressTime = new LinkedList<>();
        int[] charList = x.getCharList();
        int[] stateList = x.getStateList();
        int[] timeList = x.getTimeList();
        float times;
        int thisTime;
        int length = x.getCharList().length;
        for (int i = 0; i <= n ; i++) {
            res.add(new HashMap<String,Float>());
        }
        for (int i = 0; i < length; i++) {
            if (stateList[i]==0){
                if (lastPress.size()!=0){

                }
            }
        }
        return res;
    }

}
