<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lesson;




use Vimeo\Vimeo;
use Pion\Laravel\ChunkUpload\Handler\HandlerFactory;
use Pion\Laravel\ChunkUpload\Receiver\FileReceiver;
class VideoUploadController extends Controller
{
    protected $vimeoClient;

    public function __construct()
    {
        $this->vimeoClient = new Vimeo(
            env('VIMEO_CLIENT_ID'),
            env('VIMEO_CLIENT_SECRET'),
            env('VIMEO_ACCESS_TOKEN')
        );
    }
    public function upload(Request $request)
    {
        // return $request->all();
        set_time_limit(0); // Increase maximum execution time
        $request->validate([
          
            'title' => 'required|string',
            'description' => 'required|string',
            "studyyear" => 'required',
             "image" => 'required | image',
             
        ]);
        // $videoPath = $request->file('video')->getRealPath();
    //     $title = $request->input('title');
    //     $description = $request->input('description');
    //    $study_year = $request->input('studyyear');
  
     
 // create the file receiver
 $receiver = new FileReceiver('file', $request, HandlerFactory::classFromRequest($request));

  // check if the upload is success, throw exception or return response you need
  if (!$receiver->isUploaded()) {
    // file not uploaded
    return response()->json(['error' => 'File not uploaded'], 400);
}

$fileReceived = $receiver->receive(); // receive file

 // check if the upload has finished (in chunk mode it will send smaller files)
 if ($fileReceived->isFinished()) {
    if ($request->hasFile('image')) {
        $imagePath = time().'.'.$request->image->extension();  
        $request->image->move(public_path('images'), $imagePath);

    }
    $file = $fileReceived->getFile(); // get file
    $extension = $file->getClientOriginalExtension();
    $fileName = str_replace('.'.$extension, '', $file->getClientOriginalName()); //file name without extension
    $fileName .= '_' . md5(time()) . '.' . $extension; // a unique file name

    // Move the file to a temporary location
    $filePath = storage_path('app/temp/' . $fileName);
    $file->move(storage_path('app/temp'), $fileName);
    
    $response = $this->vimeoClient->upload($filePath, [
        "name" => $request->input('title'),
        "description" => $request->input('description'),
    ]);
     // Delete the temporary file
     unlink($filePath);
    
    // Extract video information from the response (e.g., video ID, URL, embed code)
    $videoData = $this->vimeoClient->request($response);
    
    $videoData =  $videoData['body'];
    $embedded = $videoData['embed']['html'];
    $formattedDuration = $this->getVideoDetails($this->extractVimeoId($request->input('url')));
        $video = new Lesson;
       
        $video->title = $request->input('title');
        $video->description = $request->input('description');
        
        $video->video_id = $this->extractVideoId($videoData['uri']); // Assuming the Vimeo ID is in the 'uri' field
        $video->video_url = $videoData['link']; // Assuming the Vimeo URL is in the 'link' field
        $video->study_year = $request->input('studyyear');
        $video->embeded = $embedded;
    
        $video->poster = $imagePath;
        $video->lecture_id = $request->input('id');
        $video->save();

        return response()->json(['message' => 'Video uploaded successfully', 'video' => $video,"video_info"=>$videoData], 200);
       
}

  // we are in chunk mode, lets send the current progress
  $handler = $fileReceived->handler();

  return response()->json([
      'done' => $handler->getPercentageDone(),
  ]);
      
        
    }

    public function extractVideoId($text)
    {
        // Use a regular expression to match the numeric value
        preg_match('/\d+/', $text, $matches);
    
        // Check if a match was found and return the first match
        return !empty($matches) ? $matches[0] : null;
    }

    protected function saveFile($file, $request)
    {
        $videoPath = $file->getPathname();
        $title = $request->input('title');
        $description = $request->input('description');
        $study_year = $request->input('studyyear');

        // Upload the video to Vimeo
        $response = $this->vimeoClient->upload($videoPath, [
            "name" => $title,
            "description" => $description,
        ]);

        // Extract video information from the response (e.g., video ID, URL, embed code)
        $videoData = $this->vimeoClient->request($response);
        $videoData = $videoData['body'];
        $embedded = $videoData['embed']['html'];

        // Extract relevant information from the videoData and store it in the database
        $video = new Lesson;
        $video->title = $title;
        $video->description = $description;
        $video->video_id = $videoData['uri']; // Assuming the Vimeo ID is in the 'uri' field
        $video->video_url = $videoData['link']; // Assuming the Vimeo URL is in the 'link' field
        $video->study_year = $study_year;
        $video->embeded = $embedded;
        $video->save();

        return response()->json(['message' => 'Video uploaded successfully', 'video' => $video, 'video_info' => $videoData], 200);
    }





public function uploadembeded(Request $request)
{
   
    $request->validate([
        'url' => 'required|url',
        'title' => 'required|string',
        'description' => 'required|string',
        "studyyear" => 'required',
        "embeded" => 'required',
        "image" => 'required | image'
    ]);
 
    if ($request->hasFile('image')) {
        $imagePath = time().'.'.$request->image->extension();  
        $request->image->move(public_path('images'), $imagePath);

    }
   
    $videoId = "videos/" . $this->extractVimeoId($request->input('url'));
    $title = $request->input('title');
    $description = $request->input('description');
    $study_year = $request->input('studyyear');
    $video = new Lesson;
    $video->title = $title;
    $video->description = $description;
    $video->video_url = $request->input('url');
    $video->study_year = $study_year;
 
    $video->embeded = $request->input('embeded');
    $video->poster = $imagePath;
    $video->video_id = $videoId;
    $video->save();
    return response()->json(['message' => 'Video uploaded successfully', 'video' => $video], 200);

}











public function extractVimeoId($url)
{
    // Define the regular expression pattern to match the Vimeo video ID
    $pattern = '/vimeo\.com\/(\d+)/';

    // Use preg_match to extract the video ID from the URL
    if (preg_match($pattern, $url, $matches)) {
        return $matches[1]; // The video ID is captured in the first group
    }

    // Return null if no match is found
    return null;
}















public function getVideoDetails($videoId)
{
    try {
        // Make a request to the Vimeo API to get details of the specific video
        $response = $this->vimeoClient->request("/videos/{$videoId}", [], 'GET');

        // Check if the response is successful
        if ($response['status'] === 200) {
            // Extract video data from the response
            $videoDetails = $response['body'];

            // Convert duration from seconds to hours:minutes:seconds format
            $formattedDuration = $this->convertSecondsToTime($videoDetails['duration']);

            // Add the formatted duration to the response
            $videoDetails['formatted_duration'] = $formattedDuration;
            return $formattedDuration;
            // Return the video details
            return response()->json([
                'message' => 'Video details retrieved successfully',
                'video' => $videoDetails
            ], 200);
        } else {
            return "01:00:00";
            // Handle errors
            return response()->json([
                'error' => 'Failed to retrieve video details',
                'details' => $response
            ], $response['status']);
        }
    } catch (\Exception $e) {
        return "01:00:00";
        // Handle exceptions
        return response()->json([
            'error' => 'An error occurred while retrieving video details',
            'details' => $e->getMessage()
        ], 500);
    }
}

/**
 * Convert seconds to hours:minutes:seconds format
 */
private function convertSecondsToTime($seconds)
{
    $hours = floor($seconds / 3600); // Get the number of hours
    $minutes = floor(($seconds % 3600) / 60); // Get the remaining minutes
    $seconds = $seconds % 60; // Get the remaining seconds

    // Format the time as HH:MM:SS
    return sprintf('%02d:%02d:%02d', $hours, $minutes, $seconds);
}





}
// use Illuminate\Support\Facades\Storage;

// class VideoUploadController extends Controller
// {
//     public function showUploadForm()
//     {
//         return view('upload');
//     }

//     public function upload(Request $request)
//     {
//         $request->validate([
//             'video' => 'required|file', // Max size 20MB
//         ]);

//         // Get the uploaded file
//         $file = $request->file('video');

//         // Store the file in Google Drive
//         $path = Storage::disk('google')->putFile('MrOmarsite', $file);

//         return back()->with('success', 'Video uploaded successfully to Google Drive: ' . $path);
       
//     }
// }
