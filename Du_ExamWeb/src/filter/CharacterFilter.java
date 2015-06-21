package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterFilter implements Filter {

	public void destroy() {

	}
	private String encoding;
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 设置字符集
		response.setCharacterEncoding(encoding);
		response.setContentType("text/html;encoding="+encoding);
		// 继续向下执行，如果还有其他filter继续调用其他filter，没有的话将消息发送给服务器或客户端
		chain.doFilter(request, response);

	}

	public void init(FilterConfig arg0) throws ServletException {

	}
}
