/*
 * Controlador ModificarPartido
 */
package controlador.arbitro;

import java.io.IOException;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.PartidoJpaController;
import modelo.entidades.Partido;

/**
 *
 * @author Di Qi
 */
public class ModificarPartido extends HttpServlet {

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
        String vista = "/arbitro/modificarPartido.jsp";
        String error = "";

        //Recupero el partido a modificar
        long id = Long.parseLong(request.getParameter("id"));
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        PartidoJpaController pjc = new PartidoJpaController(emf);
        Partido partido = pjc.findPartido(id);

        //Se han recibido parámetros para establecer
        if (request.getParameter("local") != null) {
            int puntosLocal = Integer.parseInt(request.getParameter("local"));
            int puntosVisitante = Integer.parseInt(request.getParameter("visitante"));

            if ((puntosLocal == puntosVisitante) && puntosLocal != 0) {
                error = "Un partido no puede quedar empate.";
            } else {
                partido.setPuntosLocal(puntosLocal);
                partido.setPuntosVisitante(puntosVisitante);

                //Editamos el partido
                try {
                    pjc.edit(partido);
                    response.sendRedirect("GestionarPartidos");
                    return;
                } catch (Exception e) {
                    System.err.println("Error en la modificación del partido: " + e.getMessage());
                    error = "No se ha podido modificar el partido.";
                }
            }
        }

        if (!error.isEmpty()) {
            request.setAttribute("error", error);
        }
        
        request.setAttribute("partido", partido);

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
