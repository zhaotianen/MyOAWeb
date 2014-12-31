/**
 * 
 */
package cn.zhaotianen.oa.view.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.zhaotianen.oa.base.BaseAction;
import cn.zhaotianen.oa.domain.Note;
import cn.zhaotianen.oa.domain.User;

/**
 * @author CYQH_ZTE
 * 
 */
@Controller
@Scope("prototype")
public class NoteAction extends BaseAction<Note> {
	// 获取当前的用户
	User u = getCurrentUser();

	/** 列表 */
	public String list() throws Exception {

		List<Note> list = noteService.findById(u.getId());
		ActionContext.getContext().put("noteList", list);
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		noteService.delete(model.getId());
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {
		User user = userService.getById(u.getId());
		model.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		model.setUser(user);
		noteService.save(model);
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		Note note = noteService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(note);
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		Note note = noteService.getById(model.getId());
		note.setName(model.getName());
		note.setContent(model.getContent());
		note.setDescription(model.getDescription());
		note.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		noteService.update(note);
		return "toList";
	}

}
