<%@ include file="init.jsp" %>

<strong><liferay-ui:message key="welcome-to-the-blade-service-builder-web" /></strong>
<strong>Kazminerals</strong>

<aui:button-row>
	<portlet:renderURL var="editFooURL">
		<portlet:param name="mvcPath" value="/edit_foo.jsp" />
		<portlet:param name="redirect" value="<%= currentURL %>" />
	</portlet:renderURL>

	<aui:button href="<%= editFooURL %>" value="add-foo" />
</aui:button-row>

<liferay-ui:search-container
	total="<%= fooLocalService.getFoosCount() %>"
>
	<liferay-ui:search-container-results
		results="<%= fooLocalService.getFoos(searchContainer.getStart(), searchContainer.getEnd()) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.blade.samples.servicebuilder.model.Foo"
		escapedModel="true"
		modelVar="foo"
	>

		<portlet:renderURL var="viewURL">
			<portlet:param name="mvcPath" value="/view_entry.jsp" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="fooId" value="<%= String.valueOf(foo.getFooId()) %>" />
		</portlet:renderURL>

		<liferay-ui:search-container-column-text
			name="id"
			property="fooId"
			valign="top"
			href="<%=viewURL%>"
		/>

		<liferay-ui:search-container-column-text
			name="field1"
			valign="top"
		>
			<strong><%= foo.getField1() %></strong>

			<br />

			<div class="lfr-asset-categories">
				<liferay-ui:asset-categories-summary
					className="<%= Foo.class.getName() %>"
					classPK="<%= foo.getFooId() %>"
				/>
			</div>

			<div class="lfr-asset-tags">
				<liferay-ui:asset-tags-summary
					className="<%= Foo.class.getName() %>"
					classPK="<%= foo.getFooId() %>"
					message="tags"
				/>
			</div>
		</liferay-ui:search-container-column-text>

		<liferay-ui:search-container-column-text
			property="field2"
			valign="top"
		/>

		<liferay-ui:search-container-column-text
			property="field3"
			valign="top"
		/>

		<liferay-ui:search-container-column-date
			name="field4"
			valign="top"
			value="<%= foo.getField4() %>"
		/>

		<liferay-ui:search-container-column-text
			property="field5"
			valign="top"
		/>

		<liferay-ui:search-container-column-jsp
			cssClass="entry-action"
			path="/foo_action.jsp"
			valign="top"
		/>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>