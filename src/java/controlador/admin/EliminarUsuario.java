/*
 * Controlador EliminarUsuario
 */
package controlador.admin;

import java.io.IOException;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.UsuarioJpaController;
import modelo.dao.exceptions.NonexistentEntityException;

/**
 *
 * @author Di Qi
 */
public class EliminarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Recibe el id del usuarios que queremos eliminar por parámetros y lo elimina
        if (request.getParameter("id") != null) {
            String id = request.getParameter("id");
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
            UsuarioJpaController ujc = new UsuarioJpaController(emf);
            try {
                ujc.destroy(Long.parseLong(id));
            } catch (NonexistentEntityException e) {
                System.err.println("Error al eliminar un usuario: " + e.getMessage());
            }
        }
        
        response.sendRedirect("GestionarUsuarios");
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
