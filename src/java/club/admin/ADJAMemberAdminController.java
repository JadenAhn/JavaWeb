/* ADJADisplayBooksServlet.java
 * Assignment 3
 * Revision History
 *      Aubrey Delong, 2018.04.05: Created
 */
package club.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//added this
import club.business.Member;
import club.data.MemberDB;
import java.util.HashSet;

/**
 *
 * @author Adelong7545
 */
public class ADJAMemberAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ADJAMemberAdminController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ADJAMemberAdminController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }

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
        
        //display members, displaymem input form, display confirm delete actions
        String url = "/ADJADisplayMembers.jsp";         
        // get current action
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "displayMembers";  // default action
        }
        
        if(action.equals("displayMembers")){
            url="/ADJADisplayMembers.jsp";
            ArrayList<Member> members = MemberDB.selectMembers(); 
            request.setAttribute("members", members);
            request.setAttribute("member", new Member());
        }    
        
        if(action.equals("displayMember")){
            url="/ADJAMember.jsp";
            String emailAddress = request.getParameter("email");
            Member member = MemberDB.selectMember(emailAddress);
            request.setAttribute("member", member);            
        }
        
        if(action.equals("addMember")){
            url="/ADJAMember.jsp";
//            String emailAddress = request.getParameter("email");
//            Member member = MemberDB.selectMember(emailAddress);
//            request.setAttribute("member", member);
            request.setAttribute("member", new Member());
        }
        
        
        if (action.equals("confirmDeleteMember")){
                           
            String emailAddress = request.getParameter("email");
//            Member deleteMember = MemberDB.selectMember(emailAddress);
            Member member = MemberDB.selectMember(emailAddress);            
            request.setAttribute("member", member);         

            url="/ADJAConfirmMemberDelete.jsp";            
        }
        
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);        
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
        
        String url = "/ADJADisplayMembers.jsp";   
        // get current action
        String action = request.getParameter("action");        
        String message = "";
        Member member = new Member();
        
        if (action == null) {
            action = "displayMembers";  // default action
        }
        
        if(action.equals("updateMember")){
            String fullName = request.getParameter("fullName");
            String emailAddress = request.getParameter("emailAddress");
            String phoneNumber = request.getParameter("phoneNumber");
            String programName = request.getParameter("programName");
            int yearLevel = Integer.parseInt(request.getParameter("yearLevel"));
             
            member = new Member (fullName, emailAddress);
                
            member.setEmailAddress(emailAddress);
            member.setFullName(fullName);
            member.setPhoneNumber(phoneNumber);
            member.setProgramName(programName);
            member.setYearLevel(yearLevel); 
            
            if(fullName.isEmpty() || emailAddress.isEmpty() 
                    || fullName.trim().length() < 2 || emailAddress.trim().length() < 2
                    || fullName == null || emailAddress == null)
            {
                url="/ADJAMember.jsp";
                                
                message += "Member information is not valid.<br>";
                message += "You must enter a valid name and email (name: greater than 2 characters, email: a@g.com)";      
            }            
            else{
                
                if(member.isValid())
                {
                    url="/ADJADisplayMembers.jsp";
                    if (MemberDB.emailExists(emailAddress)) //update
                    {                        
                        MemberDB.update(member);
                        request.setAttribute("member", new Member());
                    }
                    else //add
                    {                  
                        MemberDB.insert(member);
                        request.setAttribute("member", member);
                    }
                    
                    ArrayList<Member> members = MemberDB.selectMembers();
                    request.setAttribute("members", members);
                }
                else{
                    url="/ADJAMember.jsp";
                    message += "Member information is not valid.<br>";
                    message += "You must enter a valid name and email.";   
                }
            }                      
        }      
       
        if (action.equals("deleteMember")){
            String email = request.getParameter("email");
            member = MemberDB.selectMember(email);
            
            MemberDB.delete(member);
            ArrayList<Member> members = MemberDB.selectMembers(); 
            
            request.setAttribute("member", new Member());
            request.setAttribute("members", members);
            
            url="/ADJADisplayMembers.jsp";            
        }
           
        request.setAttribute("message", message);
//        request.setAttribute("member", member);
        
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);        
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
