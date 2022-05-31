package com.abc.service;

import com.abc.dto.BookDto;
import com.abc.dto.ChangePassword;
import com.abc.dto.Response;
import com.abc.dto.UserDto;
import com.abc.entities.Book;
import com.abc.entities.Publisher;
import com.abc.entities.User;
import com.abc.repository.BookRepository;
import com.abc.repository.PublisherRepository;
import com.abc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;
import java.util.UUID;

@Service// đánh dấu bean trong spring
@Transactional// giao dịch thành công khi các giao dịch con thành công, 1 giao dịch con thất bại thì thất bại hết
//đảm bảo các hàm đc quản lý bằng transaction
public class UserServiceImpl {
    @Autowired
    UserRepository userRepository;
    /*@Autowired
    PasswordEncoder passwordEncoder;

*/

    public User findByUsername(String username){
        return userRepository.findByUsername(username);
    }
    public User findById(Long id){
        return userRepository.findById(id).get();
    }
    public User saveUser(UserDto userDto){
        User user = new User();
        user.setUsername(userDto.getUserName());
        user.setEmail(userDto.getEmail());
        user.setPassword(new BCryptPasswordEncoder().encode(userDto.getPassword()));
        user.setStatus(1);
        user.setRole(userDto.getRole());
        return userRepository.save(user);
    }

    public User createUser(String email, String password){
        User user = new User();
        user.setUsername(email);
        user.setEmail(email);
        user.setPassword(new BCryptPasswordEncoder().encode(password));
        user.setStatus(0);
        user.setRole("USER");
        user.setPath(UUID.randomUUID().toString());
        userRepository.save(user);
        return user;
    }

    public User activeUser(String path){
        User user = userRepository.findFirstByPath(path);
        if(user==null || user.getStatus()==1)
            return null;
        userRepository.active(path);

        return user;
    }
    public Response changePass(ChangePassword changePassword){
        //lấy thông tin user đã đăng nhập
        Response response = new Response(1,"Thay đổi mật khẩu thất bại");
        Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
        User user = (User)authentication.getPrincipal();
        PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
        if(passwordEncoder.matches(changePassword.getOldPassword(),user.getPassword())){
            userRepository.updatePassword(user.getId(),passwordEncoder.encode(changePassword.getNewPassword()));
            //nếu đúng mật khẩu thì sẽ cập nhật  lại mật khẩu
            response.setCode(1);
            response.setData("Thanh đổi mật khẩu thành công . Thoát ra để đăng nhập lại");
        }
        else{
            // sai mật khẩu
            response.setCode(0);
            response.setData("Không đúng mật khẩu");


        }

        return response;


    }

}
