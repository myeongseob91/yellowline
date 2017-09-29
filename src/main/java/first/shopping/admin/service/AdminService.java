package first.shopping.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import first.shopping.admin.bean.MemberBean;


public interface AdminService {
	
	List<Map<String, Object>> selectMemberList() throws Exception;
	
	public void updateRating(HashMap<String, Object> map) throws Exception;
	
	HashMap<String, Object> selectMemberInfo(int no) throws Exception;
	
	public void updateMember(MemberBean bean) throws Exception;
}




