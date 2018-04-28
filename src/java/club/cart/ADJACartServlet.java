/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package club.cart;

import club.business.Book;
import club.business.ECart;
import club.business.ELoan;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jaden
 */
public class ADJACartServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String url = "/ADJAECart.jsp";
            
            String action = request.getParameter("action");  
            
            Book foundItem = null;
            
            ServletContext application = getServletContext();
            //access the loanitems object
            ArrayList<Book> loanitems = null;
            loanitems = (ArrayList<Book>) application.getAttribute("loanitems");
            
            HttpSession session = request.getSession();
            ECart cart = (ECart) session.getAttribute("cart");
            String code = request.getParameter("code");
            int quantity = 1;
            
            //if you just click e cart tab
            if (action == (null) || !action.equals("reserve")){
                session.setAttribute("cart", cart);
                url = "/ADJAECart.jsp";
            }            
            else if (action.equals("reserve")){
                if (cart == null) {
                    cart = new ECart();
                }
                int qoh = ELoan.getQOH(loanitems, code);
                if (qoh > 0) {
                    foundItem = ELoan.findItem(loanitems, code);
                    cart.addItem(foundItem);
                    ELoan.subtractFromQOH(loanitems, code, quantity);
                    session.setAttribute("cart", cart);
                    url = "/ADJAECart.jsp";                    
                }

            }
            
            getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response); 
                    
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
