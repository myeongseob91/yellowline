package first.shopping.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView openSampleBoardList(Map<String,Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("/admin/manageMember");
         
        List<Map<String,Object>> list = adminService.selectMemberList(map);
        System.out.println(list);
        mv.addObject("list", list);
         
        return mv;
    }
}
