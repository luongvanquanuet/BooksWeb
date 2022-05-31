package com.abc.dto;

import com.abc.entities.BookImage;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Data
public class BookDto implements Serializable {
    Long id;
    public BookDto(){
        id=null;
    }
    public BookDto(Long id){
        this.id=id;
    }
    @NotBlank(message = "Tên sách không được rỗng")
    String name;
    @NotBlank(message = "Tên tác giả không được rỗng")
    String author;
    @Min(value = 1, message = "Số trang phải lớn hơn 0")
    int numberPage;
    //@NotBlank(message = "Ngôn ngữ không được rỗng")
    String language;
    @NotBlank(message = "Nhà xuất bản không được trống")
    String publisher;

    String address;

    String phone;
    Long publisherId;
    MultipartFile[] images;
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BookDto)) return false;
        BookDto bookDto = (BookDto) o;
        return getId().equals(bookDto.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}
