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
	public List<Map<String, Object>> selectMemberList(String name,String id) throws Exception{
		HashMap<String, Object> hashMap = new HashMap<>(); //아래 selectList 메소드에서 인자를 두개이상 받는 메소드가 없기 때문에 맵에 넣어줌
		hashMap.put("name", name);
		hashMap.put("id", id);
		
		//manageMember.jsp에 form이 있을경우(현재는 삭제함), 회원 검색 후 수정버튼 클릭시 현재 페이지가 새로고침되기 때문에 파라미터가 null 이라서 부적합한 열유형 #1 에러 발생
		if(name==null || id==null) { // 파라미터가 null 일 경우, 전체 회원검색
			return (List<Map<String, Object>>)selectList("admin.selectMemberList");
		}else {
			return (List<Map<String, Object>>)selectList("admin.searchMemberList", hashMap);			
		}
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
		update("admin.updateIsDel", map);
	}
}
