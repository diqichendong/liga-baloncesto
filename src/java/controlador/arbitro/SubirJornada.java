/*
 * Controlador SubirJornada
 */
package controlador.arbitro;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.dao.JornadaJpaController;
import modelo.dao.PartidoJpaController;
import modelo.entidades.Jornada;
import modelo.entidades.Partido;

/**
 *
 * @author Di Qi
 */
public class SubirJornada extends HttpServlet {

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
        String vista = "/arbitro/subirJornada.jsp";
        String error = "";
        HttpSession sesion = request.getSession();

        //Leer fichero
        if (request.getMethod().equals("POST") && request.getPart("fichero") != null) {
            if (comprobarFicheroCorrecto(request.getPart("fichero"), (Jornada) sesion.getAttribute("jornada"))) {
                importarFichero(request.getPart("fichero"), (Jornada) sesion.getAttribute("jornada"));
                
                response.sendRedirect("GestionarPartidos");
                return;
            } else {
                error = "El fichero no es correcto.";
            }
        }

        if (!error.isEmpty()) {
            request.setAttribute("error", error);
        }

        getServletContext().getRequestDispatcher(vista).forward(request, response);
    }

    /**
     * Comprueba que el fichero que se sube es correcto
     *
     * @return true si es correcto, false si no
     */
    private boolean comprobarFicheroCorrecto(Part fichero, Jornada jornada) {
        boolean res = true;
        
        String nombreFichero = fichero.getSubmittedFileName();
        if (nombreFichero.contains(".txt")) {
            try {
                BufferedReader br = new BufferedReader(new InputStreamReader(fichero.getInputStream()));
                
                //Comprueba el número de la jornadas
                if (br.readLine().split(" ")[1].equals(jornada.getNumero().toString())) {
                    int i = 0;
                    while (br.ready()) {
                        String[] linea = br.readLine().split(";");
                        
                        //Comprueba si los partidos son los correctos
                        if (!linea[0].equals(jornada.getPartidos().get(i).getLocal().getNombre())
                                || !linea[2].equals(jornada.getPartidos().get(i).getVisitante().getNombre())) {
                            res = false;
                            break;
                        } else {
                            //Comprobar formato de los números
                            int puntosLocal;
                            int puntosVisitante;
                            try {
                                puntosLocal = Integer.parseInt(linea[1]);
                                puntosVisitante = Integer.parseInt(linea[3]);
                                i++;
                            } catch (NumberFormatException e) {
                                System.err.println(e.getMessage());
                                res = false;
                                break;
                            }
                            
                            //Comprobar que no hay empates
                            if (( puntosLocal == puntosVisitante) && puntosLocal != 0) {
                                res = false;
                                break;
                            }
                        }
                    }
                } else {
                    res = false;
                }
            } catch (IOException e) {
                System.err.println(e.getMessage());
            }
        }

        return res;
    }

    
    /**
     * Importa los datos del archivo a la base de datos
     * @param fichero
     * @param jornada 
     */
    private void importarFichero(Part fichero, Jornada jornada) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LigasBaloncestoPU");
        PartidoJpaController pjc = new PartidoJpaController(emf);
        List<Partido> partidos = jornada.getPartidos();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(fichero.getInputStream()));
            br.readLine();
            
            int i = 0;
            while (br.ready()) {                
                String[] linea = br.readLine().split(";");
                Partido partido = pjc.findPartido(partidos.get(i).getId());
                partido.setPuntosLocal(Integer.parseInt(linea[1]));
                partido.setPuntosVisitante(Integer.parseInt(linea[3]));
                
                try {
                    pjc.edit(partido);
                    i++;
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            }
        } catch (IOException e) {
        }
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
