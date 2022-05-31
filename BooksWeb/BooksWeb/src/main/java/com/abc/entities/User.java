package com.abc.entities;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="user")
@Data
public class User implements UserDetails {
    //thao tác với lưu trữ như lưu vào file hoặc lưu vào text hoặc lưu vào database thì phải có serializable
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @Column(name="username")
    String username;
    @Column(name="password")
    String password;
    @Column(name="email")
    String email;
    @Column(name="status")
    Integer status;// Trạng thái kích hoạt user(0 tạm dừng, 1 kích hoạt)

    @Column(name="role")
    String role;
    @Column(name="path")
    String path;
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new HashSet<>();
        if(role!=null && !"".equals(role)){
            String r = role;
            if(!role.toUpperCase().startsWith("ROLE_"))
                r  = "ROLE_" + r.toUpperCase();
            authorities.add(new SimpleGrantedAuthority(r));
        }
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return (status==null||status==0)?false:true;
        //return true;
    }

}
