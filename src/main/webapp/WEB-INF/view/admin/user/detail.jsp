<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>User detail with id = ${id}</h3>
                                        </div>

                                        <hr />

                                        <div class="card" style="width: 60%;">
                                            <div class="card-header">
                                                User information
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">ID: ${user.id}</li>
                                                <li class="list-group-item">Email: ${user.email}</li>
                                                <li class="list-group-item">FullName: ${user.fullName}</li>
                                                <li class="list-group-item">Role: ${user.role.name}</li>
                                                <li class="list-group-item">Address: ${user.address}</li>
                                            </ul>
                                        </div>
                                        <a href="/admin/user" class="btn btn-success mt-3">Back</a>

                                    </div>
                                </div>
                            </div>
                        </main>

                        <footer class="bg-light mt-auto">
                            <jsp:include page="../layout/footer.jsp" />
                        </footer>
                    </div>
                </div>

                <script src="/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>