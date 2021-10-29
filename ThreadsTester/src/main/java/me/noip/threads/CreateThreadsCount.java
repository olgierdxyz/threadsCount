package me.noip.threads;

import java.util.logging.Level;
import java.util.logging.Logger;

public class CreateThreadsCount {

    public static int SLEEP;
    public static int THREADS;

    public static void main(String[] args) {
        SLEEP = Integer.parseInt(args[0]);
        THREADS = Integer.parseInt(args[1]);
        System.out.println("# The program started with arguments: sleep=" + SLEEP + ", threads=" + THREADS + ".");       
        for (int i = 1; i <= THREADS; i++) {
            Hello thread = new Hello();
            thread.start();
        }
    }
}

class Hello extends Thread {

    @Override
    public void run() {
        try {
            System.out.println("Thread with threadId " + this.getId() + " has been created.");
            Thread.sleep(CreateThreadsCount.SLEEP * 1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(CreateThreadsCount.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            System.out.println("Thread with threadId " + this.getId() + " has been terminated.");
        }
    }
}
