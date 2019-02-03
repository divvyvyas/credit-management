package credit_management;

import java.sql.*;
import java.io.*;
import java.util.*;

public class HelperDao
{
	Connection con;
	public Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credit", "root", "123456");
		return con;
	}
	
	public String addUser(String name, String college, String email, int age, int credit) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String msg="Record Added Successfully..!!";
		String qr="insert into user values(?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, name);
		ps.setString(2, college);
		ps.setString(3, email);
		ps.setInt(4, age);
		ps.setInt(5, credit);
		ps.executeUpdate();
		return msg;
	}
	
	public List<User> showUser() throws ClassNotFoundException, SQLException
	{
		con=getCon();
		List<User> list=new ArrayList<User>();
		String qr="select * from user";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		if(rs.next())
		{
			do
			{
				User u=new User();
				u.setName(rs.getString("name"));
				u.setCollege(rs.getString("college"));
				u.setEmail(rs.getString("email"));
				u.setAge(rs.getInt("age"));
				u.setCredit(rs.getInt("credit"));
				list.add(u);
			}while(rs.next());
		}
		return list;
	}
	
	public List<User> uProfile(String name) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		List<User> list=new ArrayList<User>();
		String qr="select * from user where name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, name);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			do
			{
				User u=new User();
				u.setName(rs.getString("name"));
				u.setCollege(rs.getString("college"));
				u.setEmail(rs.getString("email"));
				u.setAge(rs.getInt("age"));
				u.setCredit(rs.getInt("credit"));
				list.add(u);
			}while(rs.next());
		}
		return list;
	}
	
	public String updateUser(String name, String college, String email, int age) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String msg="Profile Updated Successfully..!!";
		String qr="update user set college=?, email=?, age=? where name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, college);
		ps.setString(2, email);
		ps.setInt(3, age);
		ps.setString(4, name);
		ps.executeUpdate();
		return msg;
	}
	
	public String deleteUser(String name) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String msg="Profile Deleted Successfully..!!";
		String qr="delete from user where name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, name);
		ps.executeUpdate();
		return msg;
	}
	
	public double checkCredit(String fname) throws ClassNotFoundException, SQLException
	{
		double a=0;
		con=getCon();
		String qr="select * from user where name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, fname);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			do
			{
				a=rs.getDouble("credit");
			}while(rs.next());
		}
		return a;
	}
	
	public boolean addCredit(String tname, double amount) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		double a=checkCredit(tname);
		amount=a+amount;
		String qr="update user set credit=? where name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setDouble(1, amount);
		ps.setString(2, tname);
		int i=0;
		i=ps.executeUpdate();
		if(i!=0)
			return true;
		else
			return false;
	}
	
	public String subCredit(String fname, double amount) throws ClassNotFoundException, SQLException
	{
		String msg="Transaction Successful..!!";
		double a=checkCredit(fname);
		amount=a-amount;
		String qr="update user set credit=? where name=?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setDouble(1, amount);
		ps.setString(2, fname);
		ps.executeUpdate();
		return msg;
	}
	
	public String pay(String fname, String tname, double amount) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String msg=null;
		if(amount>=checkCredit(fname))
		{
			return "Insufficient Credit..!!";
		}
		else if(addCredit(tname, amount))
		{
			msg=subCredit(fname, amount);
			return msg;
		}
		else
		{
			return "User Name is Incorrect..!!";
		}
	}
	
	public void addTransfer(String fname, String tname, double amount) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="insert into transfer(fname, tname, amount) values(?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, fname);
		ps.setString(2, tname);
		ps.setDouble(3, amount);
		ps.executeUpdate();
		con.close();
	}
	
	public List<Transfer> records() throws ClassNotFoundException, SQLException
	{
		con=getCon();
		List<Transfer> list=new ArrayList<Transfer>();
		String qr="select * from transfer order by dt desc";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		if(rs.next())
		{
			do
			{
				Transfer t=new Transfer();
				t.setFname(rs.getString("fname"));
				t.setTname(rs.getString("tname"));
				t.setAmount(rs.getDouble("amount"));
				t.setDt(rs.getTimestamp("dt"));
				list.add(t);
			}while(rs.next());
		}
		return list;
	}
}