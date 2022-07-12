<%-- 
    Document   : AdminSidebar
    Created on : Jun 26, 2022, 11:24:42 PM
    Author     : Halinh
--%>
<div class="col-lg-3 col-md-3">
    <div class="dashboard-navbar">
        <div class="d-user-avater">
            <img src="https://via.placeholder.com/500x500" class="img-fluid avater" alt="">
            <h4>Admin</h4>
            <span>Senior Designer</span>
            <div class="elso_syu89">

            </div>
            <div class="elso_syu77">
            </div>
        </div>

        <div class="d-navigation">
            <ul id="side-menu">
                <li class="dropdown">
                    <a href="javascript:void(0);"><i class="fas fa-user"></i>Users<span class="ti-angle-left"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="admin/listUsers">List users</a></li>
                        <li><a href="addUser">Add user</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);"><i class="fas fa-cog"></i>Settings<span class="ti-angle-left"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="setting">List Settings</a></li>
                        <li><a href="addSetting">Add Settings</a></li>
                    </ul>
                </li>
                <li><a href="practicelist?id=${sessionScope.user.userId}&subjectID=-1"><i class="fas fa-layer-group"></i> Pratice List</a></li>
                <li><a href="registration?search=&page=1&name=regId&type=ASC&subName=&status=&from=&to="><i class="fas fa-layer-group"></i> Registration List</a></li>
                <li><a href="postlist"><i class="fas fa-layer-group"></i>Post List</a></li>
                <li><a href="sliderlist?keyword=&page=1&status="><i class="fas fa-layer-group"></i> Slider List</a></li>
                <li><a href="lesson?status=2"><i class="fas fa-layer-group"></i> Lesson List</a></li>
                <li><a href="AdminSubjectList"><i class="fas fa-layer-group"></i> Subject List</a></li>
                <li><a href="questionlist?subject=0&lesson=0&dimension=0&status=-1"><i class="fas fa-layer-group"></i> Question List</a></li>
                <li class="dropdown">
                    <a href="javascript:void(0);"><i class="fas fa-gem"></i>Dimension<span class="ti-angle-left"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="subjectdimension">Dimension Manage</a></li>
                        <li><a href="dimensionadd">Add New Dimension</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
</div>