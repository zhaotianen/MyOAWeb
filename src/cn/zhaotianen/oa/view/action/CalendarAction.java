/**
 * 
 */
package cn.zhaotianen.oa.view.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author CYQH_ZTE
 * 
 */
@Controller
@Scope("prototype")
public class CalendarAction extends ActionSupport {

	public String list() throws Exception {

		return "list";
	}

}
