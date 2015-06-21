package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.QuestionKuEntity;


public class QuestionKuBean {
	public static final String mysqlusername = "root";
	public static final String mysqlpassword = "123456";
	public static final String classdriver = "com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/exam";
	
	private Connection con;
	private ResultSet rs;
	private PreparedStatement psmt;
	private Statement st;
	//获得当前页面的所有用户
	public List<QuestionKuEntity> getAllQuestionDatils(int currentPageNum){
		int beginPageNum = (currentPageNum-1)*6;
		int pageSize = 6;
		List<QuestionKuEntity> questionKuEntities = new ArrayList<QuestionKuEntity>();
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "select * from questionKu limit ?,?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, beginPageNum);
			psmt.setInt(2, pageSize);
			rs = psmt.executeQuery();
			QuestionKuEntity qkEntity = null;
			while (rs.next()) {
				qkEntity = new QuestionKuEntity();
				qkEntity.setId(rs.getInt("id"));
				qkEntity.setType_Code(rs.getInt("type_Code"));
				qkEntity.setQuestionName(rs.getString("questionName"));
				qkEntity.setOptionA(rs.getString("optionA"));
				qkEntity.setOptionB(rs.getString("optionB"));
				qkEntity.setOptionC(rs.getString("optionC"));
				qkEntity.setOptionD(rs.getString("optionD"));
				qkEntity.setAnswer(rs.getString("answer"));
				qkEntity.setComment(rs.getString("comment"));
				questionKuEntities.add(qkEntity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionKuEntities;
	}
	
	//获取记录数,得出页数
		public int getPageCount() {
			int total = 0;
			int pageCounts = 0;
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "select count(*) from questionKu";
				st = con.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next()) {
					total = rs.getInt(1);//或得总记录数
					pageCounts = (total - 1) / 6 + 1;//计算页数
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {con.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return pageCounts;
		}
		public void deleteQuetionKu(int id){
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "delete from questionKu where id=?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, id);
				psmt.execute();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {con.close();psmt.close();} catch (SQLException e) {e.printStackTrace();}
			}
		}
		public void addQuestionKu(int type_Code,String questionName,String optionA,String optionB,String optionC,String optionD,String answer,String comment){
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "insert into questionKu (type_Code,questionName,optionA,optionB,optionC,optionD,answer,comment) values(?,?,?,?,?,?,?,?)";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, type_Code);
				psmt.setString(2, questionName);
				psmt.setString(3, optionA);
				psmt.setString(4, optionB);
				psmt.setString(5, optionC);
				psmt.setString(6, optionD);
				psmt.setString(7, answer);
				psmt.setString(8, comment);
				psmt.execute();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{try{con.close();psmt.close();}catch(Exception e){e.printStackTrace();}}
		}
		// 通过id获取要编辑的哪一行的值
		public QuestionKuEntity EditQuestionDatils(int id){
			QuestionKuEntity qkEntity = null;
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "select * from questionKu where id=?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, id);
				rs = psmt.executeQuery();
				while (rs.next()) {
					qkEntity = new QuestionKuEntity();
					qkEntity.setId(rs.getInt("id"));
					qkEntity.setType_Code(rs.getInt("type_Code"));
					qkEntity.setQuestionName(rs.getString("questionName"));
					qkEntity.setOptionA(rs.getString("optionA"));
					qkEntity.setOptionB(rs.getString("optionB"));
					qkEntity.setOptionC(rs.getString("optionC"));
					qkEntity.setOptionD(rs.getString("optionD"));
					qkEntity.setAnswer(rs.getString("answer"));
					qkEntity.setComment(rs.getString("comment"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{try {con.close();psmt.close();} catch (SQLException e) {e.printStackTrace();}}
			return qkEntity;
		}
		public void EditQuestionDatils2(int id,int type_Code,String questionName,String optionA,String optionB,String optionC,String optionD,String answer,String comment){
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "update questionKu set type_Code=?,questionName=?,optionA=?,optionB=?,optionC=?,optionD=?,answer=?,comment=? where id=?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, type_Code);
				psmt.setString(2, questionName);
				psmt.setString(3, optionA);
				psmt.setString(4, optionB);
				psmt.setString(5, optionC);
				psmt.setString(6, optionD);
				psmt.setString(7, answer);
				psmt.setString(8, comment);
				psmt.setInt(9, id);
				psmt.execute();
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{try {con.close();psmt.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		//TestExam
		public List<QuestionKuEntity> getExamQuestions(int typeCode,int questionNum){
			List<QuestionKuEntity> questionKuEntities = new ArrayList<QuestionKuEntity>();
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "select * from questionKu where type_Code = ? limit 0,?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, typeCode);
				psmt.setInt(2, questionNum);
				rs = psmt.executeQuery();
				QuestionKuEntity qkEntity = null;
				while (rs.next()) {
					qkEntity = new QuestionKuEntity();
					qkEntity.setId(rs.getInt("id"));
					qkEntity.setType_Code(rs.getInt("type_Code"));
					qkEntity.setQuestionName(rs.getString("questionName"));
					qkEntity.setOptionA(rs.getString("optionA"));
					qkEntity.setOptionB(rs.getString("optionB"));
					qkEntity.setOptionC(rs.getString("optionC"));
					qkEntity.setOptionD(rs.getString("optionD"));
					qkEntity.setAnswer(rs.getString("answer"));
					qkEntity.setComment(rs.getString("comment"));
					questionKuEntities.add(qkEntity);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return questionKuEntities;
		}
}
