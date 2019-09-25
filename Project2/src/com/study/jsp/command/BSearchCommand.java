package com.study.jsp.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.BPageInfo;
import com.study.jsp.dao.BDao;
import com.study.jsp.dto.BDto;

public class BSearchCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		
		int nPage = 1;
		String bName = (String)request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		try {
			String sPage = request.getParameter("page");
			nPage = Integer.parseInt(sPage);
		} catch (Exception e) {
		}
		
		BDao dao = BDao.getInstance();
		dao.search(bName,bContent,bTitle);
		BPageInfo pinfo = dao.articlePage(nPage);
		request.setAttribute("page", pinfo);
		
		nPage = pinfo.getCurPage();
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		
		ArrayList<BDto> dtos = dao.list(nPage);
		request.setAttribute("slist", dtos);
	}
}
