package ch.ecoRent.utility;



public class HtmlUtility {
    public static String isSelected(String sDiv, String lDiv)
    {
        if(sDiv.equals(lDiv)){
            return "selected";
        }else{
            return "";
        }

    }

    public static String isActive(String sDiv, String lDiv)
    {
        if(sDiv.equals(lDiv)){
            return "class=active";
            //return "class=" + '"' + "active" + '"' ;
        }else{
            return "";
        }

    }

    public static String showString(String text, Integer numOfChar)
    {
        if(text.length() > numOfChar){
            String subStr = text.substring(0,numOfChar - 3) + "...";
            return "<a href=" + '"'+ "#" + '"' + " data-toggle=" + '"'+ "tooltip" + '"' + " title=" + '"' + text + '"' + ">" + subStr + "</a>";
            //return "<a href='#' data-toggle='tooltip' title='Hooray!'>" + + "</a>";
        }else{
            return text;
        }

    }





}
