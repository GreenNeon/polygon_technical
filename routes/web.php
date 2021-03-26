<?php

use App\Http\Controllers\PemasukanController;
use App\Http\Controllers\PengeluaranController;
use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
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
    return redirect('/login');
});

Route::prefix('dashboard')->middleware(['auth:sanctum', 'verified'])->name('dashboard.')->group(function () {
    // Dashboard Index
    Route::get('/', function () {
        return Inertia::render('Dashboard');
    })->name('index');

    Route::resource('pemasukan', PemasukanController::class);
    Route::resource('pengeluaran', PengeluaranController::class);
});
