package com.example.water_web.Mapper;

import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.GatherDonaVo;
import com.example.water_web.Vo.MakeDonaVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DonaMapper {

    // 기간 남은 전체 기부 리스트
    List<DonaVo> donainglistall(DonaVo vo);

    // 기간 남은 카테고리별 상품 리스트
    List<DonaVo> donainglist(int cntr_category);

    // 기부 조회
    DonaVo donasView(int cntr_sn);

    // 기부금 등록
    void makeDona(MakeDonaVo vo) throws Exception;

    // 기부금 모으기
    void gatherDona(GatherDonaVo vo) throws Exception;

    // 현재 기부액 조회
    DonaVo magaDona(int cntr_sn) throws Exception;

    // 기간 지난 전체 기부 리스트
    List<DonaVo> donaMlrd(DonaVo vo) throws Exception;

    // 기부 내역 조회
    List<DonaVo> breakdown(int cntr_sn) throws Exception;
    // 총 기부 내역 조회
    DonaVo breakdownSum(int cntr_sn) throws Exception;
}
