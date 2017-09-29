package first.shopping.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import first.shopping.admin.bean.MemberBean;
import first.shopping.admin.service.AdminService;

@Controller
public class AdminController {
	 Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "/admin/admin";
	}
	
	@RequestMapping(value="/manageMember.do")
    public ModelAndView selectMemberList() throws Exception{
       
		ModelAndView mv = new ModelAndView("/admin/manageMember");
        List<Map<String,Object>> list = adminService.selectMemberList();
        //System.out.println(list);
        mv.addObject("list", list);
         
        return mv;
    }
	
	@RequestMapping(value="/updateRating.do")
	public String updateRating(@RequestParam(value="no")int no,@RequestParam(value="flag")String flag,
			HttpServletRequest request) throws Exception {
		
		String ip = request.getRemoteAddr();
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("no" , no);
		hashMap.put("flag" , flag);
		hashMap.put("ip", ip);
		adminService.updateRating(hashMap);
		
		return "redirect:/manageMember.do";
	}
	
	@RequestMapping(value="/memberInfo.do")
	public ModelAndView selectMemberInfo(@RequestParam(value="no")int no) throws Exception{
		
		ModelAndView mv = new ModelAndView("/admin/memberInfo");
		HashMap<String,Object> map =adminService.selectMemberInfo(no);
		mv.addObject("map",map);
		System.out.println(map);
		return mv;
	}
	
	@RequestMapping(value="/updateMember.do")
	public String updateMember(@ModelAttribute MemberBean bean,HttpServletRequest request) throws Exception {
		
		String ip = request.getRemoteAddr();
		bean.setMod_ip(ip);
		adminService.updateMember(bean);
		return "/admin/memberInfo";
	}
	
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(@RequestParam(value="no")int no) throws Exception{
		
		return "redirct:/manageMember.do";
	}
	
	
}