package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exepciones.ContraseniaIncorrectaException;
import exepciones.UsuarioRepetidoException;
import interfaces.Fabrica;
import interfaces.ICAltaUsuario;

/**
 * Servlet implementation class AltaUsuario
 */
@WebServlet("/AltaUsuario")
public class AltaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaUsuario() {
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
		// TODO Auto-generated method stub
		
		String tipoUsuario = request.getParameter("tipoUsuario");
		String nickname, nombre, apellido, password, confpassword, email, imagen, descripcion, biografia, linkurl;
		int dia, mes, anio;
		nickname = request.getParameter("nickname");
		nombre = request.getParameter("nombre");
		apellido = request.getParameter("apellido");
		password = request.getParameter("password");
		confpassword = request.getParameter("confpassword");
		email = request.getParameter("email");
		imagen = request.getParameter("imagen");
		dia = Integer.parseInt(request.getParameter("dia"));
		mes = Integer.parseInt(request.getParameter("mes"));
		anio = Integer.parseInt(request.getParameter("anio"));
		Date fechanac = new Date(anio-1900, mes-1, dia);
		boolean error = false;
		
		descripcion = request.getParameter("descripcion");
		biografia = request.getParameter("biografia");
		linkurl = request.getParameter("linkurl");

		
		Fabrica fabrica = Fabrica.getInstance();
		ICAltaUsuario icau = fabrica.getCAltaUsuario();

		try {
			icau.ingresarDatos(nickname, email, nombre, apellido, fechanac, password);
		} catch (UsuarioRepetidoException e) {
			error = true;
			RequestDispatcher rd;
        	request.setAttribute("mensaje", e);
        	rd = request.getRequestDispatcher("/notificacion.jsp");
        	rd.forward(request, response);
        	doGet(request, response);
		}
		
		try {
			icau.confirmacionPass(confpassword);
		} catch (ContraseniaIncorrectaException e) {
			error = true;
			RequestDispatcher rd;
        	request.setAttribute("mensaje", e);
        	rd = request.getRequestDispatcher("/notificacion.jsp");
        	rd.forward(request, response);
        	doGet(request, response);
		}
		
		if(imagen != "" || imagen != null) {
			icau.elegirImagen("img/" + imagen);
		}
		
		if(tipoUsuario.equals("artista")) {
				icau.ingresarDatosArtista(descripcion);
				icau.ingresarBiografia(biografia);
				icau.linkPagina(linkurl);
		}
		
		if(!error) {
			icau.altaUsuario();
			response.sendRedirect("index.jsp");
		}
		
		doGet(request, response);
	}

}
