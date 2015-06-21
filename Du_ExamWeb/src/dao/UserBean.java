package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.User;


public class UserBean {
	public static final String mysqlusername = "root";
	public static final String mysqlpassword = "123456";
	public static final String classdriver = "com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/exam";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement psmt;
	private Statement st;

	public User login(String username, String password) throws Exception {
		User user = null;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user WHERE username=? AND password=?"
					+ ";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, username);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setType_in(rs.getInt("type_in"));
				user.setId(rs.getString("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
			psmt.close();
		}
		return user;
	}

	public boolean login2(String username) throws Exception {
		boolean b = true;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user WHERE username=?" + ";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, username);
			rs = psmt.executeQuery();
			while (rs.next()) {
				b = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
			psmt.close();
		}
		return b;
	}

	public java.util.List<User> getall1() throws SQLException {
		User user = null;
		java.util.List<User> users = new ArrayList<User>();
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user WHERE type_in = " + 2 + ";";
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setType_in(rs.getInt("type_in"));
				user.setId(rs.getString("id"));
				user.setHave_in(rs.getString("have_in"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
		}
		return users;
	}

	public java.util.List<User> getall2(String username2) throws SQLException {
		User user = null;
		java.util.List<User> users2 = new ArrayList<User>();
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user WHERE username=" + "'"
					+ username2 + "'" + ";";
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setType_in(rs.getInt("type_in"));
				user.setId(rs.getString("id"));
				user.setHave_in(rs.getString("have_in"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				users2.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
		}
		return users2;
	}

	public java.util.List<User> getall3() throws SQLException {
		User user = null;
		java.util.List<User> users2 = new ArrayList<User>();
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user";
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setType_in(rs.getInt("type_in"));
				user.setId(rs.getString("id"));
				user.setHave_in(rs.getString("have_in"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				users2.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
		}
		return users2;
	}

	public boolean addUser(String username, String password, String type_in,String have_in)
			throws Exception {
		boolean b = true;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "insert into user(username,password,type_in,have_in) values (?,?,?,?)"+ ";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, username);
			psmt.setString(2, password);
			psmt.setString(3, type_in);
			psmt.setString(4, have_in);
			b = psmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			psmt.close();
		}
		return b;
	}

	public boolean delUser(int id) throws Exception {
		boolean b = false;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "delete from user where id=?" + ";";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, id);
			b = psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			psmt.close();
		}
		return b;
	}

	public User getall4(int id) throws SQLException {
		User user = null;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user WHERE id=" + "'" + id + "'" + ";";
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setType_in(rs.getInt("type_in"));
				user.setId(rs.getString("id"));
				user.setHave_in(rs.getString("have_in"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
		}
		return user;
	}

	public boolean updataUser(String username, String password, int type_in,
			int id) throws Exception {
		boolean b = false;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "update user set username=?,password=?,type_in=? where id=?"+ ";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, username);
			psmt.setString(2, password);
			psmt.setInt(3, type_in);
			psmt.setInt(4, id);
			b = psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			psmt.close();
		}
		return b;
	}
//获取记录数,得出页数
	public int getPageCount() {
		int total = 0;
		int pageCounts = 0;
		try {
			Class.forName(classdriver);
			con = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "select count(*) from user";
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
	public List<User> getUserList(int currentPageNum){
		int beginPageNum = (currentPageNum-1)*6;
		int pageSize = 6;
		List<User> users = new ArrayList<User>();
		try{
		Class.forName(classdriver);
		con = DriverManager.getConnection(url,mysqlusername,mysqlpassword);
		String sql = "select * from user limit ?,?";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, beginPageNum);
		psmt.setInt(2, pageSize);
		rs = psmt.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setType_in(rs.getInt("type_in"));
			user.setHave_in(rs.getString("have_in"));
			user.setId(rs.getString("id"));
			users.add(user);
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{try{con.close();psmt.close();}catch(Exception e){e.printStackTrace();}}
		return users;
	}
	//startExam
	public User finduser(String username) throws Exception {
		User user = null;
		try {
			Class.forName(classdriver);
			con = DriverManager
					.getConnection(url, mysqlusername, mysqlpassword);
			String sql = "SELECT * FROM user WHERE username=?"+ ";";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, username);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setType_in(rs.getInt("type_in"));
				user.setId(rs.getString("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
			psmt.close();
		}
		return user;
	}
}
