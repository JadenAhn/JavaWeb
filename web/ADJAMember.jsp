<%-- 
    Document   : ADJAMember
    Created on : Apr 9, 2018, 3:46:17 PM
    Author     : Adelong7545
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page = "ADJABanner.jsp"/>
<section>
    <h2>New Member Registration Form</h2>
    <br>
    <p id="message"><i>${message}</i></p>
    <form action="ADJAMemberAdmin" method="post">
        <table>
            <tr>
                <th>
                    <label for="fullName">Full Name:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="fullName"
                    name="fullName" value="${member.fullName}"/>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="emailAddress">Email:</label>
                </th>
                <td>
                    <input type="text" style="width:200px" id="emailAddress"
                           name="emailAddress" value="${member.emailAddress}"/>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="phoneNumber">Phone:</label>
                </th>
                <td>
                    <input type="text" style="width:100px" id="phone"
                           name="phoneNumber" value="${member.phoneNumber}"/>
                </td>
            </tr>
             <tr>
                <th>
                    <label for="programName">IT Program:</label>
                </th>
                <td>
                    <select id="programName" name="programName">
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
                    <label for="yearLevel">Year Level:</label>
                </th>
                <td>
                    <select id="yearLevel" name="yearLevel">
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
                    <input type="hidden" name="action" value="updateMember"/>
                    <input type="submit" value="Save"/>
                    <input type="button" name="cancel" value="Cancel" onclick="javascript:frmCancel.submit();" /> 
                </td>
            </tr>
        </table>
    </form>
    <form name="frmCancel" action="ADJAMemberAdmin" method="get">
        <input type="hidden" name="action" value="displayMembers"/>
    </form>
</section>
<jsp:include page = "ADJAFooter.jsp"/>