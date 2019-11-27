package my.spring.doku;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.dao.BoardDAO;
import model.dao.PetMemberDAO;
import model.vo.PetMemberVO;

@Controller
public class PetMemberController {
	@Autowired
	PetMemberDAO dao;
	@Autowired
	BoardDAO bdao;
	
	// 메인페이지
	@RequestMapping(value="/mainpage")
	public ModelAndView mainpage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainpage");
		return mav;
	} 
	
	//약관동의 폼
	@RequestMapping(value="agree")
	public ModelAndView agree() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("agree");
		return mav;
	}
	
	// 회원가입 폼 처리
	@RequestMapping(value="/signup")
	public ModelAndView signup(PetMemberVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (request.getMethod().equals("GET")) {
			mav.setViewName("signup");
			return mav;
		}
		dao.insert(vo);
		mav.setViewName("signupcomple");
		return mav;
	}
	
	
	//로그인 메인
	@RequestMapping(value="/loginmain" )
	@ResponseBody
	public ModelAndView loginmain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	  //로그인 
	  @RequestMapping(value="/login", method = RequestMethod.POST) 
	  @ResponseBody
	  public boolean login(String id, String pwd, HttpSession session){ 
		  PetMemberVO vo = dao.checklogin(id, pwd);
		  if(vo != null) {
			  session.setAttribute("id",vo.getId());
			  session.setAttribute("pwd",vo.getPwd());
			  session.setAttribute("pwdchk",vo.getPwdchk());
			  session.setAttribute("nickname", vo.getNickname());
			  session.setAttribute("address", vo.getAddress());
			  session.setAttribute("email", vo.getEmail());
			  session.setAttribute("name", vo.getName());
			  session.setAttribute("pet", vo.getPet());
			  session.setAttribute("postcnt", vo.getPostcnt());
			  session.setAttribute("comcnt", vo.getComcnt());
			  return true;
		  }
		  System.out.println(session.getAttribute("nickname"));
		  return false;
	  }
	  
	  //로그아웃
	  @RequestMapping(value="/logout")
	  public ModelAndView logout(HttpSession session) {
		  ModelAndView mav = new ModelAndView();
		  session.invalidate();
		  mav.setViewName("mainpage");
		  return mav;
	  }
	 
	  //마이페이지 이동
	  @RequestMapping(value="/mypage")
	  public ModelAndView mypage(HttpSession session,String key) {
		  ModelAndView mav = new ModelAndView();
		  key = (String) session.getAttribute("nickname");
		//  mav.addObject("list", bdao.search(key, "작성자",page));
		  
		  mav.setViewName("mypage");
		  return mav;
	  }
	  
//	  //개인정보 수정 전 비밀번호 입력 폼 이동
//	  @RequestMapping(value="/mypagepwd")
//	  public ModelAndView mypagepwd() {
//		  ModelAndView mav = new ModelAndView();
//		  mav.setViewName("mypagepwd");
//		  return mav;
//	  }
	  
//	  //개인정보 수정 화면으로 이동
//	  @RequestMapping(value="/updateinfo")
//	  public ModelAndView updateinfo(HttpSession session) {
//		  ModelAndView mav = new ModelAndView();
//		  mav.setViewName("updateinfo");
//		  return mav;
//	  }
	  
	  //개인정보 수정
	  @RequestMapping(value = "/update", method = RequestMethod.POST)
	  public ModelAndView update(PetMemberVO vo , HttpSession session) {
			ModelAndView mav = new ModelAndView();
			boolean result = dao.updateinfo(vo);
			System.out.println(result);
			if(result) {
				mav.addObject("msg", "성공적으로 수정되었어요.");
			} else {
				mav.addObject("msg", "수정을 실패했어요.");
			}
			session.setAttribute("pwd",vo.getPwd());
			session.setAttribute("pwdchk",vo.getPwdchk());
			session.setAttribute("address", vo.getAddress());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("pet", vo.getPet());
			mav.setViewName("mypage");
			return mav;
		}
	  
//	  //회원탈퇴 이전 비밀번호 입력 폼으로
//	  @RequestMapping(value="/secessionpwd")
//	  public ModelAndView secessionpwd() {
//		  ModelAndView mav = new ModelAndView();
//		  mav.setViewName("secessionpwd");
//		  return mav;
//	  }
	  
	  
//	  //회원탈퇴 폼으로
//	  @RequestMapping(value="/secessionmain")
//	  public ModelAndView secessionmain() {
//		  ModelAndView mav = new ModelAndView();
//		  mav.setViewName("secession");
//		  return mav;
//	  }
	  
	  //회원 탈퇴
	  @RequestMapping(value="secession")
	  public ModelAndView secession(HttpSession session,PetMemberVO vo) {
		  ModelAndView mav = new ModelAndView();
		  System.out.println(session.getAttribute("id"));
		  boolean result = dao.deleteinfo(session.getAttribute("id"));
		  if(result) {
			  session.invalidate();
			  mav.addObject("msg", "탈퇴 처리 되었습니다.");
			  mav.setViewName("mainpage");
		  }
		  return mav;
	  }
	  
	@RequestMapping(value="/validateForm")
	@ResponseBody
	public boolean idCheck(String id) {
		boolean result = dao.checkId(id);
		System.out.println(result);
		if (dao.checkId(id)) return true;
		else return false;
	}
	
	@RequestMapping(value="/validateForm1")
	@ResponseBody
	public boolean nicknameCheck(String nickname) {
		boolean result = dao.checkNickname(nickname);
		System.out.println(result);
		if (dao.checkNickname(nickname)) return true;
		else return false;
	}
}
