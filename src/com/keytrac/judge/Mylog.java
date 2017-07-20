package com.keytrac.judge;

import java.util.ArrayList;

/**
 * Created by 56363 on 2017/7/18.
 */
public class Mylog {
    public static void log(String name,ArrayList list){
        System.out.println(name);
        for (int i = 0; i < list.size(); i++) {
            System.out.print(list.get(i)+" ");
        }
    }
    public static void log(String name,int[] list){
        System.out.println(name);
        for (int i = 0; i < list.length; i++) {
            System.out.print(list[i]+" ");
        }
    }
}
