package com.example.water_web.Service;

import com.example.water_web.Vo.LoginResponse;
import com.example.water_web.Vo.UserVo;

import java.util.List;

public interface UserService {

    // 마이페이지에서 내정보+기부총액 불러오기
    List<UserVo> getUserList(Integer sn);

    // 마이페이지에서 기부금액+날짜 불러오기
    List<UserVo> getUserDonaDate(Integer sn);

    // 유저 정보
    Integer getMbrSn(String mbr_id, String mbr_password);
    UserVo getUserBySn(Integer mbr_sn);

    //회원가입
    void signUp(UserVo userVo);

    //로그인
    LoginResponse login(UserVo userVo);

    // 중복체크
    int idCheck(String mbr_id);

    // 관리자 페이지 들어갈 때
    UserVo signin(UserVo userVo);
}
