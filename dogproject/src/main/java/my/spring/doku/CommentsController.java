package my.spring.doku;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.dao.BoardDAO;
import model.dao.CommentsDAO;
import model.vo.BoardVO;
import model.vo.CommentsVO;

@Controller
public class CommentsController {
	@Autowired
	CommentsDAO dao;
	@Autowired
	BoardDAO bdao;
	
	//임시 댓글창
	@RequestMapping(value="/imsi")
	public ModelAndView imsi(CommentsVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listAll());
		mav.setViewName("imsi");
		return mav;
	}
	
	//임시 댓글 insert
	@RequestMapping(value="/insertimsi", method=RequestMethod.POST)
	public ModelAndView insertimsi(CommentsVO vo,BoardVO bvo,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.insert(vo);
		System.out.println("Controller result : " + result);
		if(result) {
			mav.addObject("msg", "댓글이 작성되었습니다.");
		}else {
			mav.addObject("msg", "댓글 작성에 실패했습니다.");
		}
		mav.addObject("list", dao.listAll());
		mav.setViewName("imsi");
		return mav;
	}
	
	//댓글 insert
	@RequestMapping(value="/insertcom", method=RequestMethod.POST)
	public ModelAndView insertcom(CommentsVO vo,BoardVO bvo,HttpSession session,int id) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.insert(vo);
		if(result) {
			mav.addObject("msg", "댓글이 작성되었습니다.");
		}else {
			mav.addObject("msg", "댓글 작성에 실패했습니다.");
		}
		List<CommentsVO> list = dao.boardcom(id);
		mav.addObject("comlist", list);
		mav.addObject("listOne", bdao.listOne(id));
		mav.setViewName("board");
		return mav;
	}
	
	//댓글 delete
	@RequestMapping(value="/deletecom", method = RequestMethod.GET)
	public ModelAndView deletecom(CommentsVO vo,BoardVO bvo,int cnum,HttpSession session,int id) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.delete(cnum,id);
		if(result) {
			mav.addObject("msg", "댓글이 삭제되었습니다.");
		}else {
			mav.addObject("msg", "댓글 삭제에 실패했습니다.");
		}
		List<CommentsVO> list = dao.boardcom(id);
		mav.addObject("comlist", list);
		mav.addObject("listOne", bdao.listOne(id));
		mav.setViewName("board");
		return mav;
	}
	
	//댓글 update
	@RequestMapping(value="/updatecom", method = RequestMethod.POST)
	public ModelAndView updatecom(CommentsVO vo,BoardVO bvo,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.update(vo);
		System.out.println("Cont result : "+result);
		if(result) {
			mav.addObject("msg", "댓글이 수정되었습니다.");
		}else {
			mav.addObject("msg", "댓글 수정에 실패했습니다.");
		}
		System.out.println(vo.getId());
		List<CommentsVO> list = dao.boardcom(vo.getId());
		mav.addObject("comlist", list);
		mav.addObject("listOne", bdao.listOne(vo.getId()));
		mav.setViewName("board");
		return mav;
	}
}
