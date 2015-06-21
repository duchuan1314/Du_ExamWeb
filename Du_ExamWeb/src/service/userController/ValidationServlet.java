package service.userController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserBean;

public class ValidationServlet extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		UserBean ub = new UserBean();
			try {
				if(ub.login2(username)){
					out.print("1");
				}else{
					out.print("2");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.flush();   
			out.close();
		}
	}


