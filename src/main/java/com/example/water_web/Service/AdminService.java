package com.example.water_web.Service;

import com.example.water_web.Vo.CtgryVo;
import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.MlrdVo;

import java.util.List;

public interface AdminService {

    //카테고리
    List<CtgryVo> ctgry() throws Exception;

    // 기부글 등록
    void register(DonaVo vo) throws Exception;

    // 기부글 목록
    List<DonaVo> donaslist() throws Exception;

    // 기부글 조회
    DonaVo donasView(int cntr_sn) throws Exception;

    // 기부글 수정
    void donasModify(DonaVo vo) throws Exception;

    // 기부글 삭제
    void donasDelete(int cntr_sn) throws Exception;

    // 소통글 등록
    void mlrdRegister(MlrdVo vo) throws Exception;

    // 소통글 목록
    List<DonaVo> mlrdList() throws Exception;

    // 소통글 조회
    MlrdVo mlrdView(int mlrd_sn) throws Exception;

    // 소통글 수정
    void mlrdModify(MlrdVo vo) throws Exception;

}
