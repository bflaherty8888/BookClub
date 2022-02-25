package com.codingdojo.book_club.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.book_club.models.Book;
import com.codingdojo.book_club.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepository;
	
	public Book findById(Long id) {
		Optional<Book> optBook = this.bookRepository.findById(id);
		
		if(optBook.isEmpty()) {
			return null;
		}
		
		return optBook.get();
	}
	
	public Iterable<Book> findAll(){
		return this.bookRepository.findAll();
	}
	
	public Book save(Book b) {
		return this.bookRepository.save(b);
	}
}
