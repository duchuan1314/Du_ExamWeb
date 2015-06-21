package service.questionTypeColltroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionTypeBean;

public class editQuestionType2 extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String questionName = request.getParameter("qname");
		String questionCode = request.getParameter("qnumber");
		String pageNum = request.getParameter("pageNum");
		String id = request.getParameter("id");
		QuestionTypeBean qbBean = new QuestionTypeBean();
		qbBean.editQuestion2(id, questionCode, questionName);
		request.getRequestDispatcher("ListAllQuestion?pageNum="+pageNum).forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
