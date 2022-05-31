package com.abc.controller;

import com.abc.dto.BookDto;
import com.abc.entities.Book;
import com.abc.repository.BookRepository;
import com.abc.service.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/book")
@PreAuthorize("hasAnyRole('ADMIN','BOOK')")
public class BookController {
/*    @Autowired// Gọi 1 thằng repository
    BookRepository bookRepository;*/
    @Autowired
    BookServiceImpl bookService;
    //reder view trang thêm mới sách
    @RequestMapping("/add")
    public String addBook(Model model){
        model.addAttribute("title","Thêm sách");
        model.addAttribute("book",new BookDto());
        return "book/add";
    }

    @RequestMapping("edit/{id}")
    public String editBook(Model model, @PathVariable Long id){
        //BookDto bookDto=new BookDto(id);
        model.addAttribute("title", "Sửa sách");
        //Tìm kiếm Book theo Id
        Book book = bookService.findById(id);

/*        BookDto bookDto = bookDtos.get(id);
        if(bookDto==null){
            model.addAttribute("message", "Sách không tồn tại");
            model.addAttribute("book", new BookDto());
            return "book/add";
        }*/
        model.addAttribute("book",book);
        return "book/edit";
    }
    Map<String, BookDto> bookDtos=new HashMap<>();
    @PostMapping
    @RequestMapping("save")
    //@ModelAttribute("book")<=> với RequestBody
    public String save(@Valid @ModelAttribute("book") BookDto bookDto,  BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes

                        ){
        if(bindingResult.hasErrors()){
            model.addAttribute("message","Thêm thất bại, kiểm tra lại các trường");
            return "book/add";
        }
        bookService.saveBook(bookDto);
        // để lưu 1 book vào csdl tạo 1 đối tượng book*/

        //bookDtos.put(bookDto.getId(), bookDto);
        redirectAttributes.addFlashAttribute("message","Thêm thành công");
        return "redirect:/book/add";
    }
    @RequestMapping("list")
    public String listBook(@RequestParam(name="page", defaultValue = "1") Integer page, @RequestParam(name="perpage", defaultValue = "6")Integer perpage,@RequestParam(name="sort", defaultValue = "asc")String sort,Model model){
        bookService.findAll(page,perpage,sort, model);
        
        return "book/list";
    }


}
