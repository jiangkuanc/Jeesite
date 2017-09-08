package com.thinkgem.jeesite.test.test.OAG;

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;

import javax.swing.border.*;

public class OAGProgressBar extends JProgressBar {

    int value = 0;
    private int count = 0;
    private static long total = 100;
    boolean ischanged = true;
    static boolean isCompleted = true;

    public OAGProgressBar() {
        this.setForeground(SystemColor.inactiveCaption);
        this.setBorder(BorderFactory.createEtchedBorder(EtchedBorder.RAISED));
        this.setOrientation(JProgressBar.HORIZONTAL);
        this.setBorderPainted(true);
        this.setMinimum(0);
        this.setMaximum(100);

        //定义两个线程完成相应的工作

    }

    //--------------------------------------------------

    public void setAtribute() {

    }

    //--------------------------------------------------
    public void runWork() {

        if (!isCompleted) {
            JOptionPane.showMessageDialog(null, "正在工作请稍候！", "提示", JOptionPane.INFORMATION_MESSAGE);
            return;
        }

        ischanged = true;
        count = 0;

        isCompleted = false;


        Runnable runA = new Runnable() {
            public void run() {
                try {
                    //oth.setProgressBarValue();
                    setProgressBarValue();
                } catch (InterruptedException e) {

                }
            }
        }; //end runA


        Runnable runB = new Runnable() {
            public void run() {
                try {
                    // oth.insertOAGData(total);
                    insertOAGData(100);
                } catch (InterruptedException e) {

                }
            }
        }; //end runA


        Thread ta = new Thread(runA, "ThreadA");
        Thread tb = new Thread(runB, "ThreadB");

        tb.start();

        ta.start();


    }

    public synchronized void setProgressBarValue()
            throws InterruptedException {
        //count < total&&
        while (!isCompleted) {
            while (!ischanged) {
                System.out.println("setProgressBarValue--wait   " + count);
                wait();
            }
            System.out.println("setProgressBarValue----getValue: " + count + " --runing   " + isCompleted);
            setValue(count);
            ischanged = false;
            notifyAll();
        }
        System.out.println("setProgressBarValue--Completed!  " + isCompleted);
        if (count >= total) {

            ischanged = false;
            isCompleted = true;
            System.out.println("setProgressBarValue--Completed!");
            notifyAll();
        }
    }

    public synchronized void insertOAGData(long n)
            throws InterruptedException {
        long i = 0;

        while (i < n && !isCompleted) {
            while (ischanged) {
                System.out.println("insertOAGData--waiting    " + i);
                wait();
            }
            i++;
            System.out.println("insertOAGData--running +  " + i);
            Thread.sleep(50);
            count++;
            ischanged = true;
            notifyAll();
        }
        System.out.println("insertOAGData--Completed!");
        if (i >= n) {
            isCompleted = true;
            ischanged = true;
            System.out.println("insertOAGData--Completed!");
            notifyAll();
        }
    }

}