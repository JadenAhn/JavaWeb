/* ADJAAddBookServlet.java
 * Assignment 2
 * Revision History
 *      Aubrey Delong, 2018.02.21: Created
 *      Jaden Ahn, 2018.03.07 : Changed variable names
 */
package club.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import club.business.Book;
import javax.servlet.ServletContext;
import club.data.BookIO;
import java.util.ArrayList;

/**
 *
 * @author Adelong7545
 */
public class ADJAAddBookServlet extends HttpServlet {

    
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

        String url = "/ADJAAddBook.jsp";
        Integer errorCounter = 0;
        Integer intQuantity = 0;
        String message = "";
        String code = "";
        String description = "";
        String quantity = "";
        
        ArrayList<Book> books = null;
        
        //get current action
        String action = request.getParameter("action");
        if (action== null){
            action="save"; //default action            
        }
        
        //perform action and set URL to appropriate page
        if (action.equals("save")){
            code = request.getParameter("code");
            description = request.getParameter("description");
            quantity = request.getParameter("quantity");
            
            if (code == null || code.isEmpty()) {
                message += "Book code is required.<br>";
                errorCounter++;
            }
            if (description == null || description.isEmpty() || description.trim().length() < 2){
                message += "Description must have at least 2 characters.<br>";
                errorCounter++;
            }
            
            intQuantity = Integer.parseInt(quantity);
            if (intQuantity <= 0)
            {
                message += "Quantity must be a positive number.";
                errorCounter++;
            }

            
            Book newBook = new Book(code, description, intQuantity);
            
            if(errorCounter == 0) {
                message = "";
                url = "/ADJADisplayBooks.jsp";
                ServletContext context = getServletContext();
                String path = context.getRealPath("/WEB-INF/books.txt");
                BookIO.insert(newBook, path);
                books = BookIO.getBooks(path);
            }
            
            request.setAttribute("books", books);
            request.setAttribute("newBook", newBook);
            request.setAttribute("message", message);
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
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
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
