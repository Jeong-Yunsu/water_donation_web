package com.example.water_web.Mapper;

import com.example.water_web.Vo.ComtVo;
import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.MlrdVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MlrdMapper {

    // 후기글 리스트 조회
    List<MlrdVo> viewMlrdList(int cntr_sn) throws Exception;

    // 후기글 조회
    List<MlrdVo> viewMlrd(int mlrd_sn) throws Exception;

    // 댓글 작성
    void comtRegist(ComtVo comt) throws Exception;

    // 댓글 리스트 조회
    List<ComtVo> comtList(int mlrd_sn) throws Exception;

}
