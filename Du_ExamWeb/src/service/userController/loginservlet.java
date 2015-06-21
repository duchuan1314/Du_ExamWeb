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

public class loginservlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserBean ub = new UserBean();
		String username2 = request.getParameter("username");
		String password2 = request.getParameter("password");
		String usertype = request.getParameter("usertype");
		String currentPageNum = request.getParameter("pageNum");
		String forward = "";
		int currentPage = 1;
		try {
			User users = ub.login(username2, password2);
			if (users != null) {
				if (usertype.equals("1")) {
					if (users.getType_in() == 1) {
						java.util.List<User> users2 = new ArrayList<User>();
						users2 = ub.getUserList(Integer.parseInt(currentPageNum));
						QuestionTypeBean questionTypeBean = new QuestionTypeBean();
						int endpageNum = questionTypeBean.getPageCount();
						int endPagenum = ub.getPageCount();
						int endpageNum2 = ub.getPageCount();
						request.setAttribute("user2", users2);
						request.setAttribute("currentPage", currentPage);
						request.setAttribute("endPagenum", endPagenum);
						request.setAttribute("endpageNum2", endpageNum2);
						request.setAttribute("endpageNum", endpageNum);
						forward = "/userPages/admin.jsp";
					} else {
						forward = "/userPages/wrong.jsp";
					}
				} else if (usertype.equals("2")) {
					if (users.getType_in() == 2) {
						java.util.List<User> users3 = new ArrayList<User>();
						users3 = ub.getall2(username2);
						User user = new User();
						user = ub.finduser(username2);
						request.getSession().setAttribute("user", user);
						request.setAttribute("user3", users3);
						forward = "/userPages/commonuser.jsp";
					} else {
						forward = "/userPages/wrong.jsp";
					}
				}
			} else {
				forward = "/userPages/wrong.jsp";
			}
			RequestDispatcher dispatcher = request
					.getRequestDispatcher(forward);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
