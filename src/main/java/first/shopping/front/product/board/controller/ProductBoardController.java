package first.shopping.front.product.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import first.common.util.PropertiesControll;
import first.common.util.StringUtil;

@Controller
public class ProductBoardController {
	
	@RequestMapping(value="/front/product/board/boardList.do", method=RequestMethod.GET)
	public String boardList(@RequestParam(value="bc_code",required=true)String bc_code,@RequestParam(value="mc_code",required=false)String mc_code) {
		String code = "".equals(StringUtil.nullCheck(mc_code))?bc_code:bc_code+"."+mc_code;
		String view = PropertiesControll.getProperty("product", code);
		return view;
	}
}