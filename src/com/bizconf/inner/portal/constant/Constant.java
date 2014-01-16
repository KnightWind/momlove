package com.bizconf.inner.portal.constant;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @desc 
 * @author Administrator
 * @date 2013-12-17
 */
public class Constant {
	
	
	public static final int DEF_SHOW_NUM = 20; 
	public static final String  USER = "user"; 
	
	public static Map<Integer, Boolean> photoModule = new HashMap<Integer, Boolean>();
	public static Map<Integer, String> jsonModule = new HashMap<Integer, String>();
	public static Map<String, Integer> moduleMap = new HashMap<String, Integer>(32);
	public static List<Moudul> modules = new ArrayList<Moudul>();
	
	
	
	
	static {
			
		Moudul[] module_arr = {
				new Moudul(1,"信息模块",0,false),
				new Moudul(2,"会畅公告牌",1,false),
				new Moudul(3,"部门文件夹",1,false),
				new Moudul(31,"Operations",3,false),
				new Moudul(32,"Marketing",3,false),
				new Moudul(33,"Sales",3,false),
				new Moudul(34,"Finance",3,false),
				new Moudul(35,"Admin",3,false),
				new Moudul(4,"下载中心",1,false),
				new Moudul(5,"常用流程",1,false),
				new Moudul(6,"常用软件",1,false),
				new Moudul(7,"常用申请表",1,false),
				new Moudul(8,"照片墙",1,false),
				new Moudul(81,"Top Sales  BJ",8,true),
				new Moudul(82,"Top Sales  SH",8,true),
				new Moudul(83,"优秀员工",8,true),
				new Moudul(84,"新人Show",8,true),
				new Moudul(85,"团队活动照",8,true),
		};
		Collections.addAll(modules, module_arr);
		for (Moudul m:module_arr) {
			 photoModule.put(m.getId(), m.isPhotoModule());
			 moduleMap.put(m.getName(), m.getId());
		}
		
		//需要静态化的模块
		//jsonModule.put(81, "bjsales");
		//jsonModule.put(82, "shsales");
		//jsonModule.put(83, "excellenters");
		//jsonModule.put(84, "newers");
		//jsonModule.put(85, "groupactives");
		
		//jsonModule.put(2, "bizplacard");//会畅公告
		jsonModule.put(5, "commonflow");//常用流程
		jsonModule.put(6, "softwares");//常用软件
		jsonModule.put(7, "application");//常用申请单
		
		//部门文件夹也可显示到公共板
		//jsonModule.put(31, "operations");//部门文件夹 Operations
		//jsonModule.put(32, "marketing");//部门文件 Marketing
		//jsonModule.put(33, "sales");//部门文件夹 Sales
		//jsonModule.put(34, "finance");//会畅公告Finance 
		//jsonModule.put(35, "admin");//会畅公告 Admin
		

	}
	
	public static class Moudul{
		
		private int id = 0;
		
		private String name = "";
		
		private int pId = 0;
		
		private boolean isPhotoModule = false;
		
		public Moudul(int id,String name,int pId,boolean isPhotoModule){
			this.id = id;
			this.name = name;
			this.pId = pId;
			this.isPhotoModule = isPhotoModule;
		}
		
		 
		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}
		
		public String getName() {
			return name;
		}


		public void setName(String name) {
			this.name = name;
		}


		public int getpId() {
			return pId;
		}


		public void setpId(int pId) {
			this.pId = pId;
		}


		public boolean isPhotoModule() {
			return isPhotoModule;
		}
		public void setPhotoModule(boolean isPhotoModule) {
			this.isPhotoModule = isPhotoModule;
		}
		
		
	} 
}
