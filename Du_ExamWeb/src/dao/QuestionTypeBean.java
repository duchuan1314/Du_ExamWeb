package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.QuestionType;


public class QuestionTypeBean {
	public static final String mysqlusername = "root";
	public static final String mysqlpassword = "123456";
	public static final String classdriver = "com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/exam";
	
	private Connection con;
	private ResultSet rs;
	private PreparedStatement psmt;
	private Statement st;
	public List<QuestionType> ListAllQuestion() {
		QuestionType qType = null;
		List<QuestionType> questions = new ArrayList<QuestionType>();
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "select * from questionstype ";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				qType = new QuestionType();
				qType.setId(rs.getInt("id"));
				qType.setTypeCode(Integer.parseInt(rs.getString("type_Code")));
				qType.setTypeName(rs.getString("type_name"));
				qType.setQuestionNum(rs.getInt("questionNum"));
				qType.setGrade(rs.getFloat("grade"));
				questions.add(qType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questions;
	}
	public boolean addQuestion(int typeCode,String typeName){
		boolean b = false;
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "insert into questionstype (type_Code,type_name) values (?,?)"+";";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, typeCode);
			psmt.setString(2, typeName);
			 b = psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public boolean deleteQuestion(String id){
		boolean b = false;
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "delete from questionstype where id = ?"+";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			 b = psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public QuestionType editQuestion(String id){
		QuestionType qType = null;
		try {
			qType = new QuestionType();
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "select * from questionstype where id = ?"+";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();;
			while(rs.next()){
			qType.setId(rs.getInt("id"));
			qType.setTypeCode(rs.getInt("type_Code"));
			qType.setTypeName(rs.getString("type_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qType;
	}
	public QuestionType editQuestion2(String id,String typeCode,String typeName){
		QuestionType qType = null;
		try {
			qType = new QuestionType();
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "update questionstype set type_Code = ? ,type_name = ? where id = ?"+";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,typeCode );
			psmt.setString(2, typeName);
			psmt.setString(3, id);
			 psmt.execute();;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qType;
	}
	//获取记录数,得出页数
		public int getPageCount() {
			int total = 0;
			int pageCounts = 0;
			try {
				Class.forName(classdriver);
				con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
				String sql = "select count(*) from questionstype";
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
		//获得每一页的记录数
		public List<QuestionType> getQuestionList(int currentPageNum){
			int beginPageNum = (currentPageNum-1)*6;
			int pageSize = 6;
			List<QuestionType> questions = new ArrayList<QuestionType>();
			try{
			Class.forName(classdriver);
			con = DriverManager.getConnection(url,mysqlusername,mysqlpassword);
			String sql = "select * from questionstype limit ?,?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, beginPageNum);
			psmt.setInt(2, pageSize);
			rs = psmt.executeQuery();
			while(rs.next()){
				QuestionType questionType = new QuestionType();
				questionType.setTypeCode(rs.getInt("type_Code"));
				questionType.setTypeName(rs.getString("type_name"));
				questionType.setId(rs.getInt("id"));
				questions.add(questionType);
			}
			}catch(Exception e){
				e.printStackTrace();
			}finally{try{con.close();psmt.close();}catch(Exception e){e.printStackTrace();}}
			return questions;
		}
}
