package com.yzframework.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yzframework.base.Page;
import com.yzframework.dao.IDAO;
import com.yzframework.model.Monline;
import com.yzframework.service.MonlineService;
@Service
public class MonlineServiceImpl implements MonlineService {
	
	@Resource
	private IDAO dao;
	public IDAO getDao() {
		return dao;
	}
	public void setDao(IDAO dao) {
		this.dao = dao;
	}
	
	/**
	 * 查询出所有的登录用户信息
	 * @param page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@Override
	public Page findByList(Page page, Monline model) throws Exception {
		
		String hql = "FROM Monline a where a.status='1'";
		
		return dao.findPageByHql(hql, page);
	}
	
	/**
	 * 保存登录用户的在线登录信息
	 * 
	 * @模块  用户登录
	 * 
	 * @param monline
	 * @return
	 * @throws Exception
	 *
	 */
	@Override
	public void save(Monline monline) throws Exception {
			dao.save(monline);
	}
	/**
	 * 获取当前登录用户存在的登录信息
	 * 
	 * @模块   用户登录
	 * 
	 * @param monline 查询条件 登录帐号
	 * @return
	 * @throws Exception
	 *
	 */
	@Override
	public List<Monline> find02(Monline monline) throws Exception {
		return dao.findByModel(monline);
	}
	/**
	 * 删除当前登录用户的登录信息
	 * 
	 * @模块     监听器执行
	 * 
	 * @param monline
	 * @return
	 * @throws Exception
	 *
	 */
	@Override
	public void delete(Monline monline) throws Exception {
		dao.delete(monline);
	}
	

}
