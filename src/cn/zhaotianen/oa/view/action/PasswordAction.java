/**
 * 
 */
package cn.zhaotianen.oa.view.action;

import org.apache.commons.codec.digest.DigestUtils;
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
public class PasswordAction extends BaseAction<User> {
	private String newPassword;

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	/**
	 * 修改密码界面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editUI() throws Exception {
		return "saveUI";
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editPassword() throws Exception {
		User u = getCurrentUser();
		User user = userService.getById(u.getId());
		if (user.getPassword().equals(DigestUtils.md5Hex(model.getPassword()))) {
			user.setPassword(DigestUtils.md5Hex(newPassword));
			userService.update(user);
			ActionContext
					.getContext()
					.put("editPasswordMsg",
							"<br/>密码修改成功!新密码：【"
									+ newPassword
									+ "】,请妥善保管!<br/><a class='btn btn-primary' href='user_logout.action'>重新登录</a>");
			return "toList";
		} else {
			addFieldError("msg", "修改失败，原密码错误！");
			return INPUT;
		}

	}
}
