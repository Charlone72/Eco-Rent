package ch.ecoRent.utility;

import java.awt.*;
import java.awt.image.*;
import java.io.*;
import com.sun.image.codec.jpeg.*;

/**
 * Resizes jpeg image files on your file system.
 * Uses the com.sun.image.codec.jpeg package shipped
 * by Sun with Java 2 Standard Edition.
 *
 * @author Randy Belknap
 */
public class Resize extends Panel {

    private static final long serialVersionUID = -980236977156981019L;

/**
  * @param originalImage the file name of the image to resize
  * @param newImage the new file name for the resized image
  * @param factor the new image's width will be  width * factor.
  * The height will be proportionally scaled.
  */
    public void doResize(String originalImage, String newImage, double factor) {
        Image img = getToolkit().getImage(originalImage);
        loadImage(img);
        int iw = img.getWidth(this);
        //int ih = img.getHeight(this);

        //Reduce the image
        int w = (int)(iw * factor);
        Image i2 = img.getScaledInstance(w, -1, 0);
        loadImage(i2);

        //Load it into a BufferedImage
        int i2w = i2.getWidth(this);
        int i2h = i2.getHeight(this);
        BufferedImage bi = new BufferedImage(i2w, i2h, BufferedImage.TYPE_INT_RGB);
        Graphics2D big = bi.createGraphics();
        big.drawImage(i2,0,0,this);

        //Use JPEGImageEncoder to write the BufferedImage to a file
        try{
         OutputStream os = new FileOutputStream(newImage);
         JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
         encoder.encode(bi);
        } catch(IOException ioe){
         ioe.printStackTrace();
        }
    }

    public void doResize(String originalImage, String newImage, int area) {
        Image img = getToolkit().getImage(originalImage);
        loadImage(img);
        int iw = img.getWidth(this);
        int ih = img.getHeight(this);

        double factor = (double)area / (iw * ih);

        //Reduce the image
        int w = (int)(iw * factor);
        Image i2 = img.getScaledInstance(w, -1, 0);
        loadImage(i2);

        //Load it into a BufferedImage
        int i2w = i2.getWidth(this);
        int i2h = i2.getHeight(this);
        BufferedImage bi = new BufferedImage(i2w, i2h, BufferedImage.TYPE_INT_RGB);
        Graphics2D big = bi.createGraphics();
        big.drawImage(i2,0,0,this);

        //Use JPEGImageEncoder to write the BufferedImage to a file
        try{
            OutputStream os = new FileOutputStream(newImage);
             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
             encoder.encode(bi);
        } catch(IOException ioe){
             ioe.printStackTrace();
        }
    }

    public void doResize(String originalImage, String newImage, int width, int height) {
        Image img = getToolkit().getImage(originalImage);
        loadImage(img);
        //int iw = img.getWidth(this);
        //int ih = img.getHeight(this);

        //double factor = (double)area / (iw * ih);

        //Reduce the image
        //int w = (int)(iw * factor);
        Image i2 = img.getScaledInstance(width, height, 0);
        loadImage(i2);

        //Load it into a BufferedImage
        int i2w = i2.getWidth(this);
        int i2h = i2.getHeight(this);
        BufferedImage bi = new BufferedImage(i2w, i2h, BufferedImage.TYPE_INT_RGB);
        Graphics2D big = bi.createGraphics();
        big.drawImage(i2,0,0,this);

        //Use JPEGImageEncoder to write the BufferedImage to a file
        try{
            OutputStream os = new FileOutputStream(newImage);
             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
             encoder.encode(bi);
        } catch(IOException ioe){
             ioe.printStackTrace();
        }
    }

    /**
     * Cause the image to be loaded into the Image object
     */
    private void loadImage(Image img){
          try {
            MediaTracker tracker = new MediaTracker(this);
              tracker.addImage(img, 0);
              tracker.waitForID(0);
          }catch (Exception e) {}
    }

    public static void main(String args[]) {

          double d = 0.5;
          int area = Integer.parseInt(args[2]);
          Resize resizer = new Resize();


          resizer.doResize("C:\\Temp\\2_1_i.jpg", "C:\\Temp\\2_1_i_resized.jpg", d);
          System.exit(0);
    }

}