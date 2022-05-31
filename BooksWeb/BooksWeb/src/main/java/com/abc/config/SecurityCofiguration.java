package com.abc.config;

import com.abc.service.UserSecurityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

// Thiết lập file cấu hình
@Configurable// đánh dâu 1 config
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityCofiguration extends WebSecurityConfigurerAdapter {// áp dụng spring security cho hệ thống java web

    @Autowired
    UserSecurityServiceImpl userSecurityService;
    //bean khác gì với Autowired
    //khi nào thì sử dụng bean
  @Bean// đăng ký kiểu mã hóa cho password
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    // đăng ký service load user và dạng mã hóa mật khẩu
    @Autowired
    public void configurationAuthenticationManager(AuthenticationManagerBuilder authenticationManagerBuilder){
        DaoAuthenticationProvider authenticationProvider=new DaoAuthenticationProvider();
        authenticationProvider.setPasswordEncoder(new BCryptPasswordEncoder());// thiết lập cơ chế mã hóa mật khẩu
        authenticationProvider.setUserDetailsService(userSecurityService);//đăng ký service để load user từ dtb
        authenticationManagerBuilder.authenticationProvider(authenticationProvider);
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/login","/register","/active").permitAll()// cho phép không cần đăng nhập vào thẳng login(đăng ký đường dẫn login thì ai cũng có thể vào được)
                .anyRequest().authenticated();// các request còn lại phải authen
        http.formLogin()
                .loginPage("/login")//đăng ký trang login
                .loginProcessingUrl("/doLogin")// khi click vào thì gọi hàm xử lý
                .usernameParameter("username")
                .passwordParameter("password")
                .defaultSuccessUrl("/book/list");
        http.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/login").permitAll();
        http.csrf().disable();
    }
    @Override
    public void configure(WebSecurity web) throws Exception{
        web.ignoring().antMatchers("/css/**","/images/**","/js/**", "/book-image/**","/src/**","/dist/**","/plugins/**");
    }


}
