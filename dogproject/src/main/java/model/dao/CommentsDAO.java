package model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.vo.CommentsVO;

@Repository
public class CommentsDAO {
	@Autowired
	SqlSession session = null;
	
	public List<CommentsVO> listAll(){
		List<CommentsVO> list = null;
		String statement = "resource.CommentsMapper.listAll";
		list = session.selectList(statement);
		return list;
	}
	
	public boolean insert(CommentsVO vo) {
		boolean result = true;
		String statement = "resource.CommentsMapper.insert";
		if(session.insert(statement, vo) != 1) result = false;
		System.out.println("DAO result : " + result);
		return result;
	}
	
	public List<CommentsVO> boardcom(int id){
		List<CommentsVO> list = null;
		String statement = "resource.CommentsMapper.boardcom";
		list = session.selectList(statement, id);
		return list;
	}
	
	public boolean delete(int cnum,int id) {
		boolean result = true;
		String statement="resource.CommentsMapper.delete";
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("cnum", cnum);
		map.put("id", id);
		System.out.println(map);
		if(session.delete(statement, map) != 1) result = false;
		return result;
	}
	
	public boolean update(CommentsVO vo) {
		boolean result = true;
		String statement = "resource.CommentsMapper.update";
		if(session.update(statement, vo) != 1) result = false;
		System.out.println("DAO result : "+result);
		return result;
	}
}
