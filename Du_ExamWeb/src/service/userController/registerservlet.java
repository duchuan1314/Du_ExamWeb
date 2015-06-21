package service.userController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserBean;

public class registerservlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type_in = request.getParameter("usertype");
		String have_in = request.getParameter("have_in");
		UserBean ub = new UserBean();
		try {
			ub.addUser(username, password, type_in,have_in);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Listall");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
