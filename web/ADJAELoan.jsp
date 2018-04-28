<%-- ADJAELoan.jsp
     Assignment 3
     Revision History
        Jaden Ahn, 2018.03.24 : Created
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/ADJABanner.jsp" />
<section>
    <h2>eLoan</h2>
    <table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>QOH</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="item" items="${applicationScope.loanitems}">
            <tr>
                <td>${pageScope.item.code}</td>
                <td>${pageScope.item.description}</td>
                <td class="right">${pageScope.item.quantity}</td>
                <c:choose>
                    <c:when test="${pageScope.item.quantity == 0}">
                        <td class="right">N/A</td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="/ADJAClub/ADJACart?action=reserve&code=${pageScope.item.code}">Reserve</a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </table>    
</section>
<jsp:include page="/ADJAFooter.jsp" />
