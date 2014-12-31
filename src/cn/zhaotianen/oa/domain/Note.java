/**
 * 
 */
package cn.zhaotianen.oa.domain;

import java.util.Set;

/**
 * 便签
 * 
 * @author CYQH_ZTE
 * 
 */
public class Note {

	private Long id;// 编号
	private String name;// 名字
	private String time;// 创建时间
	private String content;// 内容
	private String description;// 备注
	private User user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
