package cn.zhaotianen.oa.service;

import java.util.List;

import cn.zhaotianen.oa.base.DaoSupport;
import cn.zhaotianen.oa.domain.PageBean;
import cn.zhaotianen.oa.domain.Reply;
import cn.zhaotianen.oa.domain.Topic;

public interface ReplyService extends DaoSupport<Reply> {

	/**
	 * 查询指定主题中所有的回复列表，排序：按发表时间升序排列。
	 * 
	 * @param topic
	 * @return
	 */
	@Deprecated
	List<Reply> findByTopic(Topic topic);

	/**
	 * 查询分页信息
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param topic
	 * @return
	 */
	@Deprecated
	PageBean getPageBeanByTopic(int pageNum, int pageSize, Topic topic);

}