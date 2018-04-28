<%-- ADJAAddBook.jsp
     Assignment 2
     Revision History
        Aubrey Delong, 2018.02.21: Created
        Jaden Ahn, 2018.03.07 : Changed variable names
--%>
<jsp:include page="/ADJABanner.jsp" />
<section>
    <h2>Add a Book</h2>
    <p id="message"><i>${message}</i></p>
    <form action="ADJAAddBook" method="post">
        <table>
            <tr>
                <th>
                    <label for="code">Code:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="code"
                           name="code" value="${newBook.code}"/>
                </td>
            </tr>
            <tr>
                <th>
                    <label for="description">Description:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="description"
                           name="description" value="${newBook.description}"/>
                </td>
            </tr>            
            <tr>
                <th>
                    <label for="quantity">Quantity:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="quantity"
                           name="quantity" value="${newBook.quantity}"/>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>                   
                    <input type="hidden" name="action" value="save"/>
                    <input type="submit" value="Save"/>
                    <input type="hidden" name="action" value="cancel"/>
                    <input type="submit" name="cancel" value="Cancel" formaction="ADJADisplayBooks" formmethod="post"/>
                </td>
            </tr>
        </table>
    </form>
</section>
<jsp:include page="/ADJAFooter.jsp" />
