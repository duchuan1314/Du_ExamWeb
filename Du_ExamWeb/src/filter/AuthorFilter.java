package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;


public class AuthorFilter implements Filter{

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		String path = req.getServletPath();
		System.out.println(path);
		User user = (User)req.getSession().getAttribute("user2");
		System.out.println(user);
		if(user != null || path.equals("/Mypages/Home.jsp") || path.equals("/loginservlet")){
			chain.doFilter(request, response);
			return;
		}else{
			resp.sendRedirect(req.getContextPath()+"/Mypages/Home.jsp");
			return;
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
