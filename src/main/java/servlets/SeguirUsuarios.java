package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.ICGestionSeguimientoUsuario;

/**
 * Servlet implementation class SeguirUsuarios
 */
@WebServlet("/SeguirUsuarios")
public class SeguirUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeguirUsuarios() {
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
		Fabrica fabrica = Fabrica.getInstance();
		ICGestionSeguimientoUsuario icgsu = fabrica.getCGestionSeguimientoUsuario();
		
		HttpSession sesion = request.getSession();
		DtUsuario usuarioDeSesion = (DtUsuario) sesion.getAttribute("usuario");
		ArrayList<DtUsuario> listaUsuarios = icgsu.listarUsuarios(usuarioDeSesion);
		request.setAttribute("listaUsuarios", listaUsuarios);
		
		if(request.getParameter("seguirUsuario") != null) {
			icgsu.seguirUsuario(usuarioDeSesion.getNickname(), request.getParameter("seguirUsuario"));
		}else if(request.getParameter("dejarDeSeguirUsuario") != null) {
			icgsu.dejarDeSeguirUsuario(usuarioDeSesion.getNickname(), request.getParameter("dejarDeSeguirUsuario"));
		}
		
		ArrayList<String> usuariosSeguidos = icgsu.listarUsuariosSeguidos(usuarioDeSesion);
		request.setAttribute("listaUsuariosSeguidos", usuariosSeguidos);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/seguirUsuarios.jsp");
		rd.forward(request, response);
		
	}

}
