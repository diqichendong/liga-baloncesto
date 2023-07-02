/*
 * Controlador EditarUsuario
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
import modelo.entidades.Usuario;

/**
 *
 * @author Di Qi
 */
public class EditarUsuario extends HttpServlet {

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
        String vista = "/admin/editarUsuario.jsp";
        String error = "";
        
        //Recupero el usuario a modificar
        long id = Long.parseLong(request.getParameter("id"));
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        UsuarioJpaController ujc = new UsuarioJpaController(emf);
        Usuario usuario = ujc.findUsuario(id);
        
        //Si recibimos parametros de modificación
        if (request.getParameter("nombre") != null) {
            String nombre = request.getParameter("nombre").trim();
            String login = request.getParameter("login").trim();
            String password = request.getParameter("password").trim();
            String tipo = request.getParameter("tipo");
            
            //Asignamos nuevos datos
            usuario.setNombre(nombre);
            usuario.setLogin(login);
            usuario.setPassword(password);
            usuario.setTipo(tipo);
            
            //Editamos el usuario
            try {
                ujc.edit(usuario);
                response.sendRedirect("GestionarUsuarios");
                return;
            } catch (Exception e) {
                System.err.println("Error en la modificación del usuario: " + e.getMessage());
                error = "No se ha podido modificar el usuario.";
            }
        }
        
        if (!error.isEmpty()) {
            request.setAttribute("error", error);
        }
        
        request.setAttribute("usuario", usuario);
        
        getServletContext().getRequestDispatcher(vista).forward(request, response);
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
