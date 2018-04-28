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
 * @author Aubrey
 */
public class ADJAClearCartServlet extends HttpServlet {

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
            
         String url = "/ADJAECart.jsp";
        
        //create/save loan cart object in session object
        HttpSession session = request.getSession();
        ECart cart = (ECart) session.getAttribute("cart");
        
        ArrayList<Book> cartitems = null;
        
        if (cart != null){
            //use get items method of cart object to access list of cart items
            cartitems = cart.getItems();
            ServletContext application = getServletContext();
            ArrayList<Book> loanitems = null; 
            loanitems = (ArrayList<Book>) application.getAttribute("loanitems");
            String code = null;
            int quantity = 0;
            
            //add back quantity reserved from each cart item to loan items in QOH
            for (int i = 0; i < cartitems.size(); i++) {    
                quantity = cartitems.get(i).getQuantity();
                code = cartitems.get(i).getCode();
                ELoan.addToQOH(loanitems, code, quantity);
            }
        }
        else
        {
            getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
        }     
        
        //invalidate session object.
        session.invalidate();
        
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
