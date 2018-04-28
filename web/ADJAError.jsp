<%-- ADJAError.jsp
     Assignment 2
     Revision History
        Aubrey Delong, 2018.02.21: Created
--%>

<jsp:include page="/ADJABanner.jsp" />
<section>
    <h2>Java Error</h2>
    <p>Sorry, Java has thrown an exception.</p>
    <p>To continue, click the Back button.</p>

    <h1>Details</h1>
    <p>Type: ${pageContext.exception["class"]}</p>
    <p>Message: ${pageContext.exception.message}</p>
</section>
<jsp:include page="/ADJAFooter.jsp" />

