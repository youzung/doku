package model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.vo.PetMemberVO;

@Repository
public class PetMemberDAO {
	@Autowired
	SqlSession session = null;
	
	public List<PetMemberVO> listAll(){
		List<PetMemberVO> li = null;
		String statement = "resource.DogMapper.selectPetMember";
		li = session.selectList(statement);
		return li;
	}
	public boolean insert(PetMemberVO vo) {
		String statement = "resource.DogMapper.insertPetMember";
		String id = vo.getId();
		String email = vo.getEmail();
		String pwd = vo.getPwd();
		String pwdchk = vo.getPwdchk();
		String name = vo.getName();
		String nickname = vo.getNickname();
		String address = vo.getAddress();
		String pet = vo.getPet();
		vo.setId(id);
		vo.setEmail(email);
		vo.setPwd(pwd);
		vo.setPwdchk(pwdchk);
		vo.setName(name);
		vo.setNickname(nickname);
		vo.setAddress(address);
		vo.setPet(pet);
		if (session.insert(statement, vo) != 1) return false;
		return true;
	}
	public boolean checkId(String id) {
		String statement = "resource.DogMapper.checkId";
		if (session.selectOne(statement, id) != null) return true;
		return false;
	}
	public boolean checkNickname(String nickname) {
		String statement = "resource.DogMapper.checkNickname";
		if (session.selectOne(statement, nickname) != null) return true;
		return false;
	}
	public PetMemberVO checklogin(String id, String pwd) {
		String statement= "resource.DogMapper.login";
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		System.out.println(map);
		PetMemberVO vo = session.selectOne(statement, map);
		if(session.selectOne(statement,map) != null) return vo;
		return null;
	}
	public boolean updateinfo(PetMemberVO vo) {
		boolean result = true;
		String statement= "resource.DogMapper.updateinfo";	
		if(session.update(statement, vo) != 1) result = false;
		return result;
	}
	public boolean deleteinfo(Object id) {
		boolean result=true;
		String statement = "resource.DogMapper.deleteinfo";
		if(session.delete(statement, id) != 1)
			result = false;
		return result;
	}
	public boolean updatepostcnt(String nickname) {
		boolean result = true;
		String statement= "resource.DogMapper.updatepostcnt";	
		if(session.update(statement, nickname) != 1) result = false;
		System.out.println("result : "+result);
		return result;
	}
}
