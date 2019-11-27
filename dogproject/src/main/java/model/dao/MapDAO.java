package model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.vo.MapVO;

@Repository
public class MapDAO {	
	@Autowired
	SqlSession session = null;	
	public List<MapVO> listAll(){
		List<MapVO> list = null;
		String statement="resource.MapMapper.selectMap";
		list = session.selectList(statement);
		return list;
	}
}
