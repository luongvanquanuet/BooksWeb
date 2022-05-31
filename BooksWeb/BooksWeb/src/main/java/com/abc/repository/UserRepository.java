package com.abc.repository;

import com.abc.entities.Book;
import com.abc.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
    // cập nhật mật khẩu bằng câu lệnh sql thông qua jpa
    @Modifying// câu lệnh này làm thay đổi dữ liệu
    @Query(value="update User u set u.password = ?2 where u.id = ?1")
    void updatePassword(Long id, String passwordEncoded);

    @Modifying// câu lệnh này làm thay đổi dữ liệu
    @Query(value="update User u set u.status = 1 where u.path = ?1")
    void active(String path);
    User findFirstByPath(String path);
}

