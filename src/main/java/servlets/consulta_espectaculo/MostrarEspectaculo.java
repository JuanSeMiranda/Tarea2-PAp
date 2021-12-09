/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.consulta_espectaculo;

import datatypes.DtDataEspectaculo;
import datatypes.DtEspectaculo;
import interfaces.Fabrica;
import interfaces.IConsultaEspectaculo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author angel
 */
public class MostrarEspectaculo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("application/json");
        
        PrintWriter out = res.getWriter();
 
        String paramValue = req.getParameter("name");
        
        IConsultaEspectaculo ice = Fabrica.getInstance().getCConsultaEspectaculo();
        List<String> nombresEspectaculos = ice.listarEspectaculos(paramValue);
 
        List<JSONObject> espectaculos = new ArrayList<JSONObject>();
        Iterator<String> it = nombresEspectaculos.iterator();
			
        while(it.hasNext()) {
                String name = it.next();
                DtDataEspectaculo data = ice.mostrarDatosEspectaculos(name);
                DtEspectaculo data_espectaculo = data.getEspectaculo();
                JSONObject espectaculo = new JSONObject();
                
                espectaculo.put("name", data_espectaculo.getNombre());
                espectaculo.put("descripcion", data_espectaculo.getDescripcion());
                espectaculo.put("cantMinEspectadores", data_espectaculo.getCantMinEspectadores());
                espectaculo.put("cantMaxEspectadores", data_espectaculo.getCantMaxEspectadores());
                espectaculo.put("duracionMin", data_espectaculo.getDuracionMin());
                espectaculo.put("url", data_espectaculo.getUrl());
                espectaculo.put("costo", data_espectaculo.getCosto());
                espectaculo.put("fechaRegistro", data_espectaculo.getFechaRegistro());
                espectaculo.put("img", data_espectaculo.getImg());
                espectaculos.add(espectaculo);
        }    
        
        
        out.print(espectaculos);
	out.flush(); 
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
