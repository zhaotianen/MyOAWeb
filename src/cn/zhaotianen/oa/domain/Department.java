package cn.zhaotianen.oa.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 部门
 * 
 * @author ZTE
 * 
 */
public class Department implements java.io.Serializable {
	private Long id;
	private Set<User> users = new HashSet<User>();
	private Department parent;//上级部门
	private Set<Department> children = new HashSet<Department>();

	private String name;//部门名称
	private String description;//备注

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Department getParent() {
		return parent;
	}

	public void setParent(Department parent) {
		this.parent = parent;
	}

	public Set<Department> getChildren() {
		return children;
	}

	public void setChildren(Set<Department> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
