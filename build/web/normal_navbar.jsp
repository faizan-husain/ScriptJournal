<style>
    /* Custom active and hover styles */
    .dropdown-item.active,
    .dropdown-item:active {
        background-color: #5D4037 !important; /* Green background */
        color: white !important;
    }

    .dropdown-item:hover {
        background-color: lightgray !important; /* Darker green on hover */
        color: black !important;
    }
    .poster-image {
        width: 100% !important;
        height: auto !important;
        object-fit: contain;
        max-height: 400px;
    }
</style>
<!--navbar code-->
<nav class="navbar sticky-top navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span><i> Script<b style="margin-left: 1.5px">Journal</b></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="about_page.jsp">About</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="index.jsp">All Posts</a>
                    <a class="dropdown-item" href="register_page.jsp">Programming Languages</a>
                    <a class="dropdown-item" href="register_page.jsp">Web Development</a>
                    <a class="dropdown-item" href="register_page.jsp">Database</a>
                    <a class="dropdown-item" href="register_page.jsp">Mobile Development</a>
                    <a class="dropdown-item" href="register_page.jsp">Artificial Intelligence</a>
                    <a class="dropdown-item" href="register_page.jsp">Machine Learning</a>
                    <a class="dropdown-item" href="register_page.jsp">Cloud Computing</a>
                    <a class="dropdown-item" href="register_page.jsp">DevOps</a>
                    <a class="dropdown-item" href="register_page.jsp">Data Science</a>
                    <a class="dropdown-item" href="register_page.jsp">Data Structure & Algorithms</a>
                    <a class="dropdown-item" href="register_page.jsp">Software Architecture</a>
                    <a class="dropdown-item" href="register_page.jsp">Networking</a>
                    <a class="dropdown-item" href="register_page.jsp">Internet of Things</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://faizan-husain.github.io/.com/" target="_blank">Developer</a>
            </li>

        </ul>
        <ul class="navbar-nav mr-right">


            <li class="nav-item">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user"></span> Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Register</a>
            </li>

        </ul>
    </div>
</nav>