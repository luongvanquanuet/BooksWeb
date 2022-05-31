package com.abc.service;

import com.abc.dto.BookDto;
import com.abc.entities.Book;
import com.abc.entities.BookImage;
import com.abc.entities.Publisher;
import com.abc.repository.BookImageRepository;
import com.abc.repository.BookRepository;
import com.abc.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;
@Service// đánh dấu bean trong spring
@Transactional// giao dịch thành công khi các giao dịch con thành công, 1 giao dịch con thất bại thì thất bại hết
//đảm bảo các hàm đc quản lý bằng transaction
public class BookServiceImpl {
    @Autowired
    BookRepository bookRepository;
    @Autowired
    PublisherRepository publisherRepository;
    //thêm sách có 2 thao tác
    //1 thêm nhà xuất bản
    //thêm sách
    @Autowired
    BookImageRepository bookImageRepository;
    public BookDto saveBook(BookDto bookDto){
        Book book = null;
        Publisher publisher=null;
        if(bookDto.getPublisherId()!=null){
            publisher=publisherRepository.findById(bookDto.getPublisherId()).get();
        }

        if(bookDto.getId()!=null){
            book=bookRepository.findById(bookDto.getId()).get();
            bookImageRepository.deleteAllByBookId(bookDto.getId());
        }
        if(book==null)
            book=new Book();

        if(publisher==null)
            publisher=new Publisher();

        publisher.setAddress((bookDto.getAddress()));
        publisher.setPhone(bookDto.getPhone());
        publisher.setName(bookDto.getName());
        publisherRepository.save(publisher);

        book.setAuthor(bookDto.getAuthor());
        book.setLanguage(bookDto.getLanguage());
        book.setName(bookDto.getName());
        book.setNumberPage(bookDto.getNumberPage());
        book.setPublisherId(publisher.getId());
        //lưu vào csdl
/*        if(publisher!=null){
            throw new RuntimeException("lỗi");
        }*/
        bookRepository.save(book);
        if(bookDto.getImages()!=null && bookDto.getImages().length>0){
            for(int i =0; i<bookDto.getImages().length;i++){
                BookImage bookImage = new BookImage();
                //bookImage.setId(book.getPublisherId());
                bookImage.setBookId(book.getId());
                bookImage.setPath(saveImage(bookDto.getImages()[i]));
                bookImageRepository.save(bookImage);
            }
        }
        return bookDto;
    }
    static String FOLDER = "F:\\images\\";
    private String saveImage(MultipartFile file){
        String nameFile = null;
        try {
            byte[] b = file.getBytes();
            nameFile = System.currentTimeMillis()+file.getOriginalFilename();
            File f = new File(FOLDER+nameFile);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(f));
            stream.write(b);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nameFile;
    }
    public List<Book> findAll(Integer page, Integer perpage, String sort,Model model){
        Sort order = Sort.by("name");//sort bởi tên sách
        order ="asc".equals(sort)?order.ascending():order.descending();
        Pageable pageable = PageRequest.of(page-1,perpage,order);
        Page<Book> books=bookRepository.findAll(pageable);

        //danh sách số phần tử hiển thị trên màn hình
        model.addAttribute("data", books.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("perpage", perpage);

        //tổng các phần tử muốn lấy
        model.addAttribute("total",books.getTotalElements());
        model.addAttribute("totalPage", books.getTotalPages());
        return books.getContent();
    }
    public Book findById(Long id){
        // get hay orElse nếu không có trả về null
        return bookRepository.findById(id).orElse(new Book());
        // trả về book rỗng
    }
}
