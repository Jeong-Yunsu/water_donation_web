package com.example.water_web.Controller;

import com.example.water_web.Mapper.UserMapper;
import com.example.water_web.Service.UserService;
import com.example.water_web.Service.UserServiceImpl;
import com.example.water_web.Vo.LoginResponse;
import com.example.water_web.Vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserController {

    @Autowired
    private final UserServiceImpl userServiceImpl;

    // 회원가입 페이지
    @GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "signup";
    }

    // 회원가입 post
    @PostMapping("/signup")
    public String signUp(UserVo userVo) {

        try {
            userServiceImpl.signUp(userVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/login";
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String toLoginPage(HttpSession session) {
        LoginResponse sn = (LoginResponse) session.getAttribute("userId");
        if (sn != null) { // 로그인된 상태
            return "redirect:/main";
        }
        return "login"; // 로그인되지 않은 상태
    }

    // 로그인 post
    @PostMapping("/login")
    public String login(UserVo userVo, ModelMap model, HttpSession session) {
        String mbr_id = userVo.getMbr_id();
        String mbr_password = userVo.getMbr_password();
        UserVo login = userServiceImpl.signin(userVo); //관리자 페이지용


        // 유효성 검사
        if (StringUtils.isEmpty(mbr_id) || StringUtils.isEmpty(mbr_password)) {
            model.addAttribute("message", "모든 정보를 입력해주세요");
            return "login";
        }

        LoginResponse loginResponse = userServiceImpl.login(userVo);

        //로그인하는 login매서드 사용
        if (!loginResponse.isSuccess()) {
            model.addAttribute("message", loginResponse.getMessage());
            return "login";
        } else {
            Integer mbrSn = userServiceImpl.getMbrSn(mbr_id, mbr_password);
            session.setAttribute("userSn", mbrSn);
            session.setAttribute("mbr_id", mbr_id);
            session.setAttribute("user", login); //관리자 페이지용
        }
        session.setAttribute("userId", loginResponse);
        return "redirect:/main";
    }

    // 로그아웃 post
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";
    }

    // 회원 정보 수정 페이지
    @GetMapping("/update")
    public String toUpdatePage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("userSn");
        UserVo userVo = userServiceImpl.getUserBySn(sn);
        model.addAttribute("user", userVo);
        return "update";
    }

    // 회원 정보 수정 post
    @PostMapping("/update")
    public String modifyInfo(HttpSession session, UserVo userVo) {
        Integer sn = (Integer) session.getAttribute("userSn");
        userVo.setMbr_sn(sn);
        userServiceImpl.modifyInfo(userVo);
        return "redirect:/mypage";
    }

    // 회원 탈퇴 post
    @PostMapping("/delete")
    public String withdraw(HttpSession session) {
        Integer sn = (Integer) session.getAttribute("userSn");
        if (sn != null) {
            userServiceImpl.withdraw(sn);
        }
        session.invalidate();
        return "redirect:/main";
    }

    //마이 페이지
    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("userSn");
        List<UserVo> userList = userServiceImpl.getUserList(sn);

        List<UserVo> userDonaDate = userServiceImpl.getUserDonaDate(sn);

        model.addAttribute("mypage", userList);
        model.addAttribute("userDonaDate", userDonaDate);
        return "mypage";
    }


    //아이디 중복체크
    @Autowired
    private UserService userService;

    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam(value = "mbr_id") String mbr_id) {

        int cnt = userService.idCheck(mbr_id);
        return cnt;

    }
}
