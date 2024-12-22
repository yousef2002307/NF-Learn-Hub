<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}"> <!-- Link to your CSS file -->
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa; /* Light background for contrast */
        }
        .container {
            background-color: white; /* White background for the form */
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            width: 300px; /* Fixed width for the form */
        }
        h1 {
            text-align: center; /* Center the heading */
            color: #333; /* Darker text color */
        }
        .form-group {
            margin-bottom: 15px; /* Space between form groups */
        }
        .btn {
            width: 100%; /* Full width button */
            background-color: #007bff; /* Bootstrap primary color */
            color: white; /* White text on button */
            border: none; /* No border */
            padding: 10px; /* Padding for button */
            border-radius: 5px; /* Rounded button */
            cursor: pointer; /* Pointer cursor on hover */
        }
        .btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reset Your Password</h1>

        @if (session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif

        <form method="POST" action="{{ route('password.update') }}">
            @csrf
            <input type="hidden" name="token" value="{{ $token }}">

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" required autofocus class="form-control" value="{{ old('email') }}">
                @error('email')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>

            <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" name="password" id="password" required class="form-control">
                @error('password')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>

            <div class="form-group">
                <label for="password_confirmation">Confirm Password</label>
                <input type="password" name="password_confirmation" id="password_confirmation" required class="form-control">
            </div>

            <button type="submit" class="btn">Reset Password</button>
        </form>
    </div>
</body>
</html>
