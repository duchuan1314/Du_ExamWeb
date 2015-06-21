package service.questionKuController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionKuBean;
import dao.QuestionTypeBean;
import dao.UserGradeBean;
import entity.QuestionKuEntity;
import entity.QuestionType;
import entity.User;
import entity.UserGrade;

public class StartTestServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserGrade ug = new UserGrade();
		UserGradeBean ugb = new UserGradeBean();
		QuestionTypeBean qtb = new QuestionTypeBean();
		QuestionKuBean qkb = new QuestionKuBean();
		List<QuestionType> questionTypes = new ArrayList<QuestionType>();
		questionTypes = qtb.ListAllQuestion();
		User user = (User) request.getSession().getAttribute("user");
		ug = ugb.findUserGrade(Integer.parseInt(user.getId()));
		String danxuan = "";
		String duoxuan="";
		String panduan="";
		for(QuestionType questionType : questionTypes){
			List<QuestionKuEntity> questions = new ArrayList<QuestionKuEntity>();
			questions = qkb.getExamQuestions(questionType.getTypeCode(), questionType.getQuestionNum());
			questionType.setQuestions(questions);
			if(questionType.getTypeName().equals("单选题")){
				for(QuestionKuEntity questionKuEntity : questions){
					danxuan += questionKuEntity.getId()+";";
				}
			}else if(questionType.getTypeName().equals("多选题")){
				for(QuestionKuEntity questionKuEntity : questions){
					duoxuan += questionKuEntity.getId()+";";
				}
				}else if(questionType.getTypeName().equals("判断题")){
					for (QuestionKuEntity questionKuEntity : questions) {
						panduan += questionKuEntity.getId()+";";
					}
				}
			}
		if(ug != null){
			ug.setId(ug.getId());
			ug.setDanxuan(danxuan);
			ug.setDuoxuan(duoxuan);
			ug.setPanduan(panduan);
			ugb.updateUserGrade(ug);
		}else{
			ug = new UserGrade();
			ug.setUserId(Integer.parseInt(user.getId()));
			ug.setDanxuan(danxuan);
			ug.setDuoxuan(duoxuan);
			ug.setPanduan(panduan);
			ugb.insertUserGrade(ug);
		}
		request.setAttribute("questionTypes", questionTypes);
		request.getRequestDispatcher("/userPages/startTest.jsp").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
