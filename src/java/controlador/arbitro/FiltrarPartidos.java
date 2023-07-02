/*
 * Controlador FiltrarPartidos
 */
package controlador.arbitro;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.JornadaJpaController;
import modelo.entidades.Jornada;
import modelo.entidades.Partido;

/**
 *
 * @author Di Qi
 */
public class FiltrarPartidos extends HttpServlet {

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
        String vista = "/arbitro/filtrarPartidos.jsp";

        Long jornadaId = null;
        if (request.getParameter("jornadaId") != null) {
            jornadaId = Long.parseLong(request.getParameter("jornadaId"));
        }

        //Filtrar partidos de una jornada
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        JornadaJpaController jjc = new JornadaJpaController(emf);
        Jornada jornada = jjc.findJornada(jornadaId);
        List<Partido> partidos = jornada.getPartidos();

        request.setAttribute("partidos", partidos);
        request.getSession().setAttribute("jornada", jornada);

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
