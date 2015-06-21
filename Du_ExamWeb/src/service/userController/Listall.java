package service.userController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionTypeBean;
import dao.UserBean;
import entity.User;

public class Listall extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentPage = 1;
		String currentpage = request.getParameter("pageNum");
		if (currentpage != null) {
			currentPage = Integer.parseInt(currentpage);
		}
		try {
			request.setCharacterEncoding("utf-8");
			UserBean ub = new UserBean();
			int endPagenum = ub.getPageCount();
			QuestionTypeBean questionTypeBean = new QuestionTypeBean();
			int endpageNum = questionTypeBean.getPageCount();
			int endpageNum2 = ub.getPageCount();
			String forward = "";
			java.util.List<User> users2 = new ArrayList<User>();
			users2 = ub.getUserList(currentPage);
			request.setAttribute("user2", users2);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("endPagenum", endPagenum);
			request.setAttribute("endpageNum", endpageNum);
			request.setAttribute("endpageNum2", endpageNum2);
			forward = "/userPages/admin.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
