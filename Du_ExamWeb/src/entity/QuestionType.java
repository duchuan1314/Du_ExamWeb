package entity;

import java.util.List;

public class QuestionType {
	private Integer id;
	private int typeCode;
	private String typeName;
	private float grade;
	private int questionNum;
	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	private List<QuestionKuEntity> questions;

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public List<QuestionKuEntity> getQuestions() {
		return questions;
	}

	public void setQuestions(List<QuestionKuEntity> questions) {
		this.questions = questions;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
