package com.bizconf.inner.portal.util;

import java.io.File;

import com.libernate.liberc.LiberCFile;
import com.libernate.liberc.utils.LiberContainer;

public class UploadUtil {
	
	static final String CONTEXT_BASE = LiberContainer.getContainer().
	getServletContext().getRealPath("/");
	  
	
//	static final String PHOTO_PATH = CONTEXT_BASE+File.separator+"uploadphotos";
	static final String PHOTO_PATH = CONTEXT_BASE+"uploadphotos";
	
	static {
		createDirs(PHOTO_PATH);
	}
	
	public static String getStoragePath() {
		return PHOTO_PATH;
	}
	
	public static String getPreViewStoragePath() {
		String path = CONTEXT_BASE+"previwephotos";
		File file = new File(path);
		if(!file.exists() || !file.isDirectory()){
			file.mkdir();
		}
		return path;
	}
	
	public static String getUEStoragePath() {
		String path = CONTEXT_BASE+"ueditor"+File.separator+"upload";
		File file = new File(path);
		if(!file.exists() || !file.isDirectory()){
			file.mkdir();
		}
		return path;
	}
	
	public static String renamePhoto(LiberCFile file, String rmIp) {
		String exts [] = file.getOriginalFilename().split("\\.");
		String ext = "";
		if (exts.length > 1) {
			ext = exts[exts.length - 1];
		}
		//String[] rmips = rmIp.split(".");
		return "bizconf" + "_" + System.currentTimeMillis() + "." + ext;
	}
	
	//获取文件后缀名
	public static String getExt(String fileName) {
		String exts [] = fileName.split("\\.");
		String ext = "";
		if (exts.length > 1) {
			ext = exts[exts.length - 1];
		}
		return  ext;
	}
	
	public static void createDirs(String dir) {
		try {
			File file = new File(dir);
			if (!file.exists()) {
				file.mkdirs();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	//清除文件
	public  static void cleanFile(String url){
		url = url.substring(url.lastIndexOf("/")+1);
		String path = PHOTO_PATH+File.separator+url;
		String pathpre = getPreViewStoragePath()+File.separator+url;
		System.out.println("path === "+ path);
		System.out.println("pathpre === "+ pathpre);
		File file = new File(path);
		if(file.exists()){
			file.delete();
		}
		
		File filepre = new File(pathpre);
		if(filepre.exists()){
			filepre.delete();
		}
		
	}
}
