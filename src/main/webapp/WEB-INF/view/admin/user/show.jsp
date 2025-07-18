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
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>

                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3>Table Users</h3>
                                    <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Họ và Tên</th>
                                                <th scope="col">Chức vụ</th>
                                                <th scope="col">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users1}">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.fullName}</td>
                                                    <td>${user.role.name}</td>
                                                    <td>
                                                        <a href="/admin/user/show/${user.id}"
                                                            class="btn btn-sm btn-success">Xem</a>
                                                        <a href="/admin/user/update/${user.id}"
                                                            class="btn btn-sm btn-warning">Cập nhật</a>
                                                        <a href="/admin/user/delete/${user.id}"
                                                            class="btn btn-sm btn-danger">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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