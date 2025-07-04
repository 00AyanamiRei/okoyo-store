package com.ayanami.okoyo.service;

import com.ayanami.okoyo.exception.UserNotFoundException;
import com.ayanami.okoyo.entity.User;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IUserService {

    public List<User> getAllUsers();

    public void saveUser(User user);

    void encodePassword(User user);

    String isLoginUnique(Integer id, String login);

    boolean checkLoginRegistration(String login);

    public User getUser(int id) throws UserNotFoundException;

    public User getUserByLogin(String login);

    public void deleteUser(Integer id) throws UserNotFoundException;

    Page<User> listByPage(int pageNum);
}
