package com.bizconf.inner.portal.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bizconf.inner.portal.bean.BizInfo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import com.libernate.liberc.utils.LiberContainer;

/**
 * @desc 
 * @author Administrator
 * @date 2013-12-18
 */
public class JsonUtil {
	
	static final String STORAGE_BASE =LiberContainer.getContainer().getServletContext().getRealPath("/static")+File.separator+"json";
	//获取json
	public static String getJsonFromBean(Object object,String datePattern){
		Gson g = new GsonBuilder().registerTypeAdapter(Date.class, new DateAdapter(datePattern)).excludeFieldsWithoutExposeAnnotation().create();
		return g.toJson(object);
	}
	
	public static String getJsonFromInfoList(List<BizInfo> infos,String datePattern){
		Gson g = new GsonBuilder().registerTypeAdapter(Date.class, new DateAdapter(datePattern)).excludeFieldsWithoutExposeAnnotation().create();
		return g.toJson(infos);
	}
	
	public static class DateAdapter extends TypeAdapter<Date> {
		
		private String pattern = "yyyy-MM-dd HH:mm:ss";
		
		public String getPattern() {
			return pattern;
		}
		public void setPattern(String pattern) {
			this.pattern = pattern;
		}
		
		public DateAdapter(String pattern){
			this.pattern = pattern;
		}
		@Override
		public Date read(JsonReader reader) throws IOException {
			if (reader.peek() == JsonToken.NULL) {
			         reader.nextNull();
			         return null;
			    }
			  String time = reader.nextString();
			  Date d  = null; 
			  try {
				  d = new SimpleDateFormat(pattern).parse(time);
			  } catch (Exception e) {
					d = new Date();
			  }
			  return d;
		}

		@Override
		public void write(JsonWriter writer, Date value) throws IOException {
			 if (value == null) {
		         writer.nullValue();
		         return;
		       }
		       String time =  new SimpleDateFormat(pattern).format(value);
		       writer.value(time);
		     }
	}
	
	public static void genStaticJson(String jsonName,List<BizInfo> infos){
		 String path = STORAGE_BASE+File.separator+jsonName+".js";
		 BufferedWriter maker = null;
		 String json = "var "+jsonName+"=";
		 json += getJsonFromInfoList(infos, "yyyy-MM-dd HH:mm");
		 try {
				maker = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(path)),"UTF-8"));
				maker.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(maker!=null){
					maker.flush();
					maker.close();
				} 
			}catch (Exception e) {
			
				e.printStackTrace();
			}
		}
	}
	
	
	public static void main(String ...args){
		
		BizInfo b0 = new BizInfo();
		BizInfo b1 = new BizInfo();
		b0.setId(12);
		b1.setId(15);
		
		List<BizInfo> list = new ArrayList<BizInfo>();
		list.add(b0);
		list.add(b1);
		
		System.out.println(getJsonFromInfoList(list,"yyyy-MM-dd"));
	}
	
}
