package com.example.water_web.Mapper;

import com.example.water_web.Vo.DonaVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {

    List<DonaVo> main1(DonaVo vo);

    List<DonaVo> main2(DonaVo vo);

    List<DonaVo> main3(DonaVo vo);
}
