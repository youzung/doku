package model.dao;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	SqlSession session = null;	
	   @Autowired
	   ServletContext context = null;

	public List<BoardVO> listAll(int page){
		List<BoardVO> list=null;
		String statement = "resource.BoardMapper.listAll";
		list = session.selectList(statement,page);
		return list;
	}
	public BoardVO listOne(int id) {
		BoardVO vo = null;
		String statement = "resource.BoardMapper.listOne";
		vo = session.selectOne(statement, id);
		return vo;
	}
	public boolean insert(BoardVO vo) {
		boolean result=true;
		String statement = "resource.BoardMapper.insert";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	public boolean delete(int id) {
		boolean result=true;
		String statement = "resource.BoardMapper.delete";
		if(session.delete(statement, id) != 1)
			result = false;
		return result;
	}
	public List<BoardVO> search(String key, String searchType,int page){
		List<BoardVO> list=null;
		BoardVO vo = new BoardVO();
		vo.setKey(key);
		String type = "";
		if(searchType.equals("제목")) {
			type = "title";
		}else if(searchType.equals("작성자")) {
			type = "nickname";
		}else if(searchType.equals("내용")) {
			type = "content";
		}
		vo.setSearchType(type); 
		vo.setPage((page));
		String statement = "resource.BoardMapper.search";
		list = session.selectList(statement, vo);
        return list;
	}
	public boolean update(BoardVO vo) {
		boolean result=true;
		String statement = "resource.BoardMapper.update";
		if(session.update(statement, vo) != 1)
			result = false;
		return result;	
	}	
	public int listCnt() {
		String statement = "resource.BoardMapper.listCnt";
		int listCnt = session.selectOne(statement);
		System.out.println(listCnt);
		return listCnt;
	}
	public int searchCnt(String key, String searchType) {
		String statement = "resource.BoardMapper.searchCnt";
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
		String type = "";
		if(searchType.equals("제목")) {
			type = "title";
		}else if(searchType.equals("작성자")) {
			type = "nickname";
		}else if(searchType.equals("내용")) {
			type = "content";
		}
		map.put("searchType", type);
		int searchCnt = session.selectOne(statement,map);
		System.out.println("DAO : "+searchCnt);
		return searchCnt;
	}
	
	
	   public List<String> uploadImage(HttpServletRequest req, HttpServletResponse rep) {
//	      String path = "C://Users//suyong//eclipse-workspace//traveler//src//main//webapp//resources//images";
//		   String path = "C://Users//student//Desktop//eclipse-workspace//dogproject//src//main//webapp//resources//img";
	      String path = context.getRealPath("/") + "/resources//img";
	      Map returnObject = new HashMap();
	      ArrayList<String> fileNameList = new ArrayList<String>();

	      try { // MultipartHttpServletRequest 생성
	         MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
	         Iterator<String> iter = mhsr.getFileNames();
	         MultipartFile mfile = null;
	         String fieldName = "";
	         List resultList = new ArrayList(); // 디레토리가 없다면 생성
	         File dir = new File(path);
	         if (!dir.isDirectory()) {
	            dir.mkdirs();
	         } // 값이 나올때까지
	         while (iter.hasNext()) {
	            fieldName = iter.next(); // 내용을 가져와서
	            mfile = mhsr.getFile(fieldName);
	            String origName;
	            origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
	            // 한글꺠짐 방지 // 파일명이 없다면
	            if ("".equals(origName)) {
	               continue;
	            } // 파일 명 변경(uuid로 암호화)
	            String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
	            String saveFileName = getUuid() + ext; // 설정한 path에 파일저장
	            File serverFile = new File(path + File.separator + saveFileName);
	            mfile.transferTo(serverFile);
	            Map file = new HashMap();
	            file.put("origName", origName);
	            file.put("sfile", serverFile);
	            resultList.add(file);

	            // 별도로 파일이름들 저장
	            fileNameList.add(saveFileName);
	         }
	         returnObject.put("files", resultList);
	         returnObject.put("params", mhsr.getParameterMap());
	      } catch (UnsupportedEncodingException e) { // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (IllegalStateException e) { // TODO Auto-generated catch block
	         e.printStackTrace();
	      } catch (IOException e) { // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return fileNameList;
	   }
	
	   private static String getUuid() {
		      return UUID.randomUUID().toString().replaceAll("-", "");
		   }
	
}
