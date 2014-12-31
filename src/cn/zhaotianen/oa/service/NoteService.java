/**
 * 
 */
package cn.zhaotianen.oa.service;

import java.util.List;

import cn.zhaotianen.oa.base.DaoSupport;
import cn.zhaotianen.oa.domain.Note;

/**
 * @author CYQH_ZTE
 *
 */
public interface NoteService extends DaoSupport<Note> {
	List<Note> findById(Long id);

}
