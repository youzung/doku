package my.spring.doku;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.dao.BoardDAO;
import model.dao.CommentsDAO;
//import model.dao.ImageDAO;
import model.dao.PetMemberDAO;
import model.vo.BoardVO;
import model.vo.CommentsVO;
import model.vo.Pagination;
import model.vo.PetMemberVO;
@Controller
public class BoardController {
	@Autowired
	BoardDAO dao;
	@Autowired
	PetMemberDAO pdao;
	@Autowired
	CommentsDAO cdao;
	
	//게시판 메인
	@RequestMapping(value = "/boardmain", method = RequestMethod.GET)
	public ModelAndView listAll(BoardVO vo,int page) {
		ModelAndView mav = new ModelAndView();
		int listCnt = dao.listCnt();
		System.out.println(listCnt);
		Pagination pagination = new Pagination(listCnt,page);
		
		List<BoardVO> list = dao.listAll(page);
		mav.addObject("list", list);
		mav.addObject("pagination", pagination);
		mav.setViewName("board");
		System.out.println(pagination.toString());
		return mav;
	}
	
	//게시판 글 보기(1개)
	@RequestMapping(value = "/boardread", method = RequestMethod.GET)
	public ModelAndView listOne(int id) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo = dao.listOne(id);
		vo.setCnt(vo.getCnt()+1);
		dao.update(vo);
		mav.addObject("listOne",vo);
		List<CommentsVO> list = cdao.boardcom(id);
		System.out.println(list.size());
		mav.addObject("comlist", list);
		mav.setViewName("board");
		System.out.println(vo.toString());
		return mav;
	}
	
	//게시판 글 등록 전 세션 확인
	@RequestMapping(value="/boardwrite")
	public ModelAndView write(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(session.getAttribute("nickname"));
		if(session.getAttribute("nickname")!=null) {
			mav.setViewName("boardwrite");
		}else {
			mav.addObject("msg", "로그인 후 사용 가능합니다. 로그인 페이지로 이동합니다.");
			mav.setViewName("login");
		}
		return mav;
	}
	
	//게시판 글 등록
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse rep, BoardVO vo,
			PetMemberVO pvo,String nickname,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<String> fileNames = dao.uploadImage(req, rep);
		if(fileNames.size()!=0) {
			vo.setSrc(fileNames.get(0));
		}
		boolean result = dao.insert(vo);
		System.out.println("insert : "+ vo.toString());
		
		if(result) {
			boolean resultcnt = pdao.updatepostcnt(nickname);
			if(resultcnt) {
				pvo.setPostcnt((Integer) session.getAttribute("postcnt")+1);
				session.setAttribute("postcnt", pvo.getPostcnt());
			}
			mav.addObject("msg", "성공적으로 저장되었어요.");
		} else {
			mav.addObject("msg", "작성을 실패했어요.");
		}
		int listCnt = dao.listCnt();
		System.out.println(listCnt);
		Pagination pagination = new Pagination(listCnt,1);
		List<BoardVO> list = dao.listAll(1);
		mav.addObject("list", list);
		mav.addObject("pagination", pagination);
		mav.setViewName("board");
		return mav;
	}	
	
	//게시판 글 삭제
	@RequestMapping(value = "/boarddelete", method = RequestMethod.GET)
	public ModelAndView delete(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
			boolean result = dao.delete(vo.getId());
			if(result) {
				mav.addObject("msg", vo.getId() + "번 글이 삭제되었습니다.");
			} else {
				mav.addObject("msg", vo.getId() + "번 글이 존재하지 않습니다.");
			}
			int listCnt = dao.listCnt();
			System.out.println(listCnt);
			Pagination pagination = new Pagination(listCnt,1);
			List<BoardVO> list = dao.listAll(1);
			mav.addObject("list", list);
			mav.addObject("pagination", pagination);
			mav.setViewName("board");
		return mav;
	}
	
	//게시판 글 검색
	@RequestMapping(value = "/boardsearch", method = RequestMethod.GET)
	public ModelAndView search(BoardVO vo, String key, String searchType,int page) {
		ModelAndView mav = new ModelAndView();
		String view = "";
		if(key=="") {
			System.out.println("key값 = null");
			int listCnt = dao.listCnt();
			Pagination pagination = new Pagination(listCnt,1);
			mav.addObject("list", dao.listAll(1));
			mav.addObject("pagination", pagination);
			view = "board";
		}else {
			List<BoardVO> list = dao.search(key,searchType,page);
			System.out.println(page);
			if(list.size()==0) {
				int listCnt = dao.listCnt();
				Pagination pagination = new Pagination(listCnt,1);
				mav.addObject("msg", key+"를 담고 있는 글이 없습니다.");
				mav.addObject("list", dao.listAll(1));
				mav.addObject("pagination", pagination);
				view = "board";
			}else {
				System.out.println("key : "+key);
				System.out.println("searchType : " + searchType);
				int listCnt = dao.searchCnt(key, searchType);
				System.out.println("Controller : " + listCnt);
				Pagination pagination = new Pagination(listCnt,(page));
				mav.addObject("list", list);
				mav.addObject("pagination", pagination);
				mav.addObject("searchType", searchType);
				mav.addObject("key", key);
				view = "boardsearch";
			}
		}
		mav.setViewName(view);
		return mav;
	}
	
	//게시판 글 수정 폼
	@RequestMapping(value = "/boardupdatemain", method = RequestMethod.GET)
	public ModelAndView updatemain(int id) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo = dao.listOne(id);
		mav.addObject("listOne",vo);
		mav.setViewName("boardupdate");
		return mav;
	}
	
	//게시판 글 수정 수행 폼
	@RequestMapping(value = "/boardupdate", method = RequestMethod.POST)
	public ModelAndView update(BoardVO vo,int id) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.update(vo);
		if(result) {
			mav.addObject("msg", "성공적으로 수정되었어요.");
		} else {
			mav.addObject("msg", "수정을 실패했어요.");
		}
		BoardVO vo1 = dao.listOne(id);
		mav.addObject("listOne", vo1);
		List<CommentsVO> list = cdao.boardcom(id);
		System.out.println(list.size());
		mav.addObject("comlist", list);
		mav.setViewName("board");
		return mav;
	}
	
	@RequestMapping(value = "/boardimg")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardimg");
		return mav;
	}
}
