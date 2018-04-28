<%-- ADJADisplayMember.jsp
     Assignment 1
     Revision History
        Aubrey Delong, 2018.01.27: Created
--%>

<jsp:include page = "ADJABanner.jsp"/>
<section>
    <h2>Thanks for joining our club!</h2><br>
    <p>Here is the information you entered:</p>
    <table>
        <tr>
            <th>Full Name:</th>
            <td>${param.fullname}</td>
        </tr>
        <tr>
            <th>Email:</th>
            <td>${param.email}</td>
        </tr>            
        <tr>
            <th>Phone:</th>
            <td>${param.phone}</td>
        </tr>            
        <tr>
            <th>IT Program:</th>
            <td>${param.program}</td>
        </tr>
        <tr>
            <th>Year Level:</th>
            <td>${param.year}</td>
        </tr>        
    </table>
    <p>To register another member, click on the Back button in your browser or
        the Return button shown below.</p>
    <form action="ADJARegister.jsp" method="post">
        <input type="submit" name="return" value="Return"/>
    </form>
</section>    
<jsp:include page = "ADJAFooter.jsp"/>
