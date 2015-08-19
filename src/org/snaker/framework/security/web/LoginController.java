package org.snaker.framework.security.web;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.moon.s2sh.service.MainService;
import org.snaker.framework.security.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 系统登录Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
public class LoginController {
	private static Log log = LogFactory.getLog(LoginController.class);
	private MainService ms = new MainService();
	@RequestMapping(value = "/login" ,method = RequestMethod.POST)
	public String login(User user, Model model, HttpServletRequest request) {
		log.info("Login user=====" + user);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
		String remember = WebUtils.getCleanParam(request, "remember");
		log.info("remember=" + remember);
		try {
		    	if(remember != null && remember.equalsIgnoreCase("on")) {
		    	    token.setRememberMe(true);
		    	}
			subject.login(token);
		
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			JSONObject jsonObj = new JSONObject();
			jsonObj = ms.getMenuToHtm(user.getUsername(), "0", basePath, user.getUsername());	
			request.getSession().setAttribute("strSub", jsonObj.getString("strSub"));
			request.getSession().setAttribute("menuLen", jsonObj.getInt("menuLen"));//
			request.getSession().setAttribute("userName", user.getUsername());
			request.getSession().setAttribute("user_id", user.getUsername());
		 		 
			return "redirect:/index";
		} catch(UnknownAccountException ue) {
			token.clear();
			model.addAttribute("error", "登录失败，您输入的账号不存在");
			return "security/login";
		} catch(IncorrectCredentialsException ie) {
			token.clear();
			model.addAttribute("username", user.getUsername());
			model.addAttribute("error", "登录失败，密码不匹配");
			return "security/login";
		} catch(RuntimeException re) {
			token.clear();
			model.addAttribute("username", user.getUsername());
			model.addAttribute("error", "登录失败");
			return "security/login";
		}
	}
	
	@RequestMapping(value = "/login" ,method = RequestMethod.GET)
	public String loginForm() {
		return "security/login";
	}
}
