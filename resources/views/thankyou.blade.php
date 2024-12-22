<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>
<body>
    <div class="container">
        <h1>Thank You! successful payment</h1>
      
    </div>
</body>
</html>
<script>
    setTimeout(function() {
        window.location.href = "/";
    }, 5000); // Redirects after 5 seconds
</script>