/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

import java.util.HashMap;
import java.util.Map;

class TextFeature {
    private Map<Integer, Float> press;
    private Map<String, Float> flight;
    private Map<Integer, Integer> pressTimes;
    private Map<String, Integer> flightTimes;

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
            sb.append(i+":" + flight.get(i) + " ");
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
