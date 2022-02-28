package com.codingdojo.book_club.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.book_club.models.Book;
import com.codingdojo.book_club.services.BookService;
import com.codingdojo.book_club.services.UserService;

@Controller
@RequestMapping("/books")
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;

	@RequestMapping("")
	public String dashboard(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
		model.addAttribute("allBooks", this.bookService.findAll());
		return "dashboard.jsp";
	}

	@RequestMapping("/new")
	public String newBook(Model model) {
		model.addAttribute("book", new Book());
		return "newBook.jsp";
	}

	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "newBook.jsp";
		}

		book.setUser(userService.findById((Long) session.getAttribute("userId")));
		this.bookService.save(book);
		return "redirect:/books";
	}

	@RequestMapping("/{id}")
	public String view(@PathVariable("id") Long id, Model model, HttpSession session) {
		model.addAttribute("book", this.bookService.findById(id));
		model.addAttribute("user", this.userService.findById((Long) session.getAttribute("userId")));
		return "showBook.jsp";
	}

	@RequestMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		Book book = this.bookService.findById(id);
		if (!book.getUser().getId().equals(session.getAttribute("userId"))) {
			return "redirect:/books";
		}

		model.addAttribute("book", book);
		return "editBook.jsp";
	}
	
	@PutMapping("{id}/update")
	public String update(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "editBook.jsp";
		}
		
		book.setUser(this.userService.findById((Long) session.getAttribute("userId")));
		
		this.bookService.save(book);
		return "redirect:/books";
	}
}
