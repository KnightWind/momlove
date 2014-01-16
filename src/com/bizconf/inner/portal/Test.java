package com.bizconf.inner.portal;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.bizconf.inner.portal.bean.BizInfo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

/**
 * @desc 
 * @author Administrator
 * @date 2013-12-18
 */
public class Test {
	
	
	
	
	
	public static void main(String ...strings){
		
		BizInfo b = new BizInfo();
		b.setId(1l);
		b.setAvatarUrl("/sds");
		b.setContent("dsfgfdsghdh");
		b.setCreateTime(new Date());
		Gson g = new GsonBuilder().registerTypeAdapter(Date.class, new DateAdapter("yyyy-MM-dd")).excludeFieldsWithoutExposeAnnotation().create();
		String json = g.toJson(b);
		System.out.println(json);
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
	
}
