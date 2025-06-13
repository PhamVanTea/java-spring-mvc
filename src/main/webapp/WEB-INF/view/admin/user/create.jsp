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
                                            <h3>Create a user</h3>
                                            <hr />
                                            <form:form action="/admin/user/create" method="post"
                                                modelAttribute="newUser" enctype="multipart/form-data">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email:</label>
                                                        <form:input class="form-control" type="email" path="email" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Password:</label>
                                                        <form:input class="form-control" type="password"
                                                            path="password" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Phone number:</label>
                                                        <form:input class="form-control" type="tel" path="phone" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Full name:</label>
                                                        <form:input class="form-control" type="text" path="fullName" />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="form-label">Address</label>
                                                        <form:input class="form-control" type="text" path="address" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Role:</label>
                                                        <form:select id="role" class="form-select" path="role.name">
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                                        <input type="file" class="form-control" id="avatarFile"
                                                            accept=".png, .jpg, .jpeg" name="phamtraFile" />
                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <img style="max-height: 250px; display: none;" src=""
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