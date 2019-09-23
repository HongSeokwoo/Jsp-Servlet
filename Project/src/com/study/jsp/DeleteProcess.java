package com.study.jsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.MemberDao;
import com.study.jsp.dto.MemberDto;

@WebServlet("/DeleteProcess")
public class DeleteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDto dto = new MemberDto();
		dto.setId(id);
		
		String json_data = "";
		MemberDao dao = MemberDao.getInstance();
		int ri = dao.userCheck(id, pw);
		if (ri == dao.MEMBER_JOIN_SUCCESS) {
			ri = dao.deleteMember(dto);
			json_data = "{\"code\":\"success\", \"desc\":\"회원탈퇴 되었습니다..\"}";
		} else if (ri == dao.MEMBER_LOGIN_PW_NO_GOOD){
			json_data = "{\"code\":\"fail\", \"desc\":\"암호가 틀립니다.\"}";
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(json_data);
		writer.close();
	}

}
