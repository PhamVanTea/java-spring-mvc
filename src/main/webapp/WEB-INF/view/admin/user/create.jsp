<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!doctype html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport"
                    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Create Users</title>
                <link href="/css/bootstrap.min.css" rel="stylesheet">
                <script src="/js/bootstrap.bundle.min.js"></script>
                <script src="/js/jquery-3.7.1.min.js"></script>

            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Create a user</h3>
                            <hr />
                            <form:form action="/admin/user/create" method="post" modelAttribute="newUser">
                                <div class="mb-3">
                                    <label class="form-label">Email:</label>
                                    <form:input class="form-control" type="email" path="email" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password:</label>
                                    <form:input class="form-control" type="password" path="password" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone number:</label>
                                    <form:input class="form-control" type="tel" path="phone" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Full name:</label>
                                    <form:input class="form-control" type="text" path="fullName" />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address</label>
                                    <form:input class="form-control" type="text" path="address" />
                                </div>
                                <button type="submit" class="btn btn-primary">Create</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>