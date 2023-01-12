package com.example.water_web.Service;

import com.example.water_web.Mapper.UserMapper;
import com.example.water_web.Vo.LoginResponse;
import com.example.water_web.Vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;

    public List<UserVo> getUserList(Integer sn) {
        return userMapper.getUserList(sn);
    }

    public List<UserVo> getUserDonaDate(Integer sn) {
        return userMapper.getUserDonaDate(sn);
    }

    public UserVo getUserBySn(Integer mbr_sn) {
        return userMapper.getUserBySn(mbr_sn);
    }

    //암호화 적용
    public void signUp(UserVo userVo) {
        String mbr_id = userVo.getMbr_id();
        String mbr_password = userVo.getMbr_password();
        String enc = encryptPassword(mbr_password, mbr_id);

        userVo.setMbr_password(enc);
        userVo.setMbr_id(mbr_id);
        userVo.setRgtr_id(mbr_id);
        userVo.setRgtr_dt(LocalDateTime.now());

        userMapper.insertUser(userVo);
    }
    public LoginResponse login(UserVo userVo) {
        UserVo loginMember = userMapper.getUserByEmail(userVo);
        LoginResponse loginResponse = new LoginResponse();

        try {
            // 회원정보 없는 경우
            if (loginMember == null) {
                loginResponse.setSuccess(false);
                loginResponse.setMessage("회원정보가 없습니다.");
                return loginResponse;
            }
            // 잠금 처리된 회원인 경우
            if(loginMember.getLock_yn().equals("Y")) {
                loginResponse.setSuccess(false);
                loginResponse.setMessage("잠금 처리된 계정입니다. 관리자에게 문의하시오.");
                return loginResponse;
            }
            // 비밀번호가 틀린 경우
            if (!comparePassword(userVo.getMbr_password(), loginMember.getMbr_password(), userVo.getMbr_id())) {
                int failCnt = loginMember.getFail_cnt();
                loginMember.setFail_cnt(failCnt + 1);

                if(loginMember.getFail_cnt() >= 5) {
                    loginMember.setLock_yn("Y");
                }

                userMapper.lockMemberLogin(loginMember);

                loginResponse.setSuccess(false);
                loginResponse.setMessage("비밀번호가 틀렸습니다.");
                return loginResponse;
            }
            // 로그인 성공
            loginMember.setFail_cnt(0);
            loginMember.setLock_yn("N");

            userMapper.lockMemberLogin(loginMember);

            loginResponse.setLoginMember(loginMember);
            loginResponse.setSuccess(true);
        } catch ( Exception e){
            e.printStackTrace();
        }
        return loginResponse;
    }
    @Override
    public Integer getMbrSn(String mbr_id, String password) {
        UserVo userVo = userMapper.getUserById(mbr_id);
        UserVo loginMember = userMapper.getUserByEmail(userVo);
        LoginResponse loginResponse = new LoginResponse();

        userMapper.updateUser(loginMember);
        loginResponse.setLoginMember(loginMember);
        loginResponse.setSuccess(true);

        if (false == loginResponse.isSuccess()) {
            return 0;
        }
        return userVo.getMbr_sn();
    }
    public void modifyInfo(UserVo userVo) {
        String mbr_id = userVo.getMbr_id();
        String mbr_password = userVo.getMbr_password();
        String enc = encryptPassword(mbr_password, mbr_id);
        userVo.setMbr_password(enc);
        userVo.setMbr_id(mbr_id);
        userMapper.updateUser(userVo);
    }
    public void withdraw(int mbr_sn) {
        userMapper.deleteUser(mbr_sn);
    }

    // 비밀번호 암호화
    public static String encryptPassword(String mbr_password, String id) {
        if (mbr_password == null) return "";
        if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)

        byte[] hashValue = null; // 해쉬값

        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        md.reset();
        md.update(id.getBytes());

        hashValue = md.digest(mbr_password.getBytes());

        return new String(Base64.encodeBase64(hashValue));
    }

    // 비밀번호 암호화 상태로 로그인
    public static boolean comparePassword(String mbr_password, String encryptPassword, String mbr_id) {
        return encryptPassword(mbr_password, mbr_id).equals(encryptPassword);
    }

    @Autowired
    private UserMapper mapper;

    //아이디 중복체크 mapper 접근
    @Override
    public int idCheck(String mbr_id) {
        int cnt = mapper.idCheck(mbr_id);
//        System.out.println("cnt: " + cnt);
        return cnt;
    }

    //관리자 페이지용
    @Override
    public UserVo signin(UserVo userVo) {
        return mapper.signin(userVo);
    }
}
