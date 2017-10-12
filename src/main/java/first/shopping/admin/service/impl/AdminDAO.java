package first.shopping.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.shopping.admin.bean.MemberBean;
 
@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList() throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectMemberList");
	}
	
	public void updateRating(HashMap<String, Object> map) throws Exception{
		update("admin.updateRating", map);
	}
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectMemberInfo(int no) throws Exception{
		return (HashMap<String, Object>)selectOne("admin.selectMemberInfo", no);
	}
	
	public void updateMember(MemberBean bean) throws Exception{
		update("admin.updateMember", bean);
	}
	
	public void updateIsDel(HashMap<String, Object> map) throws Exception{
		System.out.println("다오@@@@@@@@@@@@@@@@@@");
		update("admin.updateIsDel", map);
	}
}
