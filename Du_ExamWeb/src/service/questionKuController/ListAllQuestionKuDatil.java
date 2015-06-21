package service.questionKuController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionKuBean;
import entity.QuestionKuEntity;

public class ListAllQuestionKuDatil extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QuestionKuBean qBean = new QuestionKuBean();
		int endPageNum = qBean.getPageCount();
		int endpageNum2 = qBean.getPageCount();
		String currentPage = request.getParameter("pageNum");
		List<QuestionKuEntity> questionEntities = qBean.getAllQuestionDatils(Integer.parseInt(currentPage));
		request.setAttribute("questionkuDatils2", questionEntities);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("endpageNum2", endpageNum2);
		request.getRequestDispatcher("/questionKuPages/ListQuestionKu.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
