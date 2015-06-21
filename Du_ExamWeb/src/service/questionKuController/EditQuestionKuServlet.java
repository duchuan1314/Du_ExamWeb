package service.questionKuController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionKuBean;
import entity.QuestionKuEntity;

public class EditQuestionKuServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		QuestionKuBean qBean = new QuestionKuBean();
		QuestionKuEntity qentities = new QuestionKuEntity();
		qentities = qBean.EditQuestionDatils(Integer.parseInt(id));
		request.setAttribute("questionDatils2", qentities);
		request.getRequestDispatcher("/questionKuPages/editQuestionKu.jsp").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
