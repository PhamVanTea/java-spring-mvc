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
                    <title>Detail Product - $${product.name}</title>
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
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <h1 class="mt-4">Orders</h1>
                                            <ol class="breadcrumb mb-4">
                                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                <li class="breadcrumb-item active"><a href="/admin/product">Order</a>
                                                </li>
                                                <li class="breadcrumb-item active">View details</li>
                                            </ol>
                                            <div class="d-flex justify-content-between">
                                                <h3>Order detail with id = ${id}</h3>
                                            </div>

                                            <hr />

                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover">
                                                    <thead class="table-light">
                                                        <tr>
                                                            <!-- <th scope="col">Sản phẩm</th> -->
                                                            <th scope="col">Tên</th>
                                                            <th scope="col">Giá cả</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Thành tiền</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="od" items="${orderDetails}">
                                                            <tr>
                                                                <!-- <td><img src="${pageContext.request.contextPath}/images/${od.product.image}"
                                                                        width="80px" /></td> -->
                                                                <td>${od.product.name}</td>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${od.price}" /> đ
                                                                </td>
                                                                <td>${od.quantity}</td>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${od.price * od.quantity}" /> đ
                                                                </td>

                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <a href="/admin/order" class="btn btn-success mt-3">Back</a>

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