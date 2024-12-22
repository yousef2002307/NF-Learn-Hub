<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>{{ config('app.name') }}</title>
</head>

<style>
    .card-footer, .progress {
        display: none;
    }
</style>

<body>
@php
    $theid = isset($id) ? $id : 3;
@endphp
<button style="background-color: blue; position: fixed; top: 50%; left: 0; color: white; padding: 10px; border: none; cursor: pointer;">
    <a href="https://omarroshdy.com/upload" style="color: white; text-decoration: none;">Go, back to main site</a>
</button>
<div class="container pt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">
                    <h5>Upload File</h5>
                </div>

                <div class="card-body">
                    <div class="form-group mb-3">
                        <label for="title">Title</label>
                        <input type="text" id="title" name="title" class="form-control" placeholder="Title" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="description">Description</label>
                        <input type="text" id="description" name="description" class="form-control" placeholder="Description" />
                    </div>
                    <div class="form-group mb-3">
                        <label for="studyyear">Study Year</label>
                        <select id="studyyear" name="studyyear" class="form-control">
                            <option value="1">Year 1</option>
                            <option value="2">Year 2</option>
                            <option value="3">Year 3</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="image">Image</label>
                        <input type="file" id="image" name="image" class="form-control" />
                    </div>
                    <input type="hidden" value="{{ $theid }}" id="id" name="id">
                    <div id="upload-container" class="text-center">
                       
                        <button id="browseFile" class="btn btn-primary">Browse video </button>
                    </div>
                    <div class="progress mt-3" style="height: 25px">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%; height: 100%">75%</div>
                    </div>
                </div>

                <div class="card-footer p-4">
                    <video id="videoPreview" src="" controls style="width: 100%; height: auto"></video>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Resumable JS -->
<script src="https://cdn.jsdelivr.net/npm/resumablejs@1.1.0/resumable.min.js"></script>

<script type="text/javascript">
    let browseFile = $('#browseFile');
    let resumable = new Resumable({
        target: '{{ route('upload.video') }}',
        query: function() {
            return {
                _token: '{{ csrf_token() }}',
                title: $('#title').val(),
                description: $('#description').val(),
                studyyear: $('#studyyear').val(),
                id: $('#id').val(),
                image: $('#image')[0].files[0]
            };
        },
        fileType: ['mp4'],
        headers: {
            'Accept': 'application/json'
        },
        testChunks: false,
        throttleProgressCallbacks: 1,
    });

    resumable.assignBrowse(browseFile[0]);

    resumable.on('fileAdded', function (file) { // trigger when file picked
        showProgress();
        resumable.upload() // to actually start uploading.
    });

    resumable.on('fileProgress', function (file) { // trigger when file progress update
        updateProgress(Math.floor(file.progress() * 100));
    });

    resumable.on('fileSuccess', function (file, response) { // trigger when file upload complete
        response = JSON.parse(response)
        progress.hide();
        alert("video finished uploading");
        this.location.reload();
    });

    resumable.on('fileError', function (file, response) { // trigger when there is any error
        alert('file uploading error.')
        this.location.reload();
    });

    let progress = $('.progress');
    function showProgress() {
        progress.find('.progress-bar').css('width', '0%');
        progress.find('.progress-bar').html('0%');
        progress.find('.progress-bar').removeClass('bg-success');
        progress.show();
    }

    function updateProgress(value) {
        progress.find('.progress-bar').css('width', `${value}%`)
        progress.find('.progress-bar').html(`${value}%`)
    }

    function hideProgress() {
        progress.hide();
    }
</script>
</body>
</html>