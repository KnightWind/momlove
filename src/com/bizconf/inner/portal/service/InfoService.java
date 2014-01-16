package com.bizconf.inner.portal.service;

import java.util.List;

import com.bizconf.inner.portal.bean.BizInfo;
import com.bizconf.inner.portal.bean.PageBean;

/**
 * @desc 
 * @author martin
 * @date 2013-12-17
 */
public interface InfoService {
	
	BizInfo getInfoById(long id) throws Exception;
	
	
	PageBean<BizInfo> getInfosByMoudel(int moudelId,int pagesize,int pageNo) throws Exception;
	
	
	//PageBean<BizInfo> getIndexPlcard(int pagesize,int pageNo) throws Exception;
	
	
	BizInfo saveBizInfo(BizInfo info) throws Exception;
	
	
	boolean delBizInfo(long id) throws Exception;
	
	
	PageBean<BizInfo> getInfosByKeyword(String keyword,int pagesize,int pageNo) throws Exception;
	
	/**
	 * 根据发布时间获取前几条信息
	 * @param moudelId
	 * @param num
	 * @return
	 * @throws Exception
	 */
	List<BizInfo> getLimitInfosByMoudelAndTime(int moudelId,int num)throws Exception;

	/**
	 * 查询所有的部门文件夹
	 * @param pagesize
	 * @param pageNo
	 * @return
	 * @throws Exception
	 */
	PageBean<BizInfo> getDeptsInfos(int pagesize,int pageNo) throws Exception;
	
	
	/**
	 * 查询所有的下载中心内容
	 * @param pagesize
	 * @param pageNo
	 * @return
	 * @throws Exception
	 */
	PageBean<BizInfo> getDownloadInfos(int pagesize,int pageNo) throws Exception;
	
	
	/**
	 * 更新点击量
	 * @param id
	 * @throws Exception
	 */
	public void updateClickNum(long id)throws Exception;
	
	
	
	/**
	 * 查询首页需要做静态化的数据
	 * @param moudelId
	 * @return
	 */
	List<BizInfo> getIndexStaticInfos(int moudelId)throws Exception;
	
	
	/**
	 * 获取公告栏信息  需要显示部门文件夹和 公告
	 * @return
	 * @throws Exception
	 */
	List<BizInfo> getPlacardStaticInfos()throws Exception;
	
	
	/**
	 * 获取公告栏信息  需要显示部门文件夹和 公告
	 * @return
	 * @throws Exception
	 */
	PageBean<BizInfo> getPlacardStaticInfos(int pagesize, int pageNo) throws Exception;
	
	/**
	 * 
	 * @param info
	 * @return
	 * @throws Exception
	 */
	void updateInfo(BizInfo info)throws Exception;
	
	
	PageBean<BizInfo> getAllProductsPage(int pagesize,
			int pageNo)throws Exception;
	
	
	public List<BizInfo> getIndexProductInfos()throws Exception;
	
}
