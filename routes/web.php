<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/personas/saludo', 'PersonaController@saludo');

Route::get('/calendario', 'Calendario@index');


Route::get('/gmaps', ['as ' => 'gmaps', 'uses' => 'GmapsController@index']);


Route::get('/mapas_angular', [
		'uses' => 'GmapsController@mapas_angular'
]);


Route::get('/cosas',  ['uses' => 'GmapsController@cosas']);
Route::get('/angularfire',  ['uses' => 'GmapsController@angularfire']);
Route::get('/cosastodo',  ['as ' => 'todo', 'uses' => 'GmapsController@todossssss']);




Route::get('/traeme_xml', 'GmapsController@toXml');
Route::post('/traeme_xml', 'GmapsController@toXml');





Route::get('/', [
	'uses' => 'IndexController@index',
	'as' => 'index.index'
	]);

Route::get('/post/{post}', [
		'uses' => 'IndexController@post',
		'as' => 'index.post'
]);




Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
