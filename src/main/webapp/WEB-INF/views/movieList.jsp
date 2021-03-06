<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@include file="/WEB-INF/views/patterns/header.jsp" %>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

<script>$(document).ready(function() {
    $.noConflict();
    $('#table').DataTable( {
        "paging":   false,
        "ordering": false,
        "info":     false
    } );
} );</script>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h2>&nbsp;</h2>
            <h2>Movie List</h2>

            <p class="lead">Watch the Trailers in the Details!</p>
        </div>

        <table id="table" class="table table-striped table-hover">
            <thead>
            <tr>
                <th></th>
                <th>Title</th>
                <th>Category</th>
                <th>Rating</th>
                <th>Price</th>
                <th>Details</th>
            </tr>
            </thead>
            <c:forEach items="${movies}" var="movie">
                <tr>
                    <td><img src="<c:url value="/resources/images/${movie.movieId}.jpg"/>"
                             alt="image" style="width: 50%"/></td>
                    <td>${movie.movieTitle}</td>
                    <td>${movie.movieCategory}</td>


                    <td><span class="imdbRatingPlugin" data-user="ur26317997" data-title="${movie.movieRating}" data-style="p4"><a
                            href="https://www.imdb.com/title/${movie.movieRating}/?ref_=plg_rt_1"><img
                            src="https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/images/imdb_31x14.png" alt=" Aquaman(2018) on IMDb"/></a></span>
                        <script>(function (d, s, id) {
                            var js, stags = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) {
                                return;
                            }
                            js = d.createElement(s);
                            js.id = id;
                            js.src = "https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/js/rating.js";
                            stags.parentNode.insertBefore(js, stags);
                        })(document, "script", "imdb-rating-api");</script>
                        </span>
                    </td>


                    <td><i style="color: yellow" class="fa fa-usd" aria-hidden="true"></i>&nbsp;${movie.moviePrice}</td>
                    <td><a href="<spring:url value="/movieList/movieDetails/${movie.movieId}"/>">
                        <i class="fa fa-info-circle"></i></a></td>
                </tr>
            </c:forEach>


        </table>

<%@include file="/WEB-INF/views/patterns/footer.jsp" %>