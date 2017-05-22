package com.keytrac.judge;

public class PwdJudger {
    private float pressWeight;

    public PwdJudger(float pressWeight) {
        this.pressWeight = pressWeight;
    }

//    public float compare(PeoplePassword[] trainList, PeoplePassword test, String password) throws IllegalArgumentException {
//        float pressSimilar = 0;
//        float flightSimilar = 0;
//        PwdFeature trainFeature = PeoplePassword.getFeature(trainList, password);
//        PwdFeature testFeature = PeoplePassword.getFeature(test, password);
//        float[] trainPress = trainFeature.getPressTime();
//        float[] trainFlight = trainFeature.getFlightTime();
//        float[] testPress = testFeature.getPressTime();
//        float[] testFlight = testFeature.getFlightTime();
//        float[] varPress = trainFeature.getVarPress();
//        float[] varFlight = trainFeature.getVarFlight();
//        float[] maxPress = trainFeature.getMaxPressTime();
//        float[] minPress = trainFeature.getMinPressTime();
//        float[] maxFlight = trainFeature.getMaxFlightTime();
//        float[] minFlight = trainFeature.getMinFlightTime();
//        float[] pressSimilarList = new float[password.length()];
//        float[] flightSimilarList = new float[password.length()];
//        if (trainPress.length != testPress.length || trainFlight.length != testFlight.length) {
//            throw new IllegalArgumentException("\nmust input the same password!");
//        }
////        System.out.println("maxPress ");
////        for (float i:maxPress
////             ) {
////            System.out.println(i);
////        }
////        System.out.println("minPress");
////        for (float i:minPress
////             ) {
////            System.out.println(i);
////        }
////        System.out.println("maxFlight");
////        for (float i:maxFlight
////             ) {
////            System.out.println(i);
////        }
////        System.out.println("minFlight");
////        for (float i:minFlight
////             ) {
////            System.out.println(i);
////        }
//        for (int i = 0; i < trainPress.length; i++) {
//            if (testPress[i] < maxPress[i] && testPress[i] > minPress[i]) {
//                pressSimilarList[i] = 1;
//            } else {
//                if (testPress[i] > maxPress[i]) {
//                    //pressSimilarList[i] = (float) (Math.pow(Math.E, (-1) * Math.pow(((testPress[i] - maxPress[i]) / (maxPress[i] - minPress[i]))-1, 2))); // Math.sqrt(2 * Math.PI));
//                    pressSimilarList[i] = (float) (1 / (1+Math.pow(Math.E,(-2) * (maxPress[i] - minPress[i]) / (testPress[i] - maxPress[i]))));
//                } else {
//                    //pressSimilarList[i] = (float) (Math.pow(Math.E, (-1) * Math.pow(((minPress[i] - testPress[i]) / (maxPress[i] - minPress[i]))-1, 2))); // Math.sqrt(2 * Math.PI));
//                    pressSimilarList[i] = (float) (1 / (1+Math.pow(Math.E,(-2) * (maxPress[i] - minPress[i]) / (minPress[i] - testPress[i]))));
//                }
//            }
//        }
//        for (int i = 0; i < trainFlight.length; i++) {
//            if (testFlight[i] < maxFlight[i] && testFlight[i] > minFlight[i]) {
//                flightSimilarList[i] = 1;
//            } else {
//                //flightSimilarList[i] = (float) (Math.pow(Math.E, (-1) * Math.pow(testFlight[i] - trainFlight[i], 2) / (2 * varFlight[i])) / (Math.sqrt(varFlight[i]) * Math.sqrt(2 * Math.PI)));
//                if (testFlight[i] < maxFlight[i]){
//                    //flightSimilarList[i] = (float) (Math.pow(Math.E, (-1) * Math.pow(((testFlight[i] - maxFlight[i]) / (maxFlight[i] - minFlight[i]))-1, 2))); // Math.sqrt(2 * Math.PI));
//                    flightSimilarList[i] = (float) (1 / (1+Math.pow(Math.E,(-2) * (maxFlight[i] - minFlight[i]) / (testFlight[i] - maxFlight[i]))));
//                }
//                else {
//                    //flightSimilarList[i] = (float) (Math.pow(Math.E, (-1) * Math.pow(((minFlight[i] - testFlight[i]) / (maxFlight[i] - minFlight[i]))-1, 2))); // Math.sqrt(2 * Math.PI));
//                    flightSimilarList[i] = (float) (1 / (1+Math.pow(Math.E,(-2) * (maxFlight[i] - minFlight[i]) / (minFlight[i] - minFlight[i]))));
//                }
//            }
//        }
//        for (int i = 0; i < pressSimilarList.length; i++) {
//            pressSimilar += pressSimilarList[i];
//        }
//        pressSimilar = pressSimilar / pressSimilarList.length;
//        for (int i = 0; i < flightSimilarList.length; i++) {
//            flightSimilar += flightSimilarList[i];
//        }
//        flightSimilar = flightSimilar / flightSimilarList.length;
//        for (float i : pressSimilarList
//                ) {
//            System.out.println(i);
//        }
//        for (float i : flightSimilarList
//                ) {
//            System.out.println(i);
//        }
//        return pressSimilar * pressWeight + flightSimilar * (1 - pressWeight);
//    }

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

//        for (int i = 0; i < trainPress.length; i++) {
//            if (Math.abs(testPress[i] - maxPress[i]) < 0.5 * (maxPress[i] - minPress[i]) || Math.abs(minPress[i] - testPress[i]) < 0.5 * (maxPress[i]-minPress[i])){
//                testPress[i] = trainPress[i];
//            }
//        }
//        for (int i = 0; i < trainFlight.length; i++) {
//            if (Math.abs(testFlight[i] - maxFlight[i]) < 0.5 * (maxFlight[i] - minFlight[i]) || Math.abs(minFlight[i] - testFlight[i]) < 0.5 * (maxFlight[i] - minFlight[i])){
//                testFlight[i] = trainFlight[i];
//            }
//        }
        System.out.println("trainPress");
        for (float i:trainPress
                ) {
            System.out.print(" " + i);
        }
        System.out.println("\ntestPress");
        for (float i:testPress
                ) {
            System.out.print(" " + i);
        }
        System.out.println("\ntrainFlight");
        for (float i:trainFlight
                ) {
            System.out.print(" " + i);
        }
        System.out.println("\ntestFlight");
        for (float i:testFlight
                ) {
            System.out.print(" " + i);
        }
        float times = 0;
        float sum1 = 0;
        float sum2 = 0;
        for (int i = 0; i < testPress.length; i++) {
            sum1 +=testPress[i];
            sum2 += trainPress[i];
        }
        times = sum2 / sum1;
        for (int i = 0; i < testPress.length; i++) {
            testPress[i] *= times;
        }
        sum1 = sum2 = 0;

        for (int i = 0; i < testFlight.length; i++) {
            sum1 += testFlight[i];
            sum2 += trainFlight[i];
        }
        times = sum2 / sum1;
        for (int i = 0; i < testFlight.length; i++) {
            testFlight[i] *= times;
        }
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