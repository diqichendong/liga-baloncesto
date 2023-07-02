/*
 * Controlador Login
 */
package controlador;

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
public class Login extends HttpServlet {

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
        String vista = "/login.jsp";
        String error = "";
        
        //Si se reciben parametros de inicio de sesión
        if (request.getParameter("login") != null) {
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
            UsuarioJpaController ujc = new UsuarioJpaController(emf);
            
            //Comprobar que el usuario existe
            for (Usuario u : ujc.findUsuarioEntities()) {
                if (u.getLogin().equals(login) && u.getPassword().equals(password)) {
                    request.getSession().setAttribute("usuario", u);
                    if (u.getTipo().equals("Administrador")) {
                        response.sendRedirect("admin/menuAdministrador.jsp");
                        return;
                    } else {
                        response.sendRedirect("arbitro/menuArbitro.jsp");
                        return;
                    }
                }
            }
            
            if (request.getSession().getAttribute("usuario") == null) {
                error = "Usuario o contraseña incorrectos.";
            }
        }
        
        if (!error.isEmpty()) {
            request.setAttribute("error", error);
        }
        
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
