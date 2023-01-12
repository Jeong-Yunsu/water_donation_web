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
public class DonaVo {
    private int cntr_sn;
    private int mbr_sn;
    private String cntr_ttl;
    private String cntr_cn;
    private String cntr_file_id;
    private String cntr_adres1;
    private String cntr_adres2;
    private String cntr_loc_lat;
    private String cntr_loc_lng;
    private String cntr_rcvfvr;
    private LocalDate cntr_str_dt;
    private String cntr_end_dt;
    private int cntr_obctr;
    private int cntr_category;
    private int cntr_category2;

    private int ctbny_pc;     // 현재 기부액 조회
    private int percent;

    private String use_yn;

    private int rgtr_id;
    private Date rgtr_dt;
    private String mbfr_id;
    private LocalDateTime mbfr_dt;

    // 기부 내역 조회
    private int btr_pc;
    private String mbr_ncnm;
    private int breakdownSum;
}