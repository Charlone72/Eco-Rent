/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ch.ecoRent.utility;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import org.apache.log4j.Logger;

import ch.ecoRent.beans.Prezzi;
import ch.ecoRent.db.DBEngine;

/**
 *
 * @author Carlo Martinenghi
 */
public class Utility {
    private static Logger log = Logger.getLogger("EcoRentLogger");

    public static String createPassword(int len){

        StringBuffer buf = new StringBuffer(128);
        StringBuffer out = new StringBuffer();
        Random rand = new Random();

        for(int i=48; i<= 57;i++)buf.append((char)i); // 0-9
        for(int i=65; i<= 90;i++)buf.append((char)i); // A-Z
        for(int i=97; i<=122;i++)buf.append((char)i); // a-z

        char[] alphanumeric = buf.toString().toCharArray();

        while(out.length() < len){
            int idx=Math.abs(( rand.nextInt() % alphanumeric.length ));
            out.append(alphanumeric[idx]);
        }

        return out.toString();
    }

    public static long countDays(Date d1, Date d2) {

        LocalDate dl1 = dateToLocalDate(d1);
        LocalDate dl2 = dateToLocalDate(d2);

        long days = ChronoUnit.DAYS.between(dl1, dl2);
        System.out.println( days );
        return days+1;

    }

    public static double getPrice(double months, long days, Prezzi prezzi) {
        double prezzo = 0;

        int intMonth = (int)months;
        double decimalMonth = months - intMonth;

        if (months >= 1) {
            switch ((int) months) {
                case 1:
                    prezzo = prezzi.getM1() + (prezzi.getM1()/intMonth*decimalMonth) ;
                    break;
                case 2:
                    prezzo = prezzi.getM2() + (prezzi.getM2()/intMonth*decimalMonth) ;
                    break;
                case 3:
                    prezzo = prezzi.getM3() + (prezzi.getM3()/intMonth*decimalMonth) ;
                    break;
                case 4:
                    prezzo = prezzi.getM4() + (prezzi.getM4()/intMonth*decimalMonth) ;
                    break;
                case 5:
                    prezzo = prezzi.getM5() + (prezzi.getM5()/intMonth*decimalMonth) ;
                    break;
                case 6:
                    prezzo = prezzi.getM6() + (prezzi.getM6()/intMonth*decimalMonth) ;
                    break;
                case 7:
                    prezzo = prezzi.getM7() + (prezzi.getM7()/intMonth*decimalMonth) ;
                    break;
                case 8:
                    prezzo = prezzi.getM8() + (prezzi.getM8()/intMonth*decimalMonth) ;
                    break;
                case 9:
                    prezzo = prezzi.getM9() + (prezzi.getM9()/intMonth*decimalMonth) ;
                    break;
                case 10:
                    prezzo = prezzi.getM10() + (prezzi.getM10()/intMonth*decimalMonth) ;
                    break;
                case 11:
                    prezzo = prezzi.getM11() + (prezzi.getM11()/intMonth*decimalMonth) ;
                    break;
                case 12:
                    prezzo = prezzi.getM12() + (prezzi.getM12()/intMonth*decimalMonth) ;
                    break;
                default:
                    prezzo = prezzi.getMore_m() * months;
                    break;
            }
        } else {//days
            switch ((int) days) {
                case 1:
                    prezzo = prezzi.getG1() ;
                    break;
                case 2:
                    prezzo = prezzi.getG2();
                    break;
                case 3:
                    prezzo = prezzi.getG3();
                    break;
                case 4:
                    prezzo = prezzi.getG4();
                    break;
                case 5:
                    prezzo = prezzi.getG5();
                    break;
                case 6:
                    prezzo = prezzi.getG6();
                    break;
                case 7:
                    prezzo = prezzi.getG7();
                    break;
                default:
                    prezzo = prezzi.getG7() + (prezzi.getMore_g() * (days-7));

                    //return price of month if days is more.
                    Double prezzoM = prezzi.getM1();
                    if(prezzo > prezzoM) {
                        prezzo = prezzoM;
                    }
                    break;
            }
        }
        return prezzo;
    }

    private static LocalDate dateToLocalDate(Date d) {

        LocalDate localDate = LocalDate.parse( new SimpleDateFormat("yyyy-MM-dd").format(d) );
        return localDate;

    }


    public static boolean isLeapYear(int year) {
      Calendar cal = Calendar.getInstance();
      cal.set(Calendar.YEAR, year);
      return cal.getActualMaximum(Calendar.DAY_OF_YEAR) > 365;
    }

    public static double getPercentMonth(int year, int month, int day, boolean isStart) {
        double dayParMonth = 0;
        double days = day;

        switch (month) {
            case 1: case 3: case 5: case 7: case 8: case 10: case 12://31
                dayParMonth = 31;
                break;
            case 2: //Second case 28 0r 29
                if (isLeapYear(year)) {
                    dayParMonth = 29;
                }else {
                    dayParMonth = 28;
                }
                break;
            default: //rest 30
                dayParMonth = 30;
                break;
        }

        if (isStart) {
            days = dayParMonth +1 - day;
        }


        double result = (double)days/dayParMonth;
        return Math.round(result*100)/100D;
    }

    public static Double getMonths(Date d1, Date d2) {
        String sdf1 = new SimpleDateFormat("yyyy-MM-dd").format(d1);
        String sdf2 = new SimpleDateFormat("yyyy-MM-dd").format(d2);

        int y1 = Integer.parseInt(sdf1.substring(0, 4));
        int y2 = Integer.parseInt(sdf2.substring(0, 4));

        int m1 = Integer.parseInt(sdf1.substring(5, 7));
        int m2 = Integer.parseInt(sdf2.substring(5, 7));

        int dd1 = Integer.parseInt(sdf1.substring(8));
        int dd2 = Integer.parseInt(sdf2.substring(8));

        int deltaY = y2-y1;

        if(deltaY > 0) {
            m2 = m2 + (12*deltaY);
        }

        int months = (m2 - m1) - 1;
        if(months < 0) {
            return 0d;
        }

        double startM = getPercentMonth(y1,m1,dd1, true);

        double endM = getPercentMonth(y2,m2,dd2, false);

        return 1d* (startM + months + endM);
    }


    public static final double roundDouble(double d, int places) {
        return Math.round(d * Math.pow(10, (double) places)) / Math.pow(10,
            (double) places);
    }


}
