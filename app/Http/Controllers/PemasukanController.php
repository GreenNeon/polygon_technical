<?php

namespace App\Http\Controllers;

use App\Http\Requests\CashForm;
use App\Models\Pemasukan;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class PemasukanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Inertia::render('Pemasukan/Index')->with('pemasukan_all', Pemasukan::all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pemasukan = new Pemasukan;
        $data = array_combine(
            $pemasukan->getFillable(),
            array_fill(0, count($pemasukan->getFillable()), null)
        );
        $pemasukan->fill($data);
        $initial_data = $pemasukan->toArray();
        return Inertia::render('Pemasukan/Create')->with('initial_data', $initial_data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CashForm $request
     * @return \Illuminate\Http\Response
     */
    public function store(CashForm $request)
    {
        try {
            $validated = $request->validated();
            $pemasukan = Pemasukan::create($validated);

            $user = auth()->user();
            User::findOrFail($user->id)
            ->fill(['saldo' => $user->saldo+$pemasukan->nominal->ammount])
            ->saveOrFail();

            return Redirect::route('dashboard.pemasukan.edit', [$pemasukan->id])
                ->with('alert_data', [
                    'type' => 'success',
                    'message' => "Berhasil menambahkan data pemasukan baru."
                ]);
        } catch (\Throwable $th) {
            return Redirect::back()
                ->with('alert_data', [
                    'type' => 'danger',
                    'message' => 'Gagal menambahkan data pemasukan baru.'
                ])->with('initial_data', $validated);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pemasukan  $pemasukan
     * @return \Illuminate\Http\Response
     */
    public function show(Pemasukan $pemasukan)
    {
        return Inertia::render('Pemasukan/Edit')
            ->with('readonly', true)
            ->with('initial_data', $pemasukan);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Pemasukan  $pemasukan
     * @return \Illuminate\Http\Response
     */
    public function edit(Pemasukan $pemasukan)
    {
        return Inertia::render('Pemasukan/Edit')->with('initial_data', $pemasukan);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pemasukan  $pemasukan
     * @return \Illuminate\Http\Response
     */
    public function update(CashForm $request, Pemasukan $pemasukan)
    {
        try {
            $validated = $request->validated();

            $user = auth()->user();
            User::findOrFail($user->id)
            ->fill(['saldo' => $user->saldo-$pemasukan->nominal->ammount+$validated['nominal']])
            ->saveOrFail();

            $pemasukan->fill($validated)->saveOrFail();
            return Redirect::back()
                ->with('alert_data', [
                    'type' => 'success',
                    'message' => "Berhasil mengubah data pemasukan."
                ]);
        } catch (\Throwable $th) {
            return Redirect::back()
                ->with('alert_data', [
                    'type' => 'danger',
                    'message' => 'Gagal Mengubah data pemasukan.'
                ])->with('initial_data', $validated);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pemasukan  $pemasukan
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pemasukan $pemasukan)
    {
        try {
            $pemasukan->delete();
            return Redirect::back(303)
                ->with('alert_data', [
                    'type' => 'success',
                    'message' => "Berhasil menghapus data pemasukan."
                ]);
        } catch (\Throwable $th) {
            return Redirect::back(303)
                ->with('alert_data', [
                    'type' => 'danger',
                    'message' => 'Gagal menghapus data pemasukan.'
                ]);
        }
    }
}
