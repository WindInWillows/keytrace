/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

/**
 * 该类的功能是作为封装类将PeoplePassword类的getFeature提取到的信息传给PwdJudger
 */
class PwdFeature {
    private float[] pressTime; //按键时间
    private float[] flightTime; //飞跃时间
    private float[] maxPressTime;//每一项的最大按键时间
    private float[] minPressTime;//每一项的最小按键时间
    private float[] maxFlightTime;//每一项的最大飞跃时间
    private float[] minFlightTime;//每一项的最小飞跃时间
    private float[] varPress;//每一项按键时间的方差
    private float[] varFlight;//每一项的飞跃时间的方差


    public PwdFeature(float[] pressTime, float[] flightTime, float[] maxPressTime, float[] minPressTime, float[] maxFlightTime, float[] minFlightTime, float[] varPress, float[] varFlight) {
        this.pressTime = pressTime;
        this.flightTime = flightTime;
        this.maxPressTime = maxPressTime;
        this.minPressTime = minPressTime;
        this.maxFlightTime = maxFlightTime;
        this.minFlightTime = minFlightTime;
        this.varPress = varPress;
        this.varFlight = varFlight;
    }

    public PwdFeature(float[] pressTime, float[] flightTime) {
        this.pressTime = pressTime;
        this.flightTime = flightTime;
    }

    public float[] getFlightTime() {
        return flightTime;
    }

    public float[] getPressTime() {
        return pressTime;
    }

    public float[] getVarFlight() {
        return varFlight;
    }

    public float[] getVarPress() {
        return varPress;
    }

    public float[] getMaxFlightTime() {
        return maxFlightTime;
    }

    public float[] getMaxPressTime() {
        return maxPressTime;
    }

    public float[] getMinFlightTime() {
        return minFlightTime;
    }

    public float[] getMinPressTime() {
        return minPressTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("pressTime: ");
        for (float i : pressTime
                ) {
            sb.append(" " + i);
        }
        sb.append("\nflightTime: ");
        for (float i : flightTime
                ) {
            sb.append(" " + i);
        }

        return sb.toString();
    }
}
