package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CityServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String country = request.getParameter("country");
		StringBuilder sb = new StringBuilder();
		sb.append("{\"city\":[");
		if ("中国".equals(country)) {
			sb.append(" {\"value\":\"北京\"},{\"value\":\"上海\"},{\"value\":\"西安\"} ");
		}else if("日本".equals(country)){
			sb.append(" {\"value\":\"东京\"},{\"value\":\"秋叶原\"},{\"value\":\"福冈\"} ");
		}
		sb.append("]}");
		PrintWriter pw = response.getWriter();
		pw.write(sb.toString());
		pw.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
