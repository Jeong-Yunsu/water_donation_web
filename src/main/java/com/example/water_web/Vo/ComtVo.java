package com.example.water_web.Vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@Getter
@Setter
public class ComtVo {

    private int comt_sn;
    private int mlrd_sn;
    private String comt_cn;

    private String use_yn;

    private int rgtr_id;
    private Date rgtr_dt;
    private String mbfr_id;
    private LocalDateTime mbfr_dt;

    private int cntr_sn;
    private int mbr_sn;
    private String mbr_id;
}