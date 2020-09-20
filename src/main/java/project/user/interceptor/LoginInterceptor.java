package project.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "LOGIN";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView mav) throws Exception{
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		System.out.println("로그인 인터쎕터"+mav);
		System.out.println("로그인 인터쎕터"+modelMap);
		Object userVO = modelMap.get("userVO");
		if(userVO != null) {
			System.out.println("Success!!!!");
			httpSession.setAttribute(LOGIN, userVO);
		System.out.println("httpSession.getAttribute(LOGIN)"+httpSession.getAttribute(LOGIN));
			response.sendRedirect("/");
			
		}
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception {
		HttpSession httpSession = request.getSession();
		System.out.println("넌 언제 다녀오는데??");
		if(httpSession.getAttribute(LOGIN) !=null) {
			httpSession.removeAttribute(LOGIN);
			System.out.println(LOGIN);
		}
		return true;
	}
	
	


}