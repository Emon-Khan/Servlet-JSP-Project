package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
public class LoginServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			// String name = request.getParameter("user_name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			// String gender = request.getParameter("gender");
			// String about = request.getParameter("about");
			// String profile = request.getParameter("profile");
			// User user = new User(email, password);
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			User user = userDao.getUserByEmailAndPassword(email, password);
			if (user == null) {
				// out.println("Login Error");
				Message msg = new Message("Invalid details! Try Again", "error", "alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
			} else {
				HttpSession s = request.getSession();
				s.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
		}
	}

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		processRequest(request, response);
	}

}
