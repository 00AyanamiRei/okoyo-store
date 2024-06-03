package com.ayanami.okoyo.service;

import com.ayanami.okoyo.entity.UserInfo;

import java.util.List;

public interface IUserInfoService {

    public List<UserInfo> getAllUserDetails();

    public void saveUserDetail(UserInfo userInfo);

    public UserInfo getUserDetail(int id);

    public void deleteUserDetail(int id);
}
