<%-- ADJADisplayBooks.jsp
     Assignment 2
     Revision History
        Jaden Ahn, 2018.02.20: Created
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/ADJABanner.jsp" />
<section>
    <h2>List of Books</h2>
    
    <table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
        </tr>
    <c:forEach var="item" items="${books}">
        <tr>
            <td>${item.code}</td>
            <td>${item.description}</td>
            <td>${item.quantity}</td>
        </tr>
    </c:forEach>
    </table>
    
    <form action="ADJAAddBook.jsp" method="post">
        <input type="hidden" name="action" value="">
        <input type="submit" value="Add Book">
    </form>
    
</section>
<jsp:include page="/ADJAFooter.jsp" />
