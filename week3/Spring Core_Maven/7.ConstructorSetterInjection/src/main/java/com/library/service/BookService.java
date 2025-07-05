package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

    private String serviceName;
    private BookRepository bookRepository;

    // Constructor for Constructor Injection
    public BookService(String serviceName) {
        this.serviceName = serviceName;
    }

    // Setter for Setter Injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void addBook() {
        bookRepository.saveBook();
        System.out.println(serviceName + " - Book added successfully.");
    }
}
