package com.example.water_web.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginResponse {
    UserVo loginMember;
    boolean isSuccess;
    String message;
}
