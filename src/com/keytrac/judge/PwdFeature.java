/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;
class PwdFeature {
    private float[] pressTime;
    private float[] flightTime;
    private float[] maxPressTime;
    private float[] minPressTime;
    private float[] maxFlightTime;
    private float[] minFlightTime;
    private float[] varPress;
    private float[] varFlight;


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
        for (float i:pressTime
             ) {
            sb.append(" "+i);
        }
        sb.append("\nflightTime: ");
        for (float i:flightTime
             ) {
            sb.append(" "+i);
        }
        sb.append("\nmaxPressTime: ");
        for (float i:maxPressTime
             ) {
            sb.append(" "+i);
        }
        sb.append("\nminPressTime: ");
        for (float i:minPressTime
             ) {
            sb.append(" "+i);
        }
        sb.append("\nmaxFLightTime: ");
        for (float i:maxFlightTime
             ) {
            sb.append(" "+i);
        }
        sb.append("\nminFlightTIme: ");
        for (float i:minFlightTime
             ) {
            sb.append(" "+i);
        }
        return sb.toString();
    }
}
