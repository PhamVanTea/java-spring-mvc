<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport"
                content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Document</title>

            <link href="/css/bootstrap.min.css" rel="stylesheet">
            <script src="/js/bootstrap.bundle.min.js"></script>
            <script src="/js/jquery-3.7.1.min.js"></script>

        </head>

        <body>
            hello from jsp
            <h1>
                ${phamtra}
            </h1>
            <h2>
                ${test}
            </h2>
            <button class="btn btn-danger">submit</button>
        </body>

        </html>