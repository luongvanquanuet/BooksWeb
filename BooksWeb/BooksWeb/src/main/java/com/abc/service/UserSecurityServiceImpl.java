package com.abc.service;

import com.abc.dto.UserDto;
import com.abc.entities.User;
import com.abc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service// đánh dấu bean trong spring
@Transactional// giao dịch thành công khi các giao dịch con thành công, 1 giao dịch con thất bại thì thất bại hết
//đảm bảo các hàm đc quản lý bằng transaction
public class UserSecurityServiceImpl implements UserDetailsService {
    @Autowired
     UserServiceImpl userService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // lấy dữ liệu từ dtb
        User user=userService.findByUsername(username);
        return user;
    }
}
