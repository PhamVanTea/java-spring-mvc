<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                <h1 class="mt-4">Manage Orders</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Orders</li>
                                </ol>

                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3>Table Orders</h3>
                                    <a href="/admin/product/create" class="btn btn-primary">Create a product</a>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Tổng giá</th>
                                                <th scope="col">Người dùng</th>
                                                <th scope="col">Trạng thái</th>
                                                <th scope="col">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr>
                                                    <td>${order.id}</td>

                                                    <td>
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                                    </td>
                                                    <td>${order.user.fullName}</td>
                                                    <td>${order.status}</td>
                                                    <td>
                                                        <a href="/admin/order/${order.id}"
                                                            class="btn btn-sm btn-success">Xem</a>
                                                        <a href="/admin/order/update/${order.id}"
                                                            class="btn btn-sm btn-warning">Cập nhật</a>
                                                        <a href="/admin/order/delete/${order.id}"
                                                            class="btn btn-sm btn-danger">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </main>
                        <footer>
                            <jsp:include page="../layout/footer.jsp" />
                        </footer>
                    </div>
                </div>
                </div>
                <script src="/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>