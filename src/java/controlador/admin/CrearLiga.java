/*
 * Controlador CrearLiga
 */
package controlador.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.EquipoJpaController;
import modelo.dao.JornadaJpaController;
import modelo.dao.LigaJpaController;
import modelo.dao.PartidoJpaController;
import modelo.entidades.Equipo;
import modelo.entidades.Jornada;
import modelo.entidades.Liga;
import modelo.entidades.Partido;

/**
 *
 * @author Di Qi
 */
public class CrearLiga extends HttpServlet {

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
        String vista = "/admin/crearLiga.jsp";
        String error = "";

        //Lista de equipos inscritos
        if (request.getSession().getAttribute("equipos") == null) {
            request.getSession().setAttribute("equipos", new ArrayList());
        }

        //Introducir un equipo
        if (request.getParameter("equipo") != null) {
            Equipo equipo = new Equipo();
            equipo.setNombre(request.getParameter("equipo").trim());
            if (!((List)request.getSession().getAttribute("equipos")).contains(equipo)) {
                ((List)request.getSession().getAttribute("equipos")).add(equipo);
            }
        }
        
        //Eliminar equipo
        if (request.getParameter("eliminar") != null) {
            ((List)request.getSession().getAttribute("equipos")).remove(Integer.parseInt(request.getParameter("eliminar")));
        }

        //Crear liga
        if (request.getParameter("nombre") != null) {
            if (((List) request.getSession().getAttribute("equipos")).size() % 2 == 0) {
                Liga liga = new Liga();
                if (!existeNombreLiga(request.getParameter("nombre").trim())) {
                    liga.setNombre(request.getParameter("nombre").trim());
                    liga.setEquipos((List)request.getSession().getAttribute("equipos"));
                    liga.generarJornadas(request.getParameter("fecha"));

                    try {
                        guardarLigaBD(liga);
                    } catch (RollbackException e) {
                        error = "No se ha podido crear la liga";
                    }

                    request.getSession().setAttribute("equipos", null);
                    
                    response.sendRedirect("menuAdministrador.jsp");
                    return;
                }

            } else {
                error = "El número de equipos tiene que ser par.";
            }
        }

        if (!error.isEmpty()) {
            request.setAttribute("error", error);
        }

        getServletContext().getRequestDispatcher(vista).forward(request, response);
    }
    
    /**
     * Indica si ya existe una liga en la base de datos con el mismo nombre
     * @param nombre Nombre a comprobar
     * @return true si ya existe, false si noº
     */
    private boolean existeNombreLiga(String nombre) {
        boolean res = false;
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        LigaJpaController ljc = new LigaJpaController(emf);
        
        for (Liga liga : ljc.findLigaEntities()) {
            if (liga.getNombre().equals(nombre)) {
                res = true;
                break;
            }
        }
        
        return res;
    }

    /**
     * Guarda la liga en la base de datos
     * @param liga Liga
     * @throws RollbackException No se ha podido añadir a
     */
    private void guardarLigaBD(Liga liga) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        EquipoJpaController ejc = new EquipoJpaController(emf);
        PartidoJpaController pjc = new PartidoJpaController(emf);
        JornadaJpaController jjc = new JornadaJpaController(emf);
        LigaJpaController ljc = new LigaJpaController(emf);

        //Guardar equipos
        for (Equipo equipo : liga.getEquipos()) {
            ejc.create(equipo);
        }
        
        //Gaurdar jornadas y partidos
        for (Jornada jornada : liga.getJornadas()) {
            for (Partido partido : jornada.getPartidos()) {
                pjc.create(partido);
            }
            jjc.create(jornada);
        }
        
        //Guardar liga
        ljc.create(liga);
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
