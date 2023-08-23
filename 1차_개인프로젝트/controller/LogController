package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import member.dao.MemberDao;
import member.model.Member;
import member.service.AjaxService;
import member.service.ChangePasswordService;
import member.service.DuplicateIdException;
import member.service.InvalidPasswordException;
import member.service.JoinRequest;
import member.service.JoinService;
import member.service.MemberNotFoundException;

//join.do=member.command.JoinHandler
//login.do=auth.command.LoginHandler
//logout.do=auth.command.LogoutHandler
//changePwd.do=member.command.ChangePasswordHandler

@Controller
public class LogController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ChangePasswordService changePwdSvc;
	
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private AjaxService ajaxService;
	

	
	@GetMapping("/login.do")
	public String login1() {
		return "loginForm";
		
	}
	@PostMapping("/login.do")
	public String login2(Model model, @RequestParam String id, 
			                     @RequestParam String password,
			                     HttpServletRequest request) {


		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if (password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);

		if (!errors.isEmpty()) {
			return "loginForm";
		}

		try {
			User user = loginService.login(id, password);
			request.getSession().setAttribute("authUser", user);
			return "redirect:/index.jsp";
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "loginForm";
		}
		
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/index.jsp";
	}
	
	@GetMapping("/changePwd.do")
	public String changePwd1() {
		return "changePwdForm";
	}
	

	
	
	@PostMapping("/changePwd.do")
	@ResponseBody
	public String changePassword(@RequestParam String curPwd, @RequestParam String newPwd, HttpSession session) {
	    User user = (User) session.getAttribute("authUser"); // 로그인된 사용자 정보

	    Member storedMember = memberDao.selectById(user.getId());

	    if (!storedMember.matchPassword(curPwd)) {
	        return "badCurPwd"; // 현재 비밀번호 불일치 시 에러 반환
	    }

	    try {
	        changePwdSvc.changePassword(user.getId(), curPwd, newPwd);
	        return "success"; // 비밀번호 변경 성공 시 성공 반환
	    } catch (InvalidPasswordException e) {
	        return "error"; // 비밀번호 변경 실패 시 에러 반환
	    } catch (MemberNotFoundException e) {
	        return "error"; // 사용자 정보를 찾을 수 없을 때 에러 반환
	    }
	}




	
	
	
	
	
	@GetMapping("/join.do")
	public String join1() {
		return "joinForm";
	}

	@PostMapping("/join.do")
	public String join2(HttpServletRequest req, Model model) {
		JoinRequest joinReq = new JoinRequest();
		joinReq.setId(req.getParameter("id"));
		joinReq.setName(req.getParameter("name"));
		joinReq.setPassword(req.getParameter("password"));
		joinReq.setConfirmPassword(req.getParameter("confirmPassword"));
		
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return "joinForm";
		}
		
		try {
			joinService.join(joinReq);
			return "joinSuccess";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return "joinForm";
		}
	}
	
    @RequestMapping(value = "/checkId.do", method = { RequestMethod.POST })
    @ResponseBody
    public Map<String, String> checkId(@RequestParam("id") String id) {
        Map<String, String> result = new HashMap<>();
        
        int flag = ajaxService.checkId(id);
        
        if (flag == 1) {
            result.put("status", "Y");
        } else {
            result.put("status", "N");
        }
        
        return result;
    }




}
