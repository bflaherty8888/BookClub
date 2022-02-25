package com.codingdojo.book_club.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.book_club.models.LoginUser;
import com.codingdojo.book_club.models.User;
import com.codingdojo.book_club.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "redirect:/dashboard";
		}
		model.addAttribute("user", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result) {
		this.userService.save(user, result);
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model,
			HttpSession session) {
		User user = this.userService.login(loginUser, result);

		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "index.jsp";
		}

		session.setAttribute("userId", user.getId());
		System.out.println("----------" + session.getAttribute("userId"));

		return "redirect:/books";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}
}
