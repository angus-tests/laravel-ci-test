<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Inertia\Inertia;
use Illuminate\Support\Facades\App;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

   /**
    * Register the exception handling callbacks for the application.
    *
    * @return void
    */
   public function register()
   {
       $this->reportable(function (Throwable $e) {
           //
       });
   }


    public function render($request, Throwable $e)
    {
        $response = parent::render($request, $e);

        if ((!App::environment(['test', 'local'])) && in_array($response->status(), [500, 503, 404, 403])) {
            return Inertia::render('Errors/Index', ['status' => $response->status()])
                ->toResponse($request)
                ->setStatusCode($response->status());
        } elseif ($response->status() === 419) {
            return back()->with([
                'message' => 'The page expired, please try again.',
            ]);
        }

        return $response;
    }
}
