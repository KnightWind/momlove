<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.bizconf.inner.portal.util.Uploader" %>



<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    Uploader up = new Uploader(request);
    up.setSavePath("upload"); //保存路径
    String[] fileType = {".rar" , ".doc" , ".docx" , ".zip" , ".pdf" , ".txt" , ".swf", ".wmv", ".xls", ".xlsx", ".exe"};  //允许的文件类型
    up.setAllowFiles(fileType);
    up.setMaxSize(10000000);        //允许的文件最大尺寸，单位KB
    up.upload();
  
    response.getWriter().print("{'url':'"+up.getUrl()+"','fileType':'"+up.getType().toLowerCase()+"','state':'"+up.getState()+"','original':'"+up.getOriginalName().toLowerCase()+"'}");

%>
