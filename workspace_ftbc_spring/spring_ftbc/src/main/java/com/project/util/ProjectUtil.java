package com.project.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ProjectUtil {
	
	//날짜 계산 
	public String diffOfDate(String end) throws Exception
	  {	
		Calendar calendar = Calendar.getInstance();
		DecimalFormat df = new DecimalFormat("00");
        java.util.Date date = calendar.getTime();
        String now = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
	    end = end.replaceAll("[^0-9]", ""); // 가져온 날짜
	    now = now.replaceAll("[^0-9]", ""); // 현재 날짜 
	    int month = Integer.parseInt(now.substring(4,6));
	    
	   // logger.info("이번달은 ?" + month);
	    String cmonth = df.format(calendar.get(Calendar.MONTH));
	    int beskin =  Integer.parseInt(cmonth);

	    int p_yy = Integer.parseInt(end.substring(0,4));
	    int p_mm = Integer.parseInt(end.substring(4,6));
	    int p_dd = Integer.parseInt(end.substring(6,8));
	    int p_hh = Integer.parseInt(end.substring(8,10));
	    int p_mi = Integer.parseInt(end.substring(10,12));
	    int n_yy = Integer.parseInt(now.substring(0,4));    
	    int n_mm = Integer.parseInt(now.substring(4,6));    
	    int n_dd = Integer.parseInt(now.substring(6,8));    
	    int n_hh = Integer.parseInt(now.substring(8,10));   
	    int n_mi = Integer.parseInt(now.substring(10,12));  
	    int answer = n_yy - p_yy;//현재 년 - 받아온 년
	    //logger.info("pdate: " + p_yy + " " + p_mm + " " + p_dd);
	    //logger.info("pdate: " + p_hh + " " + p_mi );
	    //logger.info("ndate: " + n_yy + " " + n_mm + " " + n_dd);
	    //logger.info("ndate: " + n_hh + " " + n_mi );
	    String result = "";
	    if(answer == 0) { //같은년도면
	    	answer = n_mm - p_mm;
	    	//logger.info("같은년도  - 몇개월 ? " + answer);
	    	if(answer ==0 ) { //같은 달이면
	    		answer = n_dd - p_dd;
	    		//logger.info("같은달 - 몇일? " + answer);
	    		if(answer ==0) { //같은 날이면
	    			answer = n_hh - p_hh;
	    			//logger.info("같은날 - 몇시? " + answer);
	    			if(answer ==0) { //같은 시간이면
	    				answer = n_mi - p_mi;
	    				//logger.info("같은날 - 몇분?" + answer);
	    				result = answer + "분 전";
	    			}else {
	    				result = answer+ "시간 전";
	    			}
	    		}else {
	    			result = answer+"일 전";
	    		}
	    	}else if(answer == 1 ) {
	    		int tempdd = (n_dd + beskin) - p_dd;
	    		int week = tempdd/7;
	    		if(week > 0) {
	    			return  week + "주 전";
	    		}
	    	}else {
	    		result = answer + "개월 전";
	    	}
	    }else {
	    	result = answer + "년 전";
	    }
	    return result;			
	  }
}
