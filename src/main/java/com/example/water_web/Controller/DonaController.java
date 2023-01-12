package com.example.water_web.Controller;

import com.example.water_web.Service.DonaService;
import com.example.water_web.Service.UserService;
import com.example.water_web.Vo.DonaVo;
import com.example.water_web.Vo.GatherDonaVo;
import com.example.water_web.Vo.MakeDonaVo;
import com.example.water_web.Vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/*")
public class DonaController {

    @Autowired
    DonaService service;

    @Autowired
    private UserService userService;

    // 기간 남은 전체 기부 리스트
    @GetMapping("/donainglistall")
    public void getListall(DonaVo vo, Model model) throws Exception {
        List<DonaVo> list = null;
        list = service.donainglistall(vo);
        model.addAttribute("donainglistall", list);
    }

    // 기간 남은 카테고리별 기부 리스트
    @GetMapping("/donainglist")
    public void getList(@RequestParam("c") int cntr_category, Model model) throws Exception {
        List<DonaVo> list = null;
        list = service.donainglist(cntr_category);
        model.addAttribute("donainglist", list);
    }

    // 기부 조회 페이지
    @GetMapping("/view")
    public void getView(@RequestParam("n") int cntr_sn, Model model) throws Exception {
        DonaVo view = service.donasView(cntr_sn);
        model.addAttribute("view", view);

        // 현재 기부액 조회 + 기부율
        DonaVo view2 = service.magaDona(cntr_sn);
        model.addAttribute("view2", view2);

        // 기부 내역 조회
        List<DonaVo> breakdown = service.breakdown(cntr_sn);
        model.addAttribute("breakdown", breakdown);
        // 총 기부 내역 조회
        DonaVo breakdownSum = service.breakdownSum(cntr_sn);
        model.addAttribute("breakdownSum", breakdownSum);

    }

    // 기부 내역 조회
    @PostMapping("/view")
    public String postMakeDona(MakeDonaVo vo, GatherDonaVo vo2) throws Exception {
        service.makeDona(vo);
        service.gatherDona(vo2);

        return "redirect:/main";
    }

    // 기부금 등록 + 기부금 모으기 페이지
    @GetMapping("/viewinputdona")
    public void getMakeDona(@RequestParam("n") int cntr_sn, Model model, HttpSession session) throws Exception {
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userService.getUserBySn(sn);
        model.addAttribute("user", userVo);

        DonaVo viewinput = service.donasView(cntr_sn);
        model.addAttribute("viewinput", viewinput);
    }

    // 기부금 등록 + 기부금 모으기
    @PostMapping("/viewinputdona")
    public String postMaGaDona(MakeDonaVo vo, GatherDonaVo vo2) throws Exception {
        service.makeDona(vo);
        service.gatherDona(vo2);

        return "redirect:/main";
    }

    // 기간 지난 전체 기부 리스트
    @GetMapping("/donamlrd")
    public void getDonaMlrd(DonaVo vo, Model model) throws Exception {
        List<DonaVo> list = null;
        list = service.donaMlrd(vo);
        model.addAttribute("donamlrd", list);
    }
}
