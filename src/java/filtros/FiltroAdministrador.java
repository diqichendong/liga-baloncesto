/*
 * Filtro FiltroAdministrador
 */
package filtros;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Usuario;

/**
 *
 * @author Di Qi
 */
public class FiltroAdministrador implements Filter {

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");

        if (u == null) {
            res.sendRedirect(req.getContextPath() + "/Login");
            return;
        }
        
        if (u.getTipo().equals("Arbitro")) {
            res.sendRedirect(req.getContextPath() + "/arbitro/menuArbitro.jsp");
            return;
        }

        chain.doFilter(request, response);

    }

}
