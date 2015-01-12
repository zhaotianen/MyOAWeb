/**
 * 
 */
package cn.zhaotianen.oa.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zhaotianen.oa.base.DaoSupportImpl;
import cn.zhaotianen.oa.domain.Flow;
import cn.zhaotianen.oa.domain.PageBean;
import cn.zhaotianen.oa.domain.User;
import cn.zhaotianen.oa.service.FlowService;
import cn.zhaotianen.oa.util.QueryHelper;

/**
 * @author CYQH_ZTE
 * 
 */
@Service
@Transactional
public class FlowServiceImpl extends DaoSupportImpl<Flow> implements
		FlowService {

	public List<Flow> findById(Long id) {
		return getSession().createQuery("from Flow f where f.createUser.id=?")
				.setParameter(0, id).list();
	}

	public List<Flow> getByDepartmentId(Long id) {
		
		return getSession().createQuery("from Flow f where f.createUser.department.id=? and f.stauts='提交申请'").setParameter(0, id).list();
	}

}
