package com.abc.entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "book_image", schema = "booksweb", catalog = "")
public class BookImage implements Serializable {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column(name = "path", nullable = true, length = 255)
    private String path;
    @Basic
    @Column(name = "book_id", nullable = true)
    private Long bookId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }


}
