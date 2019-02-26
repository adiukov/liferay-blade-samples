<%@ include file="init.jsp" %>

<%
    String redirect = ParamUtil.getString(request, "redirect");

    long fooId = ParamUtil.getLong(request, "fooId");

    Foo foo = null;

    if (fooId > 0) {
        foo = fooLocalService.getFoo(fooId);
    }
%>
<liferay-ui:header
        backURL="<%= redirect %>"
        title='<%= (foo != null) ? String.valueOf(foo.getFooId()) : "new-foo" %>'
/>
<c:if test="<%=foo != null%>">
<ul>
    <li><%=foo.getField1()%></li>
    <li><%=String.valueOf(foo.getField2())%></li>
    <li><%=String.valueOf(foo.getField3())%></li>
    <li><%=foo.getField4().toString()%></li>
    <li><%=foo.getField5()%></li>
</ul>
</c:if>