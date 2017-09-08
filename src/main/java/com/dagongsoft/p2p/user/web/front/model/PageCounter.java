package com.dagongsoft.p2p.user.web.front.model;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * 页面存储个数计数器包装类
 *
 * @author Joe
 */
public class PageCounter {
    public PageCounter(AtomicInteger counter) {
        this.counter = counter;
    }

    public PageCounter() {
    }

    private AtomicInteger counter;

    public AtomicInteger getCounter() {
        return counter;
    }

    public void setCounter(AtomicInteger counter) {
        this.counter = counter;
    }

    /**
     * 当前PageCounter递增1
     *
     * @param counter
     * @return
     */
    public AtomicInteger incr(AtomicInteger counter) {
        return this.incr(counter);
    }

}
