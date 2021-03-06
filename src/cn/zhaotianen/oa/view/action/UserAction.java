package cn.zhaotianen.oa.view.action;

import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zhaotianen.oa.base.BaseAction;
import cn.zhaotianen.oa.domain.Department;
import cn.zhaotianen.oa.domain.Role;
import cn.zhaotianen.oa.domain.User;
import cn.zhaotianen.oa.util.DepartmentUtils;
import cn.zhaotianen.oa.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {

	private Long departmentId;
	private Long[] roleIds;

	/** 列表 */
	public String list() throws Exception {
		// List<User> userList = userService.findAll();
		// ActionContext.getContext().put("userList", userList);

		// 准备分页信息
		new QueryHelper(User.class, "u").preparePageBean(userService, pageNum,
				pageSize);

		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		userService.delete(model.getId());
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils
				.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);

		// 准备数据, roleList
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);

		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {

		// 封装到对象中（当model是实体类型时，也可以使用model，但要设置未封装的属性）
		// >> 设置所属部门
		model.setDepartment(departmentService.getById(departmentId));
		// >> 设置关联的岗位
		List<Role> roleList = roleService.getByIds(roleIds);
		model.setRoles(new HashSet<Role>(roleList));
		// >> 设置默认密码为1234（要使用MD5摘要）
		String md5Digest = DigestUtils.md5Hex("1234");
		model.setPassword(md5Digest);

		// 保存到数据库
		userService.save(model);

		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		// 准备数据, departmentList
		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = DepartmentUtils
				.getAllDepartments(topList);
		ActionContext.getContext().put("departmentList", departmentList);

		// 准备数据, roleList
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);

		// 准备回显的数据
		User user = userService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(user);
		if (user.getDepartment() != null) {
			departmentId = user.getDepartment().getId();
		}
		if (user.getRoles() != null) {
			roleIds = new Long[user.getRoles().size()];
			int index = 0;
			for (Role role : user.getRoles()) {
				roleIds[index++] = role.getId();
			}
		}

		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		// 1，从数据库中取出原对象
		User user = userService.getById(model.getId());

		// 2，设置要修改的属性
		user.setLoginName(model.getLoginName());
		user.setName(model.getName());
		user.setGender(model.getGender());
		user.setPhoneNumber(model.getPhoneNumber());
		user.setEmail(model.getEmail());
		user.setDescription(model.getDescription());
		// >> 设置所属部门
		user.setDepartment(departmentService.getById(departmentId));
		// >> 设置关联的岗位
		List<Role> roleList = roleService.getByIds(roleIds);
		user.setRoles(new HashSet<Role>(roleList));

		// 3，更新到数据库
		userService.update(user);

		return "toList";
	}

	/** 初始化密码为1234 */
	public String initPassword() throws Exception {
		// 1，从数据库中取出原对象
		User user = userService.getById(model.getId());

		// 2，设置要修改的属性（要使用MD5摘要）
		String md5Digest = DigestUtils.md5Hex("1234");
		user.setPassword(md5Digest);

		// 3，更新到数据库
		userService.update(user);

		return "toList";
	}

	/** 登录页面 */
	public String loginUI() throws Exception {
		return "loginUI";
	}

	/** 登录 */
	public String login() throws Exception {

		if (model.getLoginName().equals("")) {// 判断用户名为空
			addFieldError("loginName", "用户名不能为空！");
			return "loginUI";
		} else if (model.getPassword().equals("")) {// 判断密码为空
			addFieldError("password", "密码不能为空！");
			return "loginUI";
		} else {// 判断帐号存在
			User user = userService.findByLoginNameAndPassword(
					model.getLoginName(), model.getPassword());
			if (user == null) {
				addFieldError("login", "未成功登录！");
				return "loginUI";
			} else {
				// 登录用户
				ActionContext.getContext().getSession().put("user", user);
				return "toIndex";
			}
		}

	}

	/** 注销 */
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("user");
		return "logout";
	}

	/**
	 * 验证登录名是否存在
	 * 
	 * @return
	 * @throws Exception
	 */
	public String check() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		// 获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图
		HttpServletResponse response = ServletActionContext.getResponse();
		// 设置字符集
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String loginName = request.getParameter("loginName");
		if (userService.checkLoginName(loginName)==true) {
			out.println("该用户已存在，请重新输入！");
		} else {
			out.println("该用户名可以使用~");
		}
		out.flush();
		out.close();
		return null;
	}

	// ---

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Long[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}

}
