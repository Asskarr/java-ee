<%@ page import="app.domain.Task" %><%--
  Created by IntelliJ IDEA.
  User: nursu
  Date: 23.09.2023
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Task task = (Task) request.getAttribute("task");

%>
<html>
<head>
    <title>Details</title>
    <%@ include file="/import/frontend-libs.jsp" %>
    <%@ include file="/import/navbar.jsp" %>
</head>
<body>
<div class="container">
    <div class="row mt-5">
        <h1 class="display-3"><%=task.getTitle()%></h1>
    </div>
    <div class="row mt-5">
        <form action="/update" method="post">
            <input type="hidden" value="<%=task.getId()%>" name="task_id">
            <div class="form-group">
                <label for="table_title_input">Наименование:</label>
                <input type="text" id="table_title_input" name="task_title" class="form-control"
                       value="<%=task.getTitle()%>"
                       required>
            </div>
            <div class="form-group mt-3">
                <label for="table_description_input">Описание:</label>
                <input type="text" id="table_description_input" name="task_description"
                       class="form-control"
                       value="<%=task.getDescription()%>"
                       required>
            </div>
            <div class="form-group mt-3">
                <label for="table_deadLine_date_input">Крайний срок:</label>
                <input type="date" id="table_deadLine_date_input" name="task_deadLine_date"
                       value="<%=task.getDeadLineDate()%>"
                       class="form-control" required>
            </div>
            <div class="form-group mt-3">
                <label for="task_is_done_input">Выполнено:</label>
                <select name="task_is_done" class="form-select" id="task_is_done_input" required>
                    <option value="true"
                            <%
                                if (task.isDone()) {
                            %>
                            selected
                            <%
                                } else {
                                }
                            %>
                    >Yes</option>
                    <option value="false"
                            <%
                                if (!task.isDone()) {
                            %>
                            selected
                            <%
                                } else {
                                }
                            %>
                    >No
                    </option>
                </select>
            </div>
            <div class="form-group mt-3 row">
                <button type="submit" class="btn btn-success">Сохранить</button>
            </div>
        </form>
        <form action="/delete" method="post">
            <input type="hidden" value="<%=task.getId()%>" name="task_id">
        <div class="form-group mt-3 row">
            <button type="submit" class="btn btn-danger">Удалить</button>
        </div>
        </form>
    </div>
</div>
</body>
</html>
