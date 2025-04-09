<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


//matches localhost:8888/lumen/public/
$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/consoles', 'ConsoleController@getAll');
$router->get('/consoles/{id}', 'ConsoleController@getOne');
$router->post('/consoles/add', 'ConsoleController@save');
$router->post('/consoles/edit/{id}', 'ConsoleController@update');
$router->delete('/consoles/delete/{id}', 'ConsoleController@delete');
$router->get('/test-db', function () {
    return DB::select('SHOW TABLES');
});
















