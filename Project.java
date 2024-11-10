import javax.swing.*;
import java.awt.*;

public class Project extends JFrame implements Runnable{
    Thread t;
    Project(){
        ImageIcon image1 = new ImageIcon(ClassLoader.getSystemResource("college.jpg"));
        Image i1 = image1.getImage().getScaledInstance(1000, 700, Image.SCALE_DEFAULT); 
        ImageIcon i2 = new ImageIcon(i1);
        JLabel image = new JLabel(i2);
        add(image);

        t = new Thread(this);
        t.start();
        setVisible(true); // frame is invisible by default to make it visual use it.
        
        int x = 1;
        for(int i=2; i<=600; i+=4,x+=1){
            setLocation(600-((i+x)/2),350-(i/2));// distance on x and y axis.
            setSize(i+3*x,i+x); // heigth and width of frame
        
            try {
                Thread.sleep(10);
            } catch (Exception e) {}
        }
    }

    public void run(){
        try {
            Thread.sleep(7000);
            setVisible(false);
        } catch(Exception e){}
    }
    public static void main(String args[]){
        new Project();
    }
}
