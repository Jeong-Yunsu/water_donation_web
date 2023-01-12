package com.example.water_web.Vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Data
@Getter
@Setter
public class UserVo {
    private int mbr_sn;
    private String mbr_id;
    private String mbr_password;
    private int mbr_se;
    private String mbr_nm;
    private String mbr_ncnm;
    private String mbr_gen;
    private String mbr_tel;
    private String mbr_brthdy;
    private String mbr_email;

    private int fail_cnt;
    private String lock_yn;

    private String use_yn;
    private int verify; //관리자 페이지용

    private String rgtr_id;
    private LocalDateTime rgtr_dt;
    private String mbfr_id;
    private LocalDateTime mbfr_dt;

    private int dona_sn;
    private int sum_btr_pc;
    private int btr_pc;
    private LocalDateTime dona_dt;
    private String dona_ttl;
}
