/**
 * 
 */
package cn.zhaotianen.oa.view.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.zhaotianen.oa.base.BaseAction;
import cn.zhaotianen.oa.domain.User;

/**
 * @author CYQH_ZTE
 * 
 */
@Controller
@Scope("prototype")
public class ContactAction extends BaseAction<User> {

	/**
	 * 查询所有
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		List<User> list = userService.contactList();
		ActionContext.getContext().put("ContactList", list);
		return "list";
	}
}
