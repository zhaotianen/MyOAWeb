/**
 * 
 */
package cn.zhaotianen.oa.service;

import java.util.List;

import cn.zhaotianen.oa.base.DaoSupport;
import cn.zhaotianen.oa.domain.Flow;
import cn.zhaotianen.oa.domain.Note;
import cn.zhaotianen.oa.domain.User;

/**
 * @author CYQH_ZTE
 * 
 */
public interface FlowService extends DaoSupport<Flow> {
	/**
	 * 
	 * @param id
	 * @return
	 */
	List<Flow> findById(Long id);

	/**
	 * 待我审批方法
	 * 
	 * @param id
	 * @return
	 */
	List<Flow> getByDepartmentId(Long id);
}
