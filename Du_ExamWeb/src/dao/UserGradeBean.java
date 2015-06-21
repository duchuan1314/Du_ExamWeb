package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.UserGrade;

public class UserGradeBean {
	public static final String mysqlusername = "root";
	public static final String mysqlpassword = "123456";
	public static final String classdriver = "com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/exam";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement psmt;
	private Statement st;
	public  UserGrade findUserGrade(int userId){
		UserGrade ug = null;
		try{
			Class.forName(classdriver);
			con = DriverManager.getConnection(url,mysqlusername,mysqlpassword);
			String sql = "select * from usergrade where userId = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, userId);
			rs = psmt.executeQuery();
			while(rs.next()){
				ug = new UserGrade();
				ug.setId(rs.getInt("id"));
				ug.setDanxuan(rs.getString("danxuan"));
				ug.setDuoxuan(rs.getString("duoxuan"));
				ug.setPanduan(rs.getString("panduan"));
				ug.setUserId(rs.getInt("userId"));
				ug.setDanxuan_grade(rs.getFloat("danxuan_grade"));
				ug.setDuoxuan_grade(rs.getFloat("duoxuan_grade"));
				ug.setPanduan_grade(rs.getShort("panduan_grade"));
				ug.setGrade(rs.getFloat("grade"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {con.close();psmt.close();} catch (Exception e2) {}
		}
		return ug;
	}
	public void updateUserGrade(UserGrade ug){
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url,mysqlusername,mysqlpassword);
			String sql = "update usergrade set danxuan=?,duoxuan=?,panduan=? where userId = ? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,ug.getDanxuan() );
			psmt.setString(2, ug.getDuoxuan());
			psmt.setString(3, ug.getPanduan());
			psmt.setInt(4, ug.getId());
			psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertUserGrade(UserGrade ug){
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url,mysqlusername,mysqlpassword);
			String sql = "insert into usergrade (danxuan,duoxuan,panduan,userId) values (?,?,?,?)  ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,ug.getDanxuan() );
			psmt.setString(2, ug.getDuoxuan());
			psmt.setString(3, ug.getPanduan());
			psmt.setInt(4, ug.getUserId());
			psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
