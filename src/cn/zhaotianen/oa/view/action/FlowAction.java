/**
 * 
 */
package cn.zhaotianen.oa.view.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sound.midi.SysexMessage;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.zhaotianen.oa.base.BaseAction;
import cn.zhaotianen.oa.domain.Flow;
import cn.zhaotianen.oa.domain.User;

/**
 * @author CYQH_ZTE
 * 
 */
@Controller
@Scope("prototype")
public class FlowAction extends BaseAction<Flow> {
	// 获取当前的用户
	User u = getCurrentUser();

	/** 列表 */
	public String list() throws Exception {
		List<Flow> list = flowService.findById(u.getId());
		ActionContext.getContext().put("flowList", list);
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		flowService.delete(model.getId());
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {

		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {
		model.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		model.setCreateUser(u);
		model.setStauts("提交申请");
		flowService.save(model);
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		Flow flow = flowService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(flow);
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		Flow flow = flowService.getById(model.getId());
		flow.setType(model.getType());
		flow.setStartTime(model.getStartTime());
		flow.setStopTime(model.getStopTime());
		flow.setReason(model.getReason());
		flowService.update(flow);
		return "toList";
	}

	/**
	 * 待我审批的任务列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String myTaskList() throws Exception {
		Long id = u.getDepartment().getId();
		List<Flow> list = flowService.getByDepartmentId(id);
		ActionContext.getContext().put("myTaskList", list);
		return "myTaskList";
	}

	/**
	 * 审批界面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String spUI() throws Exception {
		Flow flow = flowService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(flow);
		return "readUI";
	}

	/**
	 * 审批
	 * 
	 * @return
	 * @throws Exception
	 */
	public String sp() throws Exception {
		Flow flow = flowService.getById(model.getId());
		flow.setStauts(model.getLeaderOpinion());
		flow.setLeaderOpinion(model.getLeaderOpinion());
		flow.setLeaderUser(u);
		flow.setLeaderTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		flowService.update(flow);
		return "toMyTaskList";
	}
}
