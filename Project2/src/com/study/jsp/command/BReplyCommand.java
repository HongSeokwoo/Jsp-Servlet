package com.study.jsp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.BDao;

public class BReplyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		
		String bId = request.getParameter("bId");
		String bName = (String)session.getAttribute("name");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bGroup = request.getParameter("bGroup");
		String bStep = request.getParameter("bStep");
		String bIndent = request.getParameter("bIndent");
		
		BDao dao = new BDao();
		dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);
	}
}
