package com.example.water_web.Controller;

import com.example.water_web.Service.AdminService;
import com.example.water_web.Service.DonaService;
import com.example.water_web.Vo.CtgryVo;
import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.MlrdVo;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/*")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    DonaService donaService;

    // 관리자화면
    @GetMapping("/index")
    public void getIndex() throws Exception {
    }

    // 기부 등록 페이지
    @GetMapping("/indexregister")
    public void getDonasRegister(Model model) throws Exception {
        List<CtgryVo> ctgry = null;
        ctgry = adminService.ctgry();
        model.addAttribute("ctgry", JSONArray.fromObject(ctgry));
    }

    // 기부 등록
    @PostMapping("/indexregister")
    public String postDonasRegister(DonaVo vo) throws Exception {
        adminService.register(vo);

        return "redirect:/index";
    }

    // 기부 목록 페이지
    @GetMapping("/indexlist")
    public void getdonasList(Model model) throws Exception {
        List<DonaVo> list = adminService.donaslist();
        model.addAttribute("list", list);
    }

    // 기부 조회 페이지
    @GetMapping("/indexview")
    public void getdonasview(@RequestParam("n") int cntr_sn, Model model) throws Exception {
        DonaVo donas = adminService.donasView(cntr_sn);
        model.addAttribute("donas", donas);
    }

    // 기부 수정 페이지
    @GetMapping("/indexmodify")
    public void getDonasModify(@RequestParam("n") int cntr_sn, Model model) throws Exception {
        DonaVo donas = adminService.donasView(cntr_sn);
        model.addAttribute("donas", donas);

        List<CtgryVo> category = null;
        category = adminService.ctgry();
        model.addAttribute("category", JSONArray.fromObject(category));
    }

    // 기부 수정
    @PostMapping("/indexmodify")
    public String postDonasModify(DonaVo vo) throws Exception {
        adminService.donasModify(vo);

        return "redirect:/index";
    }

    // 기부 삭제
    @PostMapping("/indexdelete")
    public String postDonasDelete(@RequestParam("n") int cntr_sn) throws Exception {
        // @RequestParam("n")으로 인해, URL주소에 있는 n의 값을 가져와 gdsNum에 저장
        adminService.donasDelete(cntr_sn);

        return "redirect:/index";
    }

    // 기부 소통글 등록 페이지
    @GetMapping("/indexmlrdregister")
    public void getMlrdRegister(DonaVo vo, Model model) throws Exception {
        List<DonaVo> list = adminService.donaslist();
        model.addAttribute("mlrdlist", list);
    }

    // 기부 소통글 등록
    @PostMapping("/indexmlrdregister")
    public String postMlrdRegister(MlrdVo vo) throws Exception {
        adminService.mlrdRegister(vo);

        return "redirect:/index";
    }





}
