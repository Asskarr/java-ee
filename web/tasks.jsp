<%@ page import="app.domain.Task" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nursu
  Date: 20.09.2023
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task Manager</title>
    <%@ include file="/import/frontend-libs.jsp" %>
    <%@ include file="/import/navbar.jsp" %>
</head>
<body>
<div class="container">
    <div>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            +  Добавить задание
        </button>
    </div>
    <div class="row mt-5">
        <table class="table">
            <thead>
            <th>ID</th>
            <th>Наименование</th>
            <th>Крайний срок</th>
            <th>Выполнено</th>
            <th>Детали</th>
            </thead>
            <tbody>
            <%
                List<Task> tasks = (List<Task>) request.getAttribute("tasksList");
                for (Task task : tasks) {
            %>
            <tr>
                <td><%=task.getId()%>
                </td>
                <td><%=task.getTitle()%>
                </td>
                <td><%=task.getDeadLineDate()%>
                </td>
                <td><%=task.isDone()%>
                </td>
                <td><a href="/details?id=<%=task.getId()%>" class="btn btn-secondary">Details</a></td>
            </tr>

            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="modal-body">
                        <form action="/tasks" method="post">
                            <div class="form-group">
                                <label for="table_title_input">Наименование:</label>
                                <input type="text" placeholder="Наименование..." id="table_title_input" name="task_title" class="form-control"
                                       required>
                            </div>
                            <div class="form-group mt-3">
                                <label for="table_description_input">Описание:</label>
                                <input type="text" placeholder="Описание..." id="table_description_input" name="task_description"
                                       class="form-control" required>
                            </div>
                            <div class="form-group mt-3">
                                <label for="table_deadLine_date_input">Крайний срок:</label>
                                <input type="date" id="table_deadLine_date_input" name="task_deadLine_date"
                                       class="form-control" required>
                            </div>
                            <div class="form-group mt-3">
                                <label for="task_is_done_input">Task is Done:</label>
                                <select name="task_is_done" class="form-select" id="task_is_done_input" required>
                                    <option value="true">Yes</option>
                                    <option value="false" selected>No</option>
                                </select>
                            </div>
                            <div class="form-group mt-3 row" style="padding-left: 360px">
                                <button type="submit" class="btn btn-primary">Добавить</button>
                                <button type="submit" class="btn btn-secondary">Закрыть</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
