package com.bizconf.inner.portal.bean;

import java.util.Date;

import com.google.gson.annotations.Expose;

/**
 * @desc 
 * @author Administrator
 * @date 2013-12-17
 */
public class BizInfo {
	
	@Expose(serialize = true,deserialize=true)
	private long id = 0l;
	
	@Expose(serialize = true,deserialize=true)
	private String title = "";
	
	private String content = "";
	
	@Expose(serialize = true,deserialize=true)
	private int moduleId = 0;
	
	@Expose(serialize = true,deserialize=true)
	private String avatarUrl = ""; //头像的路径
	
	@Expose(serialize = true,deserialize=true)
	private Date createTime = new Date();
	
	@Expose(serialize = true,deserialize=true)
	private Date updateTime = new Date();
	
	@Expose(serialize = true,deserialize=true)
	private String fakeAvatar = "";
	
	
	@Expose(serialize = true,deserialize=true)
	private String photodesc;
	
	@Expose(serialize = true,deserialize=true)
	private int clickNum;//点击量
	
	@Expose(serialize = true,deserialize=true)
	private int showIndex=0;//是否首页显示 0不显示 1显示  

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPhotodesc() {
		return photodesc;
	}

	public void setPhotodesc(String photodesc) {
		this.photodesc = photodesc;
	}

	public int getClickNum() {
		return clickNum;
	}

	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}

	public int getShowIndex() {
		return showIndex;
	}

	public void setShowIndex(int showIndex) {
		this.showIndex = showIndex;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getFakeAvatar() {
		return fakeAvatar;
	}

	public void setFakeAvatar(String fakeAvatar) {
		this.fakeAvatar = fakeAvatar;
	}
	
	
}
