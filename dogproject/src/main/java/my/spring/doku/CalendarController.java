package my.spring.doku;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import model.dao.CalendarDAO;
import model.vo.CalendarVO;

@Controller
public class CalendarController {
	@Autowired
	CalendarDAO dao;

	@RequestMapping(value = "listAll")
	@ResponseBody
	public String listAll(HttpSession session) {
		Gson gson = new Gson();
		String nickname = (String) session.getAttribute("nickname");
		return gson.toJson(dao.listAll(nickname));
	}

	@RequestMapping(value = "/calendar")
	public ModelAndView cal(CalendarVO vo, String action, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		boolean result = false;

		System.out.println(session.getAttribute("nickname"));
		if (session.getAttribute("nickname") != null) {

			if (action != null) {
				if (action.equals("insert")) {
					vo.setNickname((String) session.getAttribute("nickname"));
					System.out.println(vo.getNickname() + "abc");
					result = dao.insert(vo);
					if (result == false)
						mav.addObject("msg", "일정을 모두 작성해주세요.");

					mav.setViewName("calendar");
				}

				if (action.equals("delete")) {
					result = dao.delete(vo.getId());
				}

			}

			mav.setViewName("calendar");
		} else {
			mav.addObject("msg", "로그인 후 사용 가능합니다. 로그인 페이지로 이동합니다.");
			mav.setViewName("login");
		}
		return mav;
	}
}
