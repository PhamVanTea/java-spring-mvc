<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Delete Users</title>
                <link href="/css/bootstrap.min.css" rel="stylesheet">
                <script src="/js/bootstrap.bundle.min.js"></script>
                <script src="/js/jquery-3.7.1.min.js"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <h3>Delete the user with id = ${id}</h3>
                            <hr />
                            <div class="alert alert-danger">
                                Are you sure to delete this user ?
                            </div>
                            <form:form action="/admin/user/delete" modelAttribute="newUser" method="post">
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">Id:</label>
                                    <form:input value="${id}" class="form-control" type="text" path="id" />
                                </div>
                                <button class="btn btn-danger">Confirm</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>