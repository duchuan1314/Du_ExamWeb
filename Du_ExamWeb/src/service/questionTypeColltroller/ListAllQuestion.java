package service.questionTypeColltroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionTypeBean;
import entity.QuestionType;

public class ListAllQuestion extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String currentPageNum = request.getParameter("pageNum");
		QuestionTypeBean qBean = new QuestionTypeBean();
		int endpageNum = qBean.getPageCount();
		int endpageNum2 =qBean.getPageCount();
		List<QuestionType> questions = qBean.getQuestionList(Integer.parseInt(currentPageNum));
		request.setAttribute("question", questions);
		request.setAttribute("currentPage", currentPageNum);
		request.setAttribute("endpageNum", endpageNum);
		request.setAttribute("endpageNum2", endpageNum2);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/QuestionPages/questionPage.jsp");
		dispatcher.forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
