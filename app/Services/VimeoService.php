<?php

namespace App\Services;

use Vimeo\Vimeo;

class VimeoService
{
    protected $client;

    public function __construct()
    {
        // $config = config('vimeo');
        $clientId = env('VIMEO_CLIENT_ID', config('vimeo.client_id'));
        $clientSecret = env('VIMEO_CLIENT_SECRET', config('vimeo.client_secret'));
        $accessToken = env('VIMEO_ACCESS_TOKEN', config('vimeo.access_token'));
        $this->client = new Vimeo($clientId, $clientSecret, $accessToken);
    }

    public function uploadVideo($videoPath, $title, $description)
    {
        $uri = $this->client->upload($videoPath, [
            'type' => 'video',
            'name' => $title,
            'description' => $description,
        ]);

        // Extract video information from the response (e.g., video ID, URL, embed code)
        $videoData = $this->client->request($uri);

        return $videoData;
    }
}