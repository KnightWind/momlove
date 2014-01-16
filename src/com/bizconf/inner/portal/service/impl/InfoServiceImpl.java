package com.bizconf.inner.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bizconf.inner.portal.bean.BizInfo;
import com.bizconf.inner.portal.bean.PageBean;
import com.bizconf.inner.portal.service.InfoService;
import com.bizconf.inner.portal.util.StringUtil;

/**
 * @desc 
 * @author martin
 * @date 2013-12-17
 */
@Service
public class InfoServiceImpl extends BaseService implements InfoService  {

	@Override
	public BizInfo getInfoById(long id) throws Exception {
	
		return libernate.getEntity(BizInfo.class, id);
	}

	@Override
	public PageBean<BizInfo> getInfosByMoudel(int moudelId, int pagesize,
			int pageNo)throws Exception {
		
		String sql = "select * from t_biz_info where module_id = "+moudelId+" order by create_time desc ";
		return getPageBeans(BizInfo.class, sql, pageNo,pagesize);
	}
	
	@Override
	public PageBean<BizInfo> getAllProductsPage(int pagesize,
			int pageNo)throws Exception {
		String sql = "select * from t_biz_info where module_id > 30 and module_id <40 order by create_time desc ";
		return getPageBeans(BizInfo.class, sql, pageNo,pagesize);
	}

	@Override
	public BizInfo saveBizInfo(BizInfo info) throws Exception {
		if(info.getId()>0)
			return libernate.updateEntity(info,"title","content","avatarUrl","photodesc","showIndex");
		else 
			return libernate.saveEntity(info);
	}

	@Override
	public boolean delBizInfo(long id) throws Exception {
		BizInfo info = new BizInfo();
		info.setId(id);
		return libernate.deleteEntity(info);
	}

	@Override
	public PageBean<BizInfo> getInfosByKeyword(String keyword, int pagesize,
			int pageNo) throws Exception {
		String sql = "select * from t_biz_info where content like ? or title like ? ";
		keyword = StringUtil.escapeStr(keyword);
		List<Object> parms = new ArrayList<Object>();
		parms.add("%"+keyword+"%");
		parms.add("%"+keyword+"%");
		return getPageBeans(BizInfo.class, sql,pageNo,pagesize,parms.toArray());
		
	}

	@Override
	public List<BizInfo> getLimitInfosByMoudelAndTime(int moudelId, int num)
			throws Exception {
		String sql = "SELECT * FROM t_biz_info  WHERE module_id =? ORDER BY create_time DESC LIMIT 0,?";
		List<Object> parms = new ArrayList<Object>();
		parms.add(moudelId);
		parms.add(num);
		return libernate.getEntityListBase(BizInfo.class, sql, parms.toArray());
	}

	
	@Override
	public PageBean<BizInfo> getDeptsInfos(int pagesize, int pageNo)
			throws Exception {
		String sql = "select * from t_biz_info where module_id > 30 and module_id <40  order by create_time desc ";
		return getPageBeans(BizInfo.class, sql,pageNo,pagesize);
	}
	
	@Override
	public PageBean<BizInfo> getDownloadInfos(int pagesize, int pageNo)
			throws Exception {
		String sql = "select * from t_biz_info where module_id > 4 and module_id <8 order by create_time desc ";
		return getPageBeans(BizInfo.class, sql,pageNo,pagesize);
	}

	@Override
	public void updateClickNum(long id) throws Exception {
		String sql = "update t_biz_info set click_num = click_num+1 where id = ?";
		libernate.executeSql(sql, new Object[]{id});
	}
	
	
	@Override
	public List<BizInfo> getIndexStaticInfos(int moudelId)throws Exception{
		String sql = "select * from t_biz_info where module_id = ? and show_index = 1 order by update_time desc";
		return libernate.getEntityListBase(BizInfo.class, sql, new Object[]{moudelId});
	}
	
	@Override
	public List<BizInfo> getIndexProductInfos()throws Exception{
		String sql = "select * from t_biz_info where  module_id > 30 and module_id <40 and show_index = ? order by update_time desc";
		return libernate.getEntityListBase(BizInfo.class, sql ,new Object[]{1});
	}

	@Override
	public List<BizInfo> getPlacardStaticInfos() throws Exception {
		String sql = "select * from t_biz_info where show_index = 1 and(module_id = ? " +
				"or module_id = ? or module_id = ? or module_id = ? or module_id = ? or module_id = ?) order by update_time desc limit 0 ,15";
		return libernate.getEntityListBase(BizInfo.class, sql, new Object[]{2,31,32,33,34,35});
	}
	/**
	 * 显示公告牌信息和部门文件夹首页显示信息
	 */
	@Override
	public PageBean<BizInfo> getPlacardStaticInfos(int pagesize, int pageNo) throws Exception {
		String sql = "select * from t_biz_info where module_id = 2  or " +
				"(module_id in(31,32,33,34,35) and show_index=1) order by update_time desc";
		return getPageBeans(BizInfo.class, sql,pageNo,pagesize);
	}

	@Override
	public void updateInfo(BizInfo info) throws Exception {
		// TODO Auto-generated method stub
		 libernate.updateEntity(info);
	}
	
	
	
}
