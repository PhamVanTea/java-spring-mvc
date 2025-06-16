<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <h1 class="mt-4">Manage Products</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Products</li>
                            </ol>

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3>Table Products</h3>
                                <a href="/admin/product/create" class="btn btn-primary">Create a product</a>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Factory</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td>${product.id}</td>
                                                <td>${product.name}</td>
                                                <td>${product.price}</td>
                                                <td>${product.factory}</td>
                                                <td>
                                                    <a href="/admin/product/show/${product.id}"
                                                        class="btn btn-sm btn-success">View</a>
                                                    <a href="/admin/product/update/${product.id}"
                                                        class="btn btn-sm btn-warning">Update</a>
                                                    <a href="/admin/product/delete/${product.id}"
                                                        class="btn btn-sm btn-danger">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div> <!-- Đóng container-fluid -->
                    </main>

                    <footer class="bg-light mt-auto">
                        <jsp:include page="../layout/footer.jsp" />
                    </footer>
                </div> <!-- Đóng layoutSidenav_content -->
            </div> <!-- Đóng layoutSidenav -->

            <script src="/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
        </body>


        </html>