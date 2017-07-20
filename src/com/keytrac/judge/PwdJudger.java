/*
 * Copyright (c) 2017 Ziqi Yuan All rights reserved
 */

package com.keytrac.judge;

public class PwdJudger {
    private float pressWeight;

    public PwdJudger(float pressWeight) {
        this.pressWeight = pressWeight;
    }
    private static float cosSimilar(float[] a, float[] b) throws IllegalArgumentException {
        if (a.length != b.length) {
            throw new IllegalArgumentException("Length of vector must equal");
        }
        double lenA, lenB;
        double tmp = 0;
        double tmp2 = 0;
        for (int i = 0; i < a.length; i++) {
            tmp += a[i] * a[i];
            tmp2 += b[i] * b[i];
        }
        lenA = Math.sqrt(tmp);
        lenB = Math.sqrt(tmp2);
        tmp = 0;
        for (int i = 0; i < a.length; i++) {
            tmp += a[i] * b[i] / (lenA * lenB);
        }
        if (tmp < 0) {
            tmp = 0;
        }
        return (float) tmp;
    }

    public float compare(PeoplePassword[] trainList, PeoplePassword test, String password) throws IllegalArgumentException {
        float pressSimilar;
        float flightSimilar;
        PwdFeature trainFeature = PeoplePassword.getFeature(trainList, password);
        PwdFeature testFeature = PeoplePassword.getFeature(test, password);
//        System.out.println("trainFeature = " + trainFeature);
//        System.out.println("testFeature = " + testFeature);
        float[] trainPress = trainFeature.getPressTime();
        float[] trainFlight = trainFeature.getFlightTime();
        float[] testPress = testFeature.getPressTime();
        float[] testFlight = testFeature.getFlightTime();
        float[] maxPress = trainFeature.getMaxPressTime();
        float[] minPress = trainFeature.getMinPressTime();
        float[] maxFlight = trainFeature.getMaxFlightTime();
        float[] minFlight = trainFeature.getMinFlightTime();
        if (trainPress.length != testPress.length || trainFlight.length != testFlight.length) {
            throw new IllegalArgumentException("\nmust input the same password!");
        }

        float sumPressTrain=0;
        float sumPressTest=0;
        float sumFlightTrain=0;
        float sumFlightTest = 0;
        for (int i = 0; i < trainPress.length; i++) {
            sumPressTrain += trainPress[i];
            sumPressTest += testPress[i];
        }
        for (int i = 0; i < trainFlight.length; i++) {
            sumFlightTrain += Math.abs(trainFlight[i]);
            sumFlightTest += Math.abs(testFlight[i]);
        }
        for (int i = 0; i < testPress.length; i++) {
            testPress[i] += 3*(sumPressTest - sumPressTrain) / (trainPress.length * sumPressTrain);
        }
        for (int i = 0; i < testFlight.length; i++) {
            testFlight[i] += 3*(sumFlightTest - sumFlightTrain) / (trainFlight.length * sumFlightTrain );
        }
//        System.out.println("trainPress = " );
//        for (int i = 0; i < trainPress.length; i++) {
//            System.out.print(trainPress[i] + " ");
//        }
//        System.out.println("\ntestPress = ");
//        for (int i = 0; i < testPress.length; i++) {
//            System.out.print(testPress[i]+ " ");
//        }
//        System.out.println("\ntrainFlight = ");
//        for (int i = 0; i < trainFlight.length; i++) {
//            System.out.print(trainFlight[i]+ " ");
//        }
//        System.out.println("\ntestFlight = ");
//        for (int i = 0; i < testFlight.length; i++) {
//            System.out.print(testFlight[i]+ " ");
//        }
        /**
         * 下面这些代码是将两次的总时间拉伸成一致
         */
//        float times = 0;
//        float sum1 = 0;
//        float sum2 = 0;
//        for (int i = 0; i < testPress.length; i++) {
//            sum1 +=testPress[i];
//            sum2 += trainPress[i];
//        }
//        times = sum2 / sum1;
//        for (int i = 0; i < testPress.length; i++) {
//            testPress[i] *= times;
//        }
//        sum1 = sum2 = 0;
//
//        for (int i = 0; i < testFlight.length; i++) {
//            sum1 += testFlight[i];
//            sum2 += trainFlight[i];
//        }
//        times = sum2 / sum1;
//        for (int i = 0; i < testFlight.length; i++) {
//            testFlight[i] *= times;
//        }
        pressSimilar = PwdJudger.cosSimilar(trainPress,testPress);
        flightSimilar = PwdJudger.cosSimilar(trainFlight,testFlight);
        return pressSimilar * pressWeight + (1 - pressWeight) * flightSimilar;
    }

    public static void main(String[] args) {
        int[] train_char1 = {65, 65, 80, 83, 80, 83, 76, 76, 76, 76, 75, 75, 81, 87, 81, 87, 49, 50, 49, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        int[] train_state1 = {0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        int[] train_time1 = {0, 119, 141, 209, 228, 299, 359, 419, 479, 549, 629, 699, 929, 1039, 1090, 1149, 1229, 1309, 1369, 1419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        System.out.println(train_char1.length == train_state1.length);
        System.out.println(train_state1.length == train_time1.length);
        int[] train_char2 = {65, 65, 80, 80, 83, 83, 76, 76, 76, 76, 75, 75, 81, 87, 81, 87, 49, 50, 49, 50};
        int[] train_state2 = {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1};
        int[] train_time2 = {0, 120, 159, 229, 259, 349, 430, 489, 550, 619, 682, 762, 909, 1010, 1090, 1140, 1220, 1290, 1360, 1409};
        System.out.println(train_char2.length == train_state2.length);
        System.out.println(train_state2.length == train_time2.length);
        int[] test_char1 = {65, 80, 65, 80, 83, 83, 76, 76, 76, 76, 75, 75, 81, 87, 81, 87, 49, 50, 49, 50};
        int[] test_state1 = {0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1};
        int[] test_time1 = {0, 110, 122, 199, 240, 344, 379, 449, 490, 569, 650, 731, 830, 929, 1039, 1059, 1172, 1240, 1321, 1372};
        System.out.println(test_char1.length == test_state1.length);
        System.out.println(test_state1.length == test_time1.length);
        PeoplePassword p1 = new PeoplePassword(train_char1, train_state1, train_time1);
        PeoplePassword p2 = new PeoplePassword(train_char2, train_state2, train_time2);
        PeoplePassword p3 = new PeoplePassword(test_char1, test_state1, test_time1);
        PeoplePassword[] trainList = new PeoplePassword[2];
        trainList[0] = p1;
        trainList[1] = p2;
        PwdJudger pj = new PwdJudger(0.5f);
        System.out.println(pj.compare(trainList, p3, "apsllkqw12"));
    }
}
