
package model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.vo.CalendarVO;

@Repository
public class CalendarDAO {
	@Autowired
	SqlSession session = null;
	
	public List<CalendarVO> listAll(String nickname){
		List<CalendarVO> li = null;
		String statement="resource.CalendarMapper.selectEvent";
		li = session.selectList(statement,nickname);
		return li;
	}
	
	public boolean insert(CalendarVO vo) {
		String statement = "resource.CalendarMapper.insertEvent";
		String id = vo.getId();
		String startDate =vo.getStartDate();
		String endDate = vo.getEndDate();
		String title = vo.getTitle();
		
		vo.setId(id);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setTitle(title);
		
		if(startDate == null)
			return false;
		if(endDate == null)
			return false;
		if(title.equals(""))
			return false;
		
		if(session.insert(statement,vo) !=1)
			return false;
		return true;
	}
	
	public boolean delete(String id) {
		boolean result = true;
		String statement = "resource.CalendarMapper.deleteEvent";
		
		if(session.delete(statement,id)!=1)
			result = false;
		return result;
	}
	
	
}
