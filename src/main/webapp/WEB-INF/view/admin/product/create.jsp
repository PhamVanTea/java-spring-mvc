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
                <title>Create User - SB Admin</title>
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
                                    <li class="breadcrumb-item active">Products</li>
                                </ol>
                                <div class=" mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a product</h3>
                                            <hr />
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Name:</label>
                                                        <form:input class="form-control" type="text" path="name" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Price:</label>
                                                        <form:input class="form-control" type="text" path="price" />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="form-label">Details description:</label>
                                                        <form:textarea class="form-control" type="text"
                                                            path="detailDesc" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Short description:</label>
                                                        <form:input class="form-control" type="text" path="shortDesc" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Quantity:</label>
                                                        <form:input class="form-control" type="number"
                                                            path="quantity" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="APPLE">Apple (Macbook)</form:option>
                                                            <form:option value="ASUS">Asus</form:option>
                                                            <form:option value="LENOVO">Lenovo</form:option>
                                                            <form:option value="DELL">Dell</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="ACER">Acer</form:option>
                                                        </form:select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="GAMING">Gaming</form:option>
                                                            <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                            </form:option>
                                                            <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                            </form:option>
                                                            <form:option value="MONG-NHE">Mỏng nhẹ
                                                            </form:option>
                                                            <form:option value="DOANH-NHAN">Doanh Nhân
                                                            </form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="avatarFile" class="form-label">Image:</label>
                                                        <input type="file" class="form-control" id="avatarFile"
                                                            accept=".png, .jpg, .jpeg" name="phamtraFile" />
                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview">
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary mt-4">Create</button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </main>

                        <footer class=" bg-light mt-auto">
                            <jsp:include page="../layout/footer.jsp" />
                        </footer>
                    </div>
                </div>

                <script src="/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="/js/jquery-3.7.1.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </body>

            </html>