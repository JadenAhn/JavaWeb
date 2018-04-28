<%-- ADJAAdmin.jsp
     Assignment 2
     Revision History
        Aubrey Delong, 2018.02.20: Created
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/ADJABanner.jsp" />
<section>
    <h2>Admin: Data Maintenance</h2>
    <a href="/ADJAClub/ADJADisplayBooks">Maintain Books</a></br>
    <a href="<c:url value = "/ADJAMemberAdmin?action=displayMembers"/>">Display Members</a>
</section>
<jsp:include page="/ADJAFooter.jsp" />
