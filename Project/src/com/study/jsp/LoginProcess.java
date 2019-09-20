package com.study.jsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.MemberDao;
import com.study.jsp.dto.MemberDto;

@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDao dao = MemberDao.getInstance();
		MemberDto dto = new MemberDto();

		String json_data = "";
		int ri = dao.userCheck(id, pw);
		if (ri == dao.MEMBER_JOIN_SUCCESS) {
			HttpSession session = request.getSession();
			dto = dao.getMember(id);
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");
			json_data = "{\"code\":\"success\", \"desc\":\"로그인에 성공했습니다.\"}";
		} else if (ri == dao.MEMBER_LOGIN_IS_NOT){
			json_data = "{\"code\":\"fail\", \"desc\":\"로그인에 실패 했습니다.\"}";
		} else if (ri == dao.MEMBER_LOGIN_PW_NO_GOOD) {
			json_data = "{\"code\":\"fail\", \"desc\":\"패스워드가 틀립니다.\"}";
		}

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(json_data);
		writer.close();
	}
}