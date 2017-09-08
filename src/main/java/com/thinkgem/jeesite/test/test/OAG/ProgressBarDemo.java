package com.thinkgem.jeesite.test.test.OAG;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.event.*;

class ProgressBarDemo implements ActionListener, ChangeListener {
    JFrame f = null;
    OAGProgressBar progressbar;
    JLabel label;
    Timer timer;
    JButton b;

    public ProgressBarDemo() {
        f = new JFrame("progressbar Example");
        Container contentPane = f.getContentPane();
        label = new JLabel(" ", JLabel.CENTER);
        progressbar = new OAGProgressBar();
        progressbar.setValue(0);
        progressbar.addChangeListener(this);
        progressbar.setPreferredSize(new Dimension(800, 20));
        JPanel panel = new JPanel();
        b = new JButton("Start");
        b.setForeground(Color.orange);
        b.addActionListener(this);
        panel.add(b);

        timer = new Timer(50, this);

        contentPane.add(panel, BorderLayout.NORTH);
        contentPane.add(progressbar, BorderLayout.CENTER);
        contentPane.add(label, BorderLayout.SOUTH);

        f.pack();
        f.setVisible(true);

        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });
    }

    public static void main(String[] args) {
        new ProgressBarDemo();
    }

    public void actionPerformed(ActionEvent e) {
        progressbar.setValue(0);
        progressbar.runWork();

    }

    public void stateChanged(ChangeEvent e1) {
        int value = progressbar.getValue();
        if (e1.getSource() == progressbar) {
            label.setText("目前已完成进度：" + Integer.toString(value) + " %");
            label.setForeground(Color.blue);
        }
    }
}
