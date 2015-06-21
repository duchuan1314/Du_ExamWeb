package service.userController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserBean;

public class ConfirmEditUserServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		     request.setCharacterEncoding("utf-8");
		     String username = request.getParameter("username");
		     String password = request.getParameter("password");
		     String type_in = request.getParameter("usertype");
		     String id = request.getParameter("id");
             UserBean ub = new UserBean();
             try {
				boolean b = ub.updataUser(username, password, Integer.parseInt(type_in), Integer.parseInt(id));
				RequestDispatcher dispatcher = request.getRequestDispatcher("Listall");
				dispatcher.forward(request, response);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
