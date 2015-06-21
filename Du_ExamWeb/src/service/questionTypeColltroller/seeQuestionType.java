package service.questionTypeColltroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionTypeBean;
import entity.QuestionType;

public class seeQuestionType extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		QuestionTypeBean qBean = new QuestionTypeBean();
		QuestionType qType = qBean.editQuestion(id);
		request.setAttribute("question", qType);
		request.getRequestDispatcher("/QuestionPages/SeeQuestion.jsp").forward(request, response);
	
	}

}
