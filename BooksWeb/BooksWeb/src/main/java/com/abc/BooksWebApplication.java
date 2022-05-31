package com.abc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.Entity;

@SpringBootApplication
@EntityScan("com.abc.entities")//đánh dấu để spring boot hiểu được pakage entities để nó tìm
@EnableJpaRepositories("com.abc.repository")
// cho phép những thằng trong repository mới được tương tác với cơ sở dữ liệu
@EnableTransactionManagement// cho phép tôi sẽ quản lý transaction cho a

public class BooksWebApplication {


    public static void main(String[] args) {
        SpringApplication.run(BooksWebApplication.class, args);
    }

}
