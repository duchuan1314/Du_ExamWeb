package entity;

public class UserGrade {
	private int id;
	private int userId;
	private String danxuan;
	private String duoxuan;
	private String panduan;
	private float danxuan_grade;
	private float duoxuan_grade;
	private float panduan_grade;
	private float grade;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDanxuan() {
		return danxuan;
	}
	public void setDanxuan(String danxuan) {
		this.danxuan = danxuan;
	}
	public String getDuoxuan() {
		return duoxuan;
	}
	public void setDuoxuan(String duoxuan) {
		this.duoxuan = duoxuan;
	}
	public String getPanduan() {
		return panduan;
	}
	public void setPanduan(String panduan) {
		this.panduan = panduan;
	}
	public float getDanxuan_grade() {
		return danxuan_grade;
	}
	public void setDanxuan_grade(float danxuan_grade) {
		this.danxuan_grade = danxuan_grade;
	}
	public float getDuoxuan_grade() {
		return duoxuan_grade;
	}
	public void setDuoxuan_grade(float duoxuan_grade) {
		this.duoxuan_grade = duoxuan_grade;
	}
	public float getPanduan_grade() {
		return panduan_grade;
	}
	public void setPanduan_grade(float panduan_grade) {
		this.panduan_grade = panduan_grade;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}

}
