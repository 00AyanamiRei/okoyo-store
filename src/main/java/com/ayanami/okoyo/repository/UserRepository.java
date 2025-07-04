package com.ayanami.okoyo.repository;

import com.ayanami.okoyo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("SELECT u FROM User u WHERE u.login = :login")
    public User findByLogin(@Param("login") String login);

    public Long countById(Integer id);


}
