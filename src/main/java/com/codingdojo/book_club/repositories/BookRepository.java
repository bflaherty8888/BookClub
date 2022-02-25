package com.codingdojo.book_club.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.book_club.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {

}
