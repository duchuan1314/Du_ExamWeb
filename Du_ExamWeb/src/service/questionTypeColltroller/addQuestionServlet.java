package service.questionTypeColltroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionTypeBean;

public class addQuestionServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String qnumber = request.getParameter("qnumber");
		String qname = request.getParameter("qname");
		QuestionTypeBean qBean = new QuestionTypeBean();
		boolean b = qBean.addQuestion(Integer.parseInt(qnumber), qname);
			request.getRequestDispatcher("ListAllQuestion").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
