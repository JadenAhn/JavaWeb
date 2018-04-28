<%-- ADJAELoan.jsp
     Assignment 3
     Revision History
        Aubrey Delong, 2018.03.26 : Created
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/ADJABanner.jsp" />
<section>
    <h2>Your Loan Cart</h2>
    <table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
        </tr>
        <c:set var="total" scope="page" value="${0}"/> 
        <c:forEach var="item" items="${sessionScope.cart.items}">
            <tr>
                <td>${pageScope.item.code}</td>
                <td>${pageScope.item.description}</td>
                <td class="right">${pageScope.item.quantity}</td>
                <c:set var="total" scope="page" value="${pageScope.total + pageScope.item.quantity}"/>
            </tr>
        </c:forEach>
            <tr>
                <td><br></td>
            </tr>            
            <tr>
                <td></td>
                <td class="right">Total:</td>
                <td class="right"><c:out value="${total}"/></td>
            </tr>
    </table>
    
            <p><a href="/ADJAClub/ADJAClearCart">Clear the cart</a></p>
            <p><a href="/ADJAClub/ADJALoan">Return to eLoan</a></p>
</section>
<jsp:include page="/ADJAFooter.jsp" />
