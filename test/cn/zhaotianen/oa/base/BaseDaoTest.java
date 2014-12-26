package cn.zhaotianen.oa.base;

import org.junit.Test;

import cn.zhaotianen.oa.dao.RoleDao;
import cn.zhaotianen.oa.dao.UserDao;
import cn.zhaotianen.oa.dao.impl.RoleDaoImpl;
import cn.zhaotianen.oa.dao.impl.UserDaoImpl;

public class BaseDaoTest {

	@Test
	public void testSave() {
		UserDao userDao = new UserDaoImpl();
		RoleDao roleDao = new RoleDaoImpl();
	}

}
