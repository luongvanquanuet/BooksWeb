package com.abc.repository;

import com.abc.entities.BookImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
//@Transactional
public interface BookImageRepository extends JpaRepository<BookImage,Long> {

void deleteAllByBookId(Long bookId);



}

