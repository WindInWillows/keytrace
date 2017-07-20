/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;


import java.util.ArrayList;


public class TextJudger {

    private final int flightTimesThreshold;
    private final int flightTimeThreshold;
    private final int pressTimeThreshold;
    private final int pressTimesThreshold;
    private final float pressWeight;

    public TextJudger(int flightTimesThreshold, int flightTimeThreshold, int pressTimeThreshold, int pressTimesThreshold, float pressWeight) {
        this.flightTimesThreshold = flightTimesThreshold;
        this.flightTimeThreshold = flightTimeThreshold;
        this.pressTimeThreshold = pressTimeThreshold;
        this.pressTimesThreshold = pressTimesThreshold;
        this.pressWeight = pressWeight;
    }

    public TextJudger() {
        this.flightTimesThreshold = 1;
        this.flightTimeThreshold = 2000;
        this.pressTimeThreshold = 500;
        this.pressTimesThreshold = 1;
        this.pressWeight = 0.4f;
    }

    public float compare(PeopleText train, PeopleText test) {
        TextFeature trainTextFeature = PeopleText.getFeature(train);
        TextFeature testTextFeature = PeopleText.getFeature(test);
        ArrayList<Float> trainPressVec = new ArrayList<>();
        ArrayList<Float> testPressVec = new ArrayList<>();
        ArrayList<Float> trainFlightVec = new ArrayList<>();
        ArrayList<Float> testFlightVec = new ArrayList<>();
        ArrayList<Float> trainFlightVec2 = new ArrayList<>();
        ArrayList<Float> testFlightVec2 = new ArrayList<>();
        ArrayList<Float> trainFlightVec3 = new ArrayList<>();
        ArrayList<Float> testFlightVec3 = new ArrayList<>();
        for (Integer i : trainTextFeature.getPress().keySet()
                ) {
            if (testTextFeature.getPress().keySet().contains(i)) {
                if (trainTextFeature.getPress().get(i) <= pressTimeThreshold && testTextFeature.getPress().get(i) <= pressTimeThreshold
                        && trainTextFeature.getPressTimes().get(i) >= pressTimesThreshold && testTextFeature.getPressTimes().get(i) >= pressTimesThreshold) {
                    trainPressVec.add(trainTextFeature.getPress().get(i));
                    testPressVec.add(testTextFeature.getPress().get(i));
                }
            }
        }
        for (String i : trainTextFeature.getFlight().keySet()
                ) {
            switch (i.split("-").length) {
                case 2:
                    if (testTextFeature.getFlight().keySet().contains(i)) {
                        if (trainTextFeature.getFlight().get(i) <= flightTimeThreshold && testTextFeature.getFlight().get(i) <= flightTimeThreshold
                                && trainTextFeature.getFlightTimes().get(i) >= flightTimesThreshold && testTextFeature.getFlightTimes().get(i) >= flightTimesThreshold) {
                            trainFlightVec.add(trainTextFeature.getFlight().get(i));
                            testFlightVec.add(testTextFeature.getFlight().get(i));
                        }
                    }
                    break;
                case 3:
                    if (testTextFeature.getFlight().keySet().contains(i)) {
                        trainFlightVec2.add(trainTextFeature.getFlight().get(i));
                        testFlightVec2.add(testTextFeature.getFlight().get(i));
                    }
                    break;
                case 4:
                    if (testTextFeature.getFlight().keySet().contains(i)) {
                        trainFlightVec3.add(trainTextFeature.getFlight().get(i));
                        testFlightVec3.add(testTextFeature.getFlight().get(i));
                        break;
                    }
            }


        }
        //System.out.println(trainTextFeature.getPress());
//        System.out.println(trainTextFeature.getFlight());
//        System.out.println(testTextFeature.getFlight());
//        System.out.println(trainPressVec);
//        System.out.println(testPressVec);
//        System.out.println(trainFlightVec);
//        System.out.println(testFlightVec);
        float pressSimilar = TextJudger.cosSimilar(trainPressVec, testPressVec);
        float flightSimilar = TextJudger.cosSimilar(trainFlightVec, testFlightVec);
        float flightSimilar2 = TextJudger.cosSimilar(trainFlightVec2, testFlightVec2);
        float flightSimilar3 = TextJudger.cosSimilar(trainFlightVec3, testFlightVec3);
//        float pressSimilar = TextJudger.weightCosSimilar(trainPressVec,trainPressTimesVec,testPressVec,testPressTimesVec);
//        float flightSimilar = TextJudger.weightCosSimilar(trainFlightVec,trainFlightTimesVec,testFlightVec,testFlightTimesVec);
        flightSimilar = (float) Math.pow(flightSimilar * flightSimilar2 * flightSimilar3, 1.0 / 3);
        float similar = 0;
        if (trainPressVec.size() > 1 && trainFlightVec.size() > 1) {
            similar = pressWeight * pressSimilar + (1 - pressWeight) * flightSimilar;
        } else if (trainPressVec.size() > 1 && trainFlightVec.size() <= 1) {
            similar = pressSimilar;
        } else if (trainFlightVec.size() > 1) {
            similar = flightSimilar;
        }
//        System.out.println("pressSimilar" + pressSimilar);
//        System.out.println("flightSimilar" + flightSimilar);

        return similar;

    }

    /**
     * @param trainList train data List
     * @param test      test data
     * @return The similarity between train data List and test data. Value from 0 to 1
     */
    public float compare(PeopleText[] trainList, PeopleText test) {
        TextFeature trainTextFeature = PeopleText.getFeature(trainList);
        TextFeature testTextFeature = PeopleText.getFeature(test);
        ArrayList<Float> trainPressVec = new ArrayList<>();
        ArrayList<Float> testPressVec = new ArrayList<>();
        ArrayList<Float> trainFlightVec = new ArrayList<>();
        ArrayList<Float> testFlightVec = new ArrayList<>();
        ArrayList<Float> trainFlightVec2 = new ArrayList<>();
        ArrayList<Float> testFlightVec2 = new ArrayList<>();
        ArrayList<Float> trainFlightVec3 = new ArrayList<>();
        ArrayList<Float> testFlightVec3 = new ArrayList<>();
        for (Integer i : trainTextFeature.getPress().keySet()
                ) {
            if (testTextFeature.getPress().keySet().contains(i)) {
                if (trainTextFeature.getPress().get(i) <= pressTimeThreshold && testTextFeature.getPress().get(i) <= pressTimeThreshold
                        && trainTextFeature.getPressTimes().get(i) >= pressTimesThreshold && testTextFeature.getPressTimes().get(i) >= pressTimesThreshold) {
                    trainPressVec.add(trainTextFeature.getPress().get(i));
                    testPressVec.add(testTextFeature.getPress().get(i));
                }
            }
        }
        for (String i : trainTextFeature.getFlight().keySet()
                ) {
            switch (i.split("-").length) {
                case 2:
                    if (testTextFeature.getFlight().keySet().contains(i)) {
                        if (trainTextFeature.getFlight().get(i) <= flightTimeThreshold && testTextFeature.getFlight().get(i) <= flightTimeThreshold
                                && trainTextFeature.getFlightTimes().get(i) >= flightTimesThreshold && testTextFeature.getFlightTimes().get(i) >= flightTimesThreshold) {
                            trainFlightVec.add(trainTextFeature.getFlight().get(i));
                            testFlightVec.add(testTextFeature.getFlight().get(i));
                        }
                    }
                    break;
                case 3:
                    if (testTextFeature.getFlight().keySet().contains(i)) {
                        trainFlightVec2.add(trainTextFeature.getFlight().get(i));
                        testFlightVec2.add(testTextFeature.getFlight().get(i));
                    }
                    break;
                case 4:
                    if (testTextFeature.getFlight().keySet().contains(i)) {
                        trainFlightVec3.add(trainTextFeature.getFlight().get(i));
                        testFlightVec3.add(testTextFeature.getFlight().get(i));
                        break;
                    }
            }


        }
//        float sum1 = 0;
//        float sum2 = 0;
//        for (int i = 0; i < trainPressVec.size(); i++) {
//            sum1 += trainPressVec.get(i);
//            sum2 += testPressVec.get(i);
//        }
//        for (int i = 0; i < testPressVec.size(); i++) {
//            testPressVec.set(i, testPressVec.get(i) * (sum1 / sum2));
//        }
//        sum1 = sum2 = 0;
//        for (int i = 0; i < trainFlightVec.size(); i++) {
//            sum1 += trainFlightVec.get(i);
//            sum2 += testFlightVec.get(i);
//        }
//        for (int i = 0; i < testFlightVec.size(); i++) {
//            testFlightVec.set(i, testFlightVec.get(i) * (sum1 / sum2));
//        }
        testPressVec = transfer(trainPressVec,testPressVec,3);
        testFlightVec = transfer(trainFlightVec,testFlightVec,3);
        testFlightVec2 = transfer(trainFlightVec2,testFlightVec2,5);
        testFlightVec3 = transfer(trainFlightVec3,testFlightVec3,7);

        float pressSimilar = TextJudger.cosSimilar(trainPressVec, testPressVec);
        float flightSimilar = TextJudger.cosSimilar(trainFlightVec, testFlightVec);
        float flightSimilar2 = TextJudger.cosSimilar(trainFlightVec2, testFlightVec2);
        float flightSimilar3 = TextJudger.cosSimilar(trainFlightVec3, testFlightVec3);
        System.out.println("flightSimilar = " + flightSimilar);
        System.out.println("flightSimilar2 = " + flightSimilar2);
        System.out.println("flightSimilar3 = " + flightSimilar3);
        Mylog.log("trainFlightVec",trainFlightVec);
        Mylog.log("testFlightVec",testFlightVec);
        Mylog.log("trainFlightVec2",trainFlightVec2);
        Mylog.log("testFlightVec2",testFlightVec2);
        Mylog.log("trainFlightVec3",trainFlightVec3);
        Mylog.log("testFlightVec3",testFlightVec3);

//        float pressSimilar = TextJudger.weightCosSimilar(trainPressVec,trainPressTimesVec,testPressVec,testPressTimesVec);
//        float flightSimilar = TextJudger.weightCosSimilar(trainFlightVec,trainFlightTimesVec,testFlightVec,testFlightTimesVec);
        if (flightSimilar3!=0) {
            flightSimilar = (float) Math.pow(flightSimilar * flightSimilar2 * flightSimilar3, 1.0 / 3);
        }
        else if (flightSimilar2!=0){
            flightSimilar = (float) Math.pow(flightSimilar * flightSimilar2, 1.0 / 2);
        }
        float similar = 0;
        if (trainPressVec.size() > 1 && trainFlightVec.size() > 1) {
            similar = pressWeight * pressSimilar + (1 - pressWeight) * flightSimilar;
        } else if (trainPressVec.size() > 1 && trainFlightVec.size() <= 1) {
            similar = pressSimilar;
        } else if (trainFlightVec.size() > 1) {
            similar = flightSimilar;
        }
        return similar;
    }

    /**
     * @param a input vector a
     * @param b input vector b
     * @return normalized Cos Similar ,Value from 0 to 1
     * @throws IllegalArgumentException when len(a) != len(b)
     */
    private static float cosSimilar(ArrayList<Float> a, ArrayList<Float> b) throws IllegalArgumentException {
        if (a.size() != b.size()) {
            throw new IllegalArgumentException("Length of vector must equal");
        }
        double lenA, lenB;
        double tmp = 0;
        double tmp2 = 0;
        for (int i = 0; i < a.size(); i++) {
            tmp += a.get(i) * a.get(i);
            tmp2 += b.get(i) * b.get(i);
        }
        lenA = Math.sqrt(tmp);
        lenB = Math.sqrt(tmp2);
        tmp = 0;
        for (int i = 0; i < a.size(); i++) {
            tmp += a.get(i) * b.get(i) / (lenA * lenB);
        }
        if (tmp < 0) {
            tmp = 0;
        }
        return (float) tmp;
    }

    /**
     * @param a       input vector a
     * @param aWeight the weight of a
     * @param b       input vector b
     * @param bWeight the weight of b
     * @return normalized Weighted Cos Similar ,Value from 0 to 1
     * @throws IllegalArgumentException
     */
    private static float weightCosSimilar(ArrayList<Float> a, ArrayList<Integer> aWeight, ArrayList<Float> b, ArrayList<Integer> bWeight) throws IllegalArgumentException {
        if (a.size() != b.size() || aWeight.size() != a.size() || bWeight.size() != b.size()) {
            throw new IllegalArgumentException("Length of vector must equal");
        }
        double lenA, lenB;
        double tmp = 0;
        double tmp2 = 0;
        float sumOfAweight = 0;
        float sumOfBweight = 0;
        for (int i = 0; i < a.size(); i++) {
            tmp += a.get(i) * a.get(i);
            tmp2 += b.get(i) * b.get(i);
            sumOfAweight += aWeight.get(i);
            sumOfBweight += bWeight.get(i);
        }
        lenA = Math.sqrt(tmp);
        lenB = Math.sqrt(tmp2);
        tmp = 0;
        for (int i = 0; i < a.size(); i++) {
//            System.out.println("#######################");
//            System.out.println(a.get(i));
//            System.out.println(b.get(i));
//            System.out.println(aWeight.get(i));
//            System.out.println(bWeight.get(i));
            tmp += a.get(i) * b.get(i) * (aWeight.get(i) + bWeight.get(i));
        }
        if (tmp < 0) {
            tmp = 0;
        }
        System.out.println(sumOfAweight + sumOfBweight);
        return (float) (tmp / (lenA * lenB) / (sumOfAweight + sumOfBweight));
    }

    public static void main(String[] args) {
        ArrayList<Float> a = new ArrayList<>();
        ArrayList<Float> b = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            a.add((float) i);
            b.add((float) i * -1);
        }
        System.out.println(TextJudger.cosSimilar(a, b));
    }

    private ArrayList<Float> transfer(ArrayList<Float> trainVec , ArrayList<Float> testVec,float lambda){
        float sumTrain = 0;
        float sumTest = 0;
        for (int i = 0; i < trainVec.size(); i++) {
            sumTrain += Math.abs(trainVec.get(i));
            sumTest += Math.abs(testVec.get(i));
        }
        for (int i = 0; i < testVec.size(); i++) {
            testVec.set(i,testVec.get(i)+lambda * (sumTest-sumTrain) / (testVec.size() * sumTrain));
        }
        return testVec;

    }
    public float getFlightTimesThreshold() {
        return flightTimesThreshold;
    }

    public float getFlightTimeThreshold() {
        return flightTimeThreshold;
    }

    public float getPressTimeThreshold() {
        return pressTimeThreshold;
    }

    public float getPressTimesThreshold() {
        return pressTimesThreshold;
    }

    public float getPressWeight() {
        return pressWeight;
    }
}

