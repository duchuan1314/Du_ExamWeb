package service.questionKuController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionKuBean;

public class addQuestionKuServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type_Code = request.getParameter("type_Code");
		String questionName = request.getParameter("questionName");
		String optionA = request.getParameter("optionA");
		String optionB = request.getParameter("optionB");
		String optionC = request.getParameter("optionC");
		String optionD = request.getParameter("optionD");
		String answer = request.getParameter("answer");
		String comment = request.getParameter("comment");
		QuestionKuBean qBean = new QuestionKuBean();
		qBean.addQuestionKu(Integer.parseInt(type_Code), questionName, optionA, optionB, optionC, optionD, answer, comment);
		request.getRequestDispatcher("ListAllQuestionKuDatil?pageNum=1").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
