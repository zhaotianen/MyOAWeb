package cn.zhaotianen.oa.service;

import cn.zhaotianen.oa.base.DaoSupport;
import cn.zhaotianen.oa.domain.Forum;

public interface ForumService extends DaoSupport<Forum>{

	/**
	 * 上移，最上面的不能上移
	 * @param id
	 */
	void moveUp(Long id);

	/**
	 * 下移，最下面的不能下移
	 * @param id
	 */
	void moveDown(Long id);

}
