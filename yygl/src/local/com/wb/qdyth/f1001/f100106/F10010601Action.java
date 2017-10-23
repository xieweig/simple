package com.wb.qdyth.f1001.f100106;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wb.jdbcutils.Page;
import com.wb.login.SessionUtils;
import com.wb.qdyth.f1001.common.service.EmpService;
import com.wb.qdyth.f1001.common.vo.WorkInjuryVO;
import com.wb.utils.web.JsonUtils;
import com.wb.utils.web.RequestUtils;

/**
 * 工伤定期待遇补退明细
 */
@Controller
@RequestMapping(value="/work/f10010601/")
public class F10010601Action {
	@Autowired
	private EmpService empService;
	
	@RequestMapping("index.action")
	public String index(){
		return "/f10/f1001/f100106/f10010601/index";
	}
	@RequestMapping("loadWorkInjuryTreatment1.action")
	@ResponseBody
	public String loadWorkInjuryTreatment1(HttpServletRequest request){
		HttpSession session=request.getSession();
		String aac001=(String)session.getAttribute(SessionUtils.USERKEY);
		
		int pageSize=RequestUtils.getParameter(request, "pageSize", 0);
		int pageIndex=RequestUtils.getParameter(request, "pageIndex", 0);
		
		Page page=new Page();
		page.setPageno(pageIndex+1);
		page.setPagesize(pageSize);
		empService.queryWorkInjuryTreatment1(page, aac001);
		return JsonUtils.getJsonByPage(page);
	}
	@RequestMapping("getInfo")
	@ResponseBody
	public String getInfo(String aaz166){
		//HttpSession session=request.getSession();
		//String s=Request.Form["aaz166"].ToString();
		Long aaz166New = Long.parseLong(aaz166);
		WorkInjuryVO vo=empService.getWorkInjuryInfo(aaz166New);
		return JsonUtils.getJsonData(vo);
	}
	@RequestMapping("loadSumWorkInjuryTreatment1")
	@ResponseBody
	public String loadSunWorkInjuryTreatment1(HttpServletRequest request){
		HttpSession session=request.getSession();
		String aac001=(String)session.getAttribute(SessionUtils.USERKEY);
		WorkInjuryVO vo=empService.querySumWorkInjury1(aac001);
		return JsonUtils.getJsonData(vo);
	}
}