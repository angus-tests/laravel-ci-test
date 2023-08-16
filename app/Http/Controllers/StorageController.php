<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;

class StorageController extends Controller
{
    /**
     * Fetch an image from /storage/app/public/images
     */
    public function image($path)
    {
      return $this->serveFileFromPath('app/public/images/' . $path);
    }

    /**
     * Fetch a file from /storage/app
     */
    public function storage($path)
    {
        return $this->serveFileFromPath('app/' . $path);
    }

    /**
     * Helper function to serve a file from a given path.
     */
    private function serveFileFromPath($path)
    {
        $storagePath = storage_path($path);
        
        if (!File::exists($storagePath) || File::isDirectory($storagePath)) {
          abort(404);
        }

        $mimeType = File::mimeType($storagePath);
        
        return response()->file($storagePath, ['Content-Type' => $mimeType]);
    }
}
