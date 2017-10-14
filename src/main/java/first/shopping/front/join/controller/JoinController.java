package first.shopping.front.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JoinController {
	
	@RequestMapping(value="/join.do")
	public String moveJoinPage() {
		System.out.println("dd");
		return "/join/join";
	}
	
	@RequestMapping(value="/members.do")
	public String naverCallBack(@RequestParam(value="code")String code) {
		System.out.println(code);
		return "/join/join";
	}
}
