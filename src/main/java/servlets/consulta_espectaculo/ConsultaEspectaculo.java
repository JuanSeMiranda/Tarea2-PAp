package servlets.consulta_espectaculo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import exepciones.SinPlataformasException;
import interfaces.Fabrica;
import interfaces.IConsultaEspectaculo;

/**
 * Servlet implementation class ConsultaEspectaculo
 */

public class ConsultaEspectaculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ConsultaEspectaculo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
		List<JSONObject> plataformas = new ArrayList<JSONObject>();
		PrintWriter out = response.getWriter();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		IConsultaEspectaculo ice = Fabrica.getInstance().getCConsultaEspectaculo();
		
		try {
			List<String> lista_plataformas = ice.listarPlataformas();
			
                        if (!lista_plataformas.isEmpty()) {
                            Iterator<String> it = lista_plataformas.iterator();
			
                            while(it.hasNext()) {
                                String name = it.next();
                                if(!ice.listarEspectaculos(name).isEmpty()) {
                                    JSONObject plataforma = new JSONObject();
                                    plataforma.put("name", name);
                                    plataformas.add(plataforma);
                                }
                            }
                            
                        }
                        
                        if (lista_plataformas.isEmpty() || plataformas.isEmpty()) {
                            JSONObject error = new JSONObject();

                            error.put("error", "No hay Espectaculos Disponibles");
                            plataformas.add(error);
                        }
			
                        out.print(plataformas);
                        out.flush();  
			
		} catch(SinPlataformasException e) {
//                     JSONObject error = new JSONObject();
//
//                    error.put("error", "No hay plataformas");
//                    plataformas.add(error);
//                    out.print(plataformas);
//                    out.flush(); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}