package com.abc.entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name="book")
@Data
public class Book implements Serializable {
    //thao tác với lưu trữ như lưu vào file hoặc lưu vào text hoặc lưu vào database thì phải có serializable
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @Column(name="name")
    String name;
    @Column(name="author")
    String author;
    @Column(name="number_page")
    int numberPage;
    @Column(name="language")
    String language;

    @Column(name="publisher_id")
    Long publisherId;
    @OneToOne(fetch =FetchType.EAGER)// tìm kiếm 1 user nó sẽ bắt buộc join sang bảng image lấy luôn
    // khi load user thì nó load cả image-user
    //LAZY: k lấy cái chung chỉ lấy cái tại đó
    @JoinColumn(name="id", referencedColumnName = "publisher_id", insertable = false,updatable = false)
    Publisher publishers;
    @OneToMany(fetch =FetchType.EAGER)// tìm kiếm 1 user nó sẽ bắt buộc join sang bảng image lấy luôn
    // khi load book thì nó load cả book_image
    //LAZY: k lấy cái chung chỉ lấy cái tại đó( chỉ load book)
    @JoinColumn(name="book_id", referencedColumnName = "id", insertable = false,updatable = false)
    List<BookImage> bookImages;






}
