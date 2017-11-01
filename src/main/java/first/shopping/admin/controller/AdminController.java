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
	
	@RequestMapping(value="/manageMember.do") //index.jsp에서 admin 클릭 (전체 회원정보), 회원검색(이름,아이디로)
    public ModelAndView selectMemberList(@RequestParam(value="name",required=false)String name,
			@RequestParam(value="id",required=false)String id,@RequestParam(value="page",required=false)String page) throws Exception{
		
		System.out.println("들어왓을때==========" + page);
		int pageScale=5;
		int totalRow=0;
		
		if(name!=null || id!=null) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("name", name);
			map.put("id", id);
			totalRow = adminService.getTotalRow(map);
		}else {
			totalRow = adminService.getTotalRow(null);
		}
	    
	    int totalPage=totalRow%pageScale==0?totalRow/pageScale:totalRow/pageScale+1;
	    totalPage=totalPage==0?1:totalPage; 
	    int currentPage=1;
	    String temp="1";
	    try{
	    	temp=page;
	    	currentPage=Integer.parseInt(temp);
	    }catch(Exception e){
	    	
	    }
	    int start=1+(currentPage-1)*pageScale;
	    int end=pageScale+(currentPage-1)*pageScale;
	    int currentBlock=currentPage%pageScale==0?currentPage/pageScale:currentPage/pageScale+1;
	    int startPage=1+(currentBlock-1)*pageScale;
	    int endPage=pageScale+(currentBlock-1)*pageScale;
	    endPage=totalPage<=endPage?totalPage:endPage;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		
		ModelAndView mv = new ModelAndView("/admin/manageMember");
		System.out.println(map);
        List<Map<String,Object>> list = adminService.selectMemberList(map);
        System.out.println(list);
        mv.addObject("list", list);
        
        mv.addObject("name", name);
        mv.addObject("id", id);
        mv.addObject("start", start); 
        mv.addObject("end", end); 
        mv.addObject("startPage", startPage); 
        mv.addObject("endPage", endPage); 
        mv.addObject("currentPage", currentPage);
        mv.addObject("currentBlock", currentBlock); 
        mv.addObject("totalPage", totalPage);
        mv.addObject("totalRow", totalRow);
         
        return mv;
    }
	
	@RequestMapping(value="/updateRating.do") //등급 업데이트(관리자<->회원), 수정일, 수정아이피 업데이트
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
	
	@RequestMapping(value="/memberInfo.do") //회원 상세정보
	public ModelAndView selectMemberInfo(@RequestParam(value="no")int no) throws Exception{
		
		ModelAndView mv = new ModelAndView("/admin/memberInfo");
		HashMap<String,Object> map =adminService.selectMemberInfo(no);
		mv.addObject("map",map);
		System.out.println(map);
		return mv;
	}
	
	@RequestMapping(value="/updateMember.do") //회원 상세정보 업데이트, 수정일, 수정아이피 업데이트
	public String updateMember(@ModelAttribute MemberBean bean,HttpServletRequest request) throws Exception {
		
		String ip = request.getRemoteAddr();
		bean.setMod_ip(ip);
		adminService.updateMember(bean);
		request.setAttribute("errMsg", "수정되었습니다.");
		return "/inc/script";
	}
	
	@RequestMapping(value="/deleteMember.do") //회원 삭제(is_del 업데이트), 삭제일, 삭제아이피 업데이트
	public String deleteMember(@RequestParam(value="no")int no, @RequestParam(value="flag")String flag, HttpServletRequest request) throws Exception{
		
		String ip = request.getRemoteAddr();
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("no" , no);
		hashMap.put("flag" , flag);
		hashMap.put("ip", ip);
		adminService.updateIsDel(hashMap);
		
		return "redirect:/manageMember.do";
	}
	
	
}