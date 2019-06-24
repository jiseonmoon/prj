package com.bitcamp.comm;

import java.io.FileReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class FrontController
 */
@WebServlet(urlPatterns={"*.do"}, initParams={@WebInitParam(name="inital", value="WEB-INF/prop.properties")})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private Hashtable<String, Action> ht = new Hashtable<>();
    
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		String param = config.getInitParameter("inital");
		String realpath = config.getServletContext().getRealPath(param);
		Properties prop = new Properties();
		
		try {
			prop.load(new FileReader(realpath));
			Enumeration<Object> enu = prop.keys();
			
			while(enu.hasMoreElements()) {
				String key = (String)enu.nextElement();
				String value = (String)prop.get(key);
				
				Class c = Class.forName(value);
				Action act = (Action)c.newInstance();
				
				ht.put(key, act);
			}
		} catch(IOException | ClassNotFoundException | IllegalAccessException | InstantiationException e) {
			System.out.println(e);
		}
		
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String path = request.getServletPath();
		 Action act = ht.get(path);
		 
		 ForwardAction forward = act.execute(request, response);
		 
		 if(forward != null) {
			 if(forward.isRedirect())
				 response.sendRedirect(forward.getPath());
			 else {
				 RequestDispatcher disp = request.getRequestDispatcher(forward.getPath());
				 disp.forward(request, response);
			 }
		 }
	}

}
