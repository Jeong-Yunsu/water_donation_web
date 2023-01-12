package com.example.water_web.Vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Getter
@Setter
public class MlrdVo {

    private int mlrd_sn;
    private int cntr_sn;
    private String mlrd_ttl;
    private String mlrd_cn;
    private String mlrd_file_id;

    private String use_yn;

    private int rgtr_id;
    private Date rgtr_dt;
    private String mbfr_id;
    private LocalDateTime mbfr_dt;

    private String cntr_ttl;
    private String cntr_rcvfvr;     // 후원기관
    private int ctbny_pc;   // 현재 기부액 조회
    private int percent;    // 현재 기부액 백분율 조회
    private LocalDate cntr_str_dt;
    private String cntr_end_dt;
    private int cntr_obctr;     // 목표액 조회

    // 댓글용
    private String mbr_nm;
    private String comt_cn;
    private String mbr_id;
    private String mbr_ncnm;
}
