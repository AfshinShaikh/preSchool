<?php
include_once('includes/config.php'); // Include database connection
session_start();
$userid = $_SESSION['id'];

// Perform the database query
$query = mysqli_query($con, "SELECT * FROM tblenrollment WHERE userid='$userid'");

if (!$query) {
    die("Database query failed: " . mysqli_error($con));
}

// Fetch the results and store them
$enrollments = [];
while ($row = mysqli_fetch_assoc($query)) {
    $enrollments[] = $row;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>PreSchool Enrollment System </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <?php include_once('includes/header.php'); ?>

    <!-- Page Header End -->
    <div class="container-xxl py-5 page-header position-relative mb-5">
        <div class="container py-5">
            <h1 class="display-2 text-white animated slideInDown mb-4">Child Enrollment Status</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Status</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Show Status -->
    <div class="container">
        <h3 class="mb-4">Enrollment Status</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Enrollment Number</th>
                    <th>Posting Date</th>
                    <th>Parent Email</th>
                    <th>Enrollment Status</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if (!empty($enrollments)) {
                    foreach ($enrollments as $enrollment) {
                        // Determine enrollment status
                        $status = $enrollment['enrollStatus'];
                        if ($status === '') {
                            $statusText = '<span class="text-warning fw-bold">Pending</span>';
                        } elseif ($status === 'Accepted') {
                            $statusText = '<span class="text-success fw-bold">Accepted</span>';
                        } elseif ($status === 'Rejected') {
                            $statusText = '<span class="text-danger fw-bold">Rejected</span>';
                        } else {
                            $statusText = '<span class="text-muted">Pending</span>';
                        }

                        // Output table row
                        echo '<tr>
                                <td>' . htmlspecialchars($enrollment['enrollmentNumber']) . '</td>
                                <td>' . htmlspecialchars($enrollment['postingDate']) . '</td>
                                <td>' . htmlspecialchars($enrollment['parentEmail']) . '</td>
                                <td>' . $statusText . '</td>
                              </tr>';
                    }
                } else {
                    echo '<tr><td colspan="4" class="text-center">No enrollments found</td></tr>';
                }
                ?>
            </tbody>
        </table>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
