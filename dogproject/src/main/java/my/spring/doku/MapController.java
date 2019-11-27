package my.spring.doku;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.dao.MapDAO;

@Controller
public class MapController {
	@Autowired
	MapDAO dao;
	
	@RequestMapping(value="/map")
	public ModelAndView mainpage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dao.listAll());
		mav.setViewName("map");
		return mav;
	}

}
