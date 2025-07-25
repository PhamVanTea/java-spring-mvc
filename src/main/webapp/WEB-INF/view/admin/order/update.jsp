<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Update</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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
                                        <li class="breadcrumb-item active"><a href="/admin/order">Orders</a></li>
                                        <li class="breadcrumb-item active">Update</li>
                                    </ol>
                                </div>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a order</h3>
                                            <p>
                                                Order id = ${newOrder.id}    |

                                                Price:
                                                <fmt:formatNumber value="${newOrder.totalPrice}" type="number"
                                                    groupingUsed="true" />
                                                đ
                                            </p>
                                            <form:form action="/admin/order/update" method="post"
                                                modelAttribute="newOrder">
                                                <div class="mb-3">
                                                    <label>User:</label>
                                                    <input type="text" class="form-control"
                                                        value="${newOrder.user.fullName}" readonly />
                                                </div>

                                                <div class="mb-3">
                                                    <label>Status:</label>
                                                    <form:select path="status" class="form-select">
                                                        <form:option value="PENDING">PENDING</form:option>
                                                        <form:option value="SHIPPING">SHIPPING</form:option>
                                                        <form:option value="COMPLETE">COMPLETE</form:option>
                                                        <form:option value="CANCEL">CANCEL</form:option>
                                                    </form:select>
                                                </div>

                                                <form:hidden path="id" />

                                                <button type="submit" class="btn btn-warning">Update</button>
                                            </form:form>
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