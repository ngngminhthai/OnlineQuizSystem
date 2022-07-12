<%-- 
    Document   : Sidebar
    Created on : Jun 17, 2022, 9:35:32 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="page-sidebar p-0">
    <a class="filter_links" data-toggle="collapse" href="#fltbox" role="button" aria-expanded="false" aria-controls="fltbox">Open Advance Filter<i class="fa fa-sliders-h ml-2"></i></a>							
    <div class="collapse" id="fltbox">
        <!-- Find New Property -->
        <div class="sidebar-widgets p-4">

            <div class="form-group">
                <div class="input-with-icon">
                    <input type="text" class="form-control" placeholder="Search Your Cources">
                    <i class="ti-search"></i>
                </div>
            </div>

            <!--            <div class="form-group">
                            <div class="simple-input">
                                                    <select id="cates" class="form-control select2-hidden-accessible" data-select2-id="cates" tabindex="-1" aria-hidden="true">
                                                        <option value="" data-select2-id="2">&nbsp;</option>
                                                        <option value="1">IT &amp; Software</option>
                                                        <option value="2">Banking</option>
                                                        <option value="3">Medical</option>
                                                        <option value="4">Insurence</option>
                                                        <option value="5">Finance &amp; Accounting</option>
                                                    </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="1" style="width: 322px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-cates-container"><span class="select2-selection__rendered" id="select2-cates-container" role="textbox" aria-readonly="true"><span class="select2-selection__placeholder">Choose Category</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                <input>
                            </div>
                        </div>-->

            <div class="form-group">
                <h6>Category</h6>
                <ul class="no-ul-list mb-3">
                    <c:forEach items="${listCategory}" var="c">
                        <li>
                            <input id="aa-41" class="checkbox-custom" name="aa-41" type="checkbox">
                            <label for="aa-41" class="checkbox-custom-label">${c.catName}<i class="count">${c.subjectQuantity}</i></label>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="form-group">
                <div>
                    <label>
                        Subject Date From:
                    </label>
                    <input class="form-control" type="date">
                </div>

                <div>
                    <label>
                        Subject Date To:
                    </label>
                    <input class="form-control" type="date">
                </div>
            </div>
            
            <div class="form-group">
                <h6>Featured subject</h6>
                <ul class="no-ul-list mb-3">
                    <c:forEach items="${features}" var="f">
                        <li>
                            <label for="l4" class="checkbox-custom-label">${f.subjectName}</label>
                        </li>
                    </c:forEach>

                </ul>
            </div>



            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 pt-4">
                    <button class="btn theme-bg rounded full-width">Apply Filter</button>
                </div>
            </div>

        </div>
    </div>
</div>
