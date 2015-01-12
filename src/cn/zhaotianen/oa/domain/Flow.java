/**
 * 
 */
package cn.zhaotianen.oa.domain;

/**
 * @author CYQH_ZTE
 * 
 */
public class Flow {
	private Long id;// 编号
	private String type;// 类型
	private String createTime;// 提出日期
	private User createUser;// 提出者
	private String startTime;// 假期开始时间
	private String stopTime;// 结束时间
	private String reason;// 理由
	private String stauts;// 状态
	private String leaderOpinion;// 领导意见
	private User leaderUser;// 领导
	private String leaderTime;// 领导审批日期

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStopTime() {
		return stopTime;
	}

	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStauts() {
		return stauts;
	}

	public void setStauts(String stauts) {
		this.stauts = stauts;
	}

	public String getLeaderOpinion() {
		return leaderOpinion;
	}

	public void setLeaderOpinion(String leaderOpinion) {
		this.leaderOpinion = leaderOpinion;
	}

	public User getLeaderUser() {
		return leaderUser;
	}

	public void setLeaderUser(User leaderUser) {
		this.leaderUser = leaderUser;
	}

	public String getLeaderTime() {
		return leaderTime;
	}

	public void setLeaderTime(String leaderTime) {
		this.leaderTime = leaderTime;
	}

}
