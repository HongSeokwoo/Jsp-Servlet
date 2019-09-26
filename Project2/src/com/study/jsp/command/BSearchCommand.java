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
		

		
		BDao dao = BDao.getInstance();
		HttpSession session = null;
		session = request.getSession();
		
		String bTitle = null;
		String bContent = null;
		String bName = null;
		String type = request.getParameter("type");
		System.out.println(type);
		if (type.equals("bName") ) {
			bName = request.getParameter("value");

		} else if (type.equals("bTitle")) {
			bTitle = request.getParameter("value");
			System.out.println(bTitle);
		} else if (type.equals("bContent")) {
			bContent = request.getParameter("value");

		}
		
		ArrayList<BDto> dtos = 	dao.search(bName,bTitle,bContent);
		
		request.setAttribute("list", dtos);
	}

	
}


