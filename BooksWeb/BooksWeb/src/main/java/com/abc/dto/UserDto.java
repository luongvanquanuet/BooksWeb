package com.abc.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class UserDto implements Serializable {
    String userName;
    String password;
    String email;
    String role;
   // MultipartFile[] images;// danh sách ảnh



}
