package cn.zhaotianen.oa.service.impl;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zhaotianen.oa.base.DaoSupportImpl;
import cn.zhaotianen.oa.domain.User;
import cn.zhaotianen.oa.service.UserService;

@Service
@Transactional
public class UserServiceImpl extends DaoSupportImpl<User> implements
		UserService {

	public User findByLoginNameAndPassword(String loginName, String password) {
		// 使用密码的MD5摘要进行对比
		String md5Digest = DigestUtils.md5Hex(password);
		return (User) getSession().createQuery(//
				"FROM User u WHERE u.loginName=? AND u.password=?")//
				.setParameter(0, loginName)//
				.setParameter(1, md5Digest)//
				.uniqueResult();
	}

	public List<User> contactList() {

		return getSession().createQuery("from User u order by u.department.id")
				.list();
	}

	public boolean checkLoginName(String loginName) {
		List<User> list = getSession()
				.createQuery("from User u where u.loginName=?")
				.setParameter(0, loginName).list();
		if (list.size() != 0) {
			return true;// 代表存在数据
		} else {
			return false;// 代表不存在数据
		}

	}

}
