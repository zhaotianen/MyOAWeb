/**
 * 
 */
package cn.zhaotianen.oa.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zhaotianen.oa.base.DaoSupportImpl;
import cn.zhaotianen.oa.domain.Note;
import cn.zhaotianen.oa.domain.PageBean;
import cn.zhaotianen.oa.service.NoteService;
import cn.zhaotianen.oa.util.QueryHelper;

/**
 * @author CYQH_ZTE
 * 
 */
@Service
@Transactional
public class NoteServiceImpl extends DaoSupportImpl<Note> implements
		NoteService {

	@SuppressWarnings("unchecked")
	public List<Note> findById(Long id) {

		return getSession().createQuery("from Note n where n.user.id=?")
				.setParameter(0, id).list();
	}

}
