package ezen.dev.spring.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter{

		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception{
			HttpSession session = request.getSession();
			
			Object obj = session.getAttribute("midx");
			
			if(obj==null) {
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='/spring/login.do';</script>");
				out.flush();

				return false;
			}
			
			return true;
			
		}
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {

	        super.postHandle(request, response, handler, modelAndView);
	    }
}