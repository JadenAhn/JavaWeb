<%-- 
    Document   : ADJADisplayMembers
    Created on : Apr 6, 2018, 12:32:59 PM
    Author     : Adelong7545
--%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page = "ADJABanner.jsp"/>
    <section>
        <h2>List of Members</h2><br>
        
        <table>
            <tr>
                <th>Email</th>
                <th>Program</th>
                <th>Year</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${members}">
            <tr>
                <td>${item.emailAddress}</td>
                <td>${item.programName}</td>
                <td>${item.yearLevel}</td>
                <td><a href="/ADJAClub/ADJAMemberAdmin?action=displayMember&amp;email=${item.emailAddress}">Update</a></td>
                <td><a href="/ADJAClub/ADJAMemberAdmin?action=confirmDeleteMember&amp;email=${item.emailAddress}">Delete</a></td>
            </tr>
            </c:forEach>
        </table>
        <form action="ADJAMemberAdmin">
            <input type="hidden" name="action" value="addMember"/>
            <input type="submit" value="Add Member"/>
        </form>

    </section>
<jsp:include page = "ADJAFooter.jsp"/>
