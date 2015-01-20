package cn.zhaotianen.oa.service;

import java.util.List;

import cn.zhaotianen.oa.base.DaoSupport;
import cn.zhaotianen.oa.domain.User;

public interface UserService extends DaoSupport<User> {

	/**
	 * 根据登录名与密码查询用户
	 * 
	 * @param loginName
	 * @param password
	 *            明文密码
	 * @return
	 */
	User findByLoginNameAndPassword(String loginName, String password);

	/**
	 * 查询用户表部门列名，根据部门号分组
	 * 
	 * @return
	 */
	List<User> contactList();

	/**
	 * 验证登录名是否存在
	 * 
	 * @param loginName
	 * @return
	 */
	boolean checkLoginName(String loginName);
}
