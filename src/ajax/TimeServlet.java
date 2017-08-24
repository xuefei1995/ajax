package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private String getTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		if("async".equals(type)) {
			PrintWriter writer = response.getWriter();
			writer.write(getTime());
			writer.close();
		} else {
			request.setAttribute("time", getTime());
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
