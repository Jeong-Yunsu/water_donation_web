package com.example.water_web.Service;

import com.example.water_web.Vo.LoginResponse;
import com.example.water_web.Vo.UserVo;

import java.util.List;

public interface UserService {
    List<UserVo> getUserList(Integer sn); // 마이페이지에서 내정보+기부총액 불러오기
    List<UserVo> getUserDonaDate(Integer sn); // 마이페이지에서 기부금액+날짜 불러오기
    UserVo getUserBySn(Integer mbr_sn);
    void signUp(UserVo userVo);
    LoginResponse login(UserVo userVo);
    Integer getMbrSn(String mbr_id, String mbr_password);
    int idCheck(String mbr_id);

    UserVo signin(UserVo userVo); //관리자 페이지용
}
