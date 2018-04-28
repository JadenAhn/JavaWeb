<%-- 
    Document   : ADJAConfirmMemberDelete
    Created on : Apr 11, 2018, 11:24:46 AM
    Author     : Adelong7545
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page = "ADJABanner.jsp"/>
<section>
    <h2>Do You Want To Delete This Member?</h2>
    <br>
    <p id="message"><i>${message}</i></p>
    <form action="ADJAMemberAdmin" method="post">
        <table>
            <tr>
                <th>
                    <label for="fullname">Full Name:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="fullname"
                    name="fullname" value="${member.fullName}" readonly/>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="email">Email:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="email"
                           name="email" value="${member.emailAddress}" readonly/>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="phone">Phone:</label>
                </th>
                <td>
                    <input type="text" style="width:100px" id="phone"
                           name="phone" value="${member.phoneNumber}" readonly/>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="program">IT Program:</label>
                </th>
                <td>
                    <select id="program" name="program" disabled="disabled">
                        <c:choose>
                            <c:when test="${member.programName == 'CAD'}">
                                <option value="CAD" selected="selected">CAD</option>
                            </c:when>
                            <c:otherwise>
                                <option value="CAD">CAD</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.programName == 'CP'}">
                                <option value="CP" selected="selected">CP</option>
                            </c:when>
                            <c:otherwise>
                                <option value="CP">CP</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.programName == 'CPA'}">
                                <option value="CPA" selected="selected">CPA</option>
                            </c:when>
                            <c:otherwise>
                                <option value="CPA">CPA</option>
                            </c:otherwise>
                        </c:choose>  
                        <c:choose>        
                            <c:when test="${member.programName == 'ITID'}">
                                <option value="ITID" selected="selected">ITID</option>
                            </c:when>
                            <c:otherwise>
                                <option value="ITID">ITID</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.programName == 'ITSS'}">
                                <option value="ITSS" selected="selected">ITSS</option>
                            </c:when>
                            <c:otherwise>
                                <option value="ITSS">ITSS</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.programName == 'MSD'}">
                                <option value="MSD" selected="selected">MSD</option>
                            </c:when>
                            <c:otherwise>
                                <option value="MSD">MSD</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.programName == 'Others'}">
                                <option value="Others" selected="selected">Others</option>
                            </c:when>
                            <c:otherwise>
                                <option value="Others">Others</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="year">Year Level:</label>
                </th>
                <td>
                    <select id="year" name="year" disabled="disabled">
                        <c:choose>
                            <c:when test="${member.yearLevel == 1}">
                                <option value="1" selected="selected">1</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">1</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.yearLevel == 2}">
                                <option value="2" selected="selected">2</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">2</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>        
                            <c:when test="${member.yearLevel == 3}">
                                <option value="3" selected="selected">3</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">3</option>
                            </c:otherwise>
                        </c:choose>  
                        <c:choose>        
                            <c:when test="${member.yearLevel == 4}">
                                <option value="4" selected="selected">4</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">4</option>
                            </c:otherwise>
                        </c:choose>
                    </select>                        
                </td>
            </tr>
            <tr>
                <th></th>
                <td>   
                    <input type="hidden" name="action" value="deleteMember"/>
                    <input type="submit" value="Yes"/>
                    <input type="button" name="no" value="No" onclick="javascript:frmCancel.submit();"/> 
                </td>
            </tr>
        </table>
    </form>
    <form name="frmCancel" action="ADJAMemberAdmin" method="get">
        <input type="hidden" name="action" value="displayMembers"/>
    </form>
</section>
<jsp:include page = "ADJAFooter.jsp"/>
