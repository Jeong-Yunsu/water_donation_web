package com.example.water_web.Service;

import com.example.water_web.Vo.DonaVo;

import java.util.List;

public interface MapService {

    // 위도 경도
    List<DonaVo> latlng(DonaVo vo) throws Exception;
}
