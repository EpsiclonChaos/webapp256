<!-- обратите внимание на spring тэги -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<html>
 
<head>
  <title>Index Page</title>
</head>
 
<body>

<table>
          <tr>
              <th width="500"><form:form method="post"  modelAttribute="group" action="saveGroup">

                    Name: <form:input path="groupName"/>   <br/>
                    <form:button>Save Group</form:button>
                          <form:input  path="id" readonly="true" size="8" disabled="true"/>
                          <form:hidden path="id"/>

                  </form:form>
          </th>
              <th width="500"><form:form method="post"  modelAttribute="product" action="saveProduct">

                    ProductName: <form:input path="productName"/>   <br/>
                    GroupName: <form:select path="groupId">
                      <form:options items="${groupList}" itemValue="id" itemLabel="groupName" />
                     </form:select>  <br/>
                    <form:button>Save Product</form:button>
                  <form:input  path="id" readonly="true" size="8" disabled="true"/>
                          <form:hidden path="id"/>
                  </form:form>
           </th>
          </tr>
<tr>
              <td><h1>Groups</h1>

                   <c:if test="${!empty groupList}">
                       <table>
                           <tr>
                               <th width="60">id</th>
                               <th width="60">name</th>
                               <th width="60">edit</th>
                               <th width="60">delete</th>
                           </tr>
                           <c:forEach items="${groupList}" var="group">
                               <tr>
                                   <td>${group.id}</td>
                                   <td>${group.groupName}</td>
                                   <td><a href="<c:url value='/editGroup/${group.id}'/>">Edit</a></td>
                                   <td><a href="<c:url value='/deleteGroup/${group.id}'/>">Delete</a></td>
                               </tr>
                           </c:forEach>
                       </table>
                   </c:if>
</td>
              <td> <h1>Products</h1>

                   <c:if test="${!empty productList}">
                        <table>
                            <tr>
                                <th width="60">id</th>
                                <th width="60">name</th>
                                <th width="60">groupName</th>
                                <th width="60">edit</th>
                                <th width="60">delete</th>
                            </tr>
                            <c:forEach items="${productList}" var="product">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>${product.productName}</td>
                                    <td>${product.group.groupName}</td>
                                    <td><a href="<c:url value='/editProduct/${product.id}'/>">Edit</a></td>
                                    <td><a href="<c:url value='/deleteProduct/${product.id}'/>">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
</td>
          </tr>
</table>

</body>
 
</html>