
import java.sql.*;
import java.util.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import credit_management.*;

@WebServlet("/OperateServlet")
public class OperateServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		HelperDao hp=new HelperDao();
		String ch=request.getParameter("operate");
		String name, college, email, msg;
		int age, credit;
		List<User> list;
		List<Transfer> t;
		RequestDispatcher rd;
		
		try
		{
			switch (ch)
			{
			case "AddUser":
				name=request.getParameter("name");
				college=request.getParameter("college");
				email=request.getParameter("email");
				age=Integer.parseInt(request.getParameter("age"));
				credit=Integer.parseInt(request.getParameter("credit"));
				msg=hp.addUser(name, college, email, age, credit);
				response.sendRedirect("index.jsp?msg="+msg);
			break;
			
			case "showUser":
				list=hp.showUser();
				request.setAttribute("list", list);
				rd=request.getRequestDispatcher("showUser.jsp");
				rd.include(request, response);
			break;
			
			case "uProfile":
				name=request.getParameter("name");
				list=hp.uProfile(name);
				request.setAttribute("list", list);
				rd=request.getRequestDispatcher("uProfile.jsp");
				rd.include(request, response);
			break;
			
			case "editProfile":
				name=request.getParameter("name");
				list=hp.uProfile(name);
				request.setAttribute("list", list);
				rd=request.getRequestDispatcher("editProfile.jsp");
				rd.include(request, response);
			break;
			
			case "updateUser":
				name=request.getParameter("name");
				college=request.getParameter("college");
				email=request.getParameter("email");
				age=Integer.parseInt(request.getParameter("age"));
				msg=hp.updateUser(name, college, email, age);
				rd=request.getRequestDispatcher("OperateServlet?operate=uProfile&name="+name+"&msg="+msg);
				rd.include(request, response);
			break;
			
			case "deleteUser":
				name=request.getParameter("name");
				msg=hp.deleteUser(name);
				response.sendRedirect("OperateServlet?operate=showUser&msg="+msg);
			break;
			
			case "transferCredit":
				name=request.getParameter("name");
				list=hp.uProfile(name);
				request.setAttribute("list", list);
				rd=request.getRequestDispatcher("transferCredit.jsp");
				rd.include(request, response);
				rd.forward(request, response);
			break;
			
			case "pay":
				String fname=request.getParameter("fname");
				String tname=request.getParameter("tname");
				double amount=Double.parseDouble(request.getParameter("amount"));
				msg=hp.pay(fname, tname, amount);
				if(msg.equals("User Name is Incorrect..!!"))
				{}
				else
				{
					hp.addTransfer(fname, tname, amount);
				}
				rd=request.getRequestDispatcher("OperateServlet?operate=uProfile&name="+fname+"&msg="+msg);
				rd.include(request, response);
			break;
			
			case "records":
				t=hp.records();
				request.setAttribute("list", t);
				rd=request.getRequestDispatcher("records.jsp");
				rd.include(request, response);
			break;
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
}
