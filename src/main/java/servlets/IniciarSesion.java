package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.ICIniciarSesion;
import logic.clases.Usuario;
import logic.manejadores.ManejadorUsuario;

/**
 * Servlet implementation class IniciarSesion
 */
@WebServlet("/IniciarSesion")
public class IniciarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IniciarSesion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
        String usu, pass;
        usu = request.getParameter("inputUser");
        pass = request.getParameter("inputPassword");
        Fabrica fabrica = Fabrica.getInstance();
        ICIniciarSesion icis = fabrica.getCIniciarSesion();
        DtUsuario usuario = icis.iniciarSesion(usu, pass);
        if(usuario != null) {
        	sesion.setAttribute("usuario", usuario);
        	response.sendRedirect("index.jsp");
        }else {
        	RequestDispatcher rd;
        	request.setAttribute("mensaje", "Usuario o password incorrectos");
        	rd = request.getRequestDispatcher("/notificacion.jsp");
        	rd.forward(request, response);
        }
        
		doGet(request, response);
	}

}
