/**
 * 
 */
package cn.zhaotianen.oa.view.action;

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
public class DataAction extends BaseAction<User> {

	/**
	 * 获取对象，传入页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editUI() throws Exception {

		// 准备回显的数据
		User u = getCurrentUser();
		User user = userService.getById(u.getId());
		ActionContext.getContext().getValueStack().push(user);
		return "saveUI";

	}

	/** 修改 */
	public String edit() throws Exception {
		User u = getCurrentUser();
		// 1，从数据库中取出原对象
		User user = userService.getById(u.getId());

		// 2，设置要修改的属性
		user.setLoginName(model.getLoginName());
		user.setName(model.getName());
		user.setGender(model.getGender());
		user.setPhoneNumber(model.getPhoneNumber());
		user.setEmail(model.getEmail());
		user.setDescription(model.getDescription());

		// 3，更新到数据库
		userService.update(user);

		addFieldError("editMsg", "修改成功！");
		return "toList";
	}

}