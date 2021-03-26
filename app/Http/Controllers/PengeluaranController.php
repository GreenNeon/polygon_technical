<?php

namespace App\Http\Controllers;

use App\Http\Requests\CashForm;
use App\Models\Pengeluaran;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class PengeluaranController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Inertia::render('Pengeluaran/Index')->with('pengeluaran_all', Pengeluaran::all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pengeluaran = new Pengeluaran;
        $data = array_combine(
            $pengeluaran->getFillable(),
            array_fill(0, count($pengeluaran->getFillable()), null)
        );
        $pengeluaran->fill($data);
        $initial_data = $pengeluaran->toArray();
        return Inertia::render('Pengeluaran/Create')->with('initial_data', $initial_data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CashForm  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CashForm $request)
    {
        try {
            $validated = $request->validated();
            $pengeluaran = Pengeluaran::create($validated);

            $user = auth()->user();
            User::findOrFail($user->id)
            ->fill(['saldo' => $user->saldo-$pengeluaran->nominal->ammount])
            ->saveOrFail();

            return Redirect::route('dashboard.pengeluaran.edit', [$pengeluaran->id])
                ->with('alert_data', [
                    'type' => 'success',
                    'message' => "Berhasil menambahkan data pengeluaran baru."
                ]);
        } catch (\Throwable $th) {
            return Redirect::back()
                ->with('alert_data', [
                    'type' => 'danger',
                    'message' => 'Gagal menambahkan data pengeluaran baru.'
                ])->with('initial_data', $validated);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pengeluaran  $pengeluaran
     * @return \Illuminate\Http\Response
     */
    public function show(Pengeluaran $pengeluaran)
    {
        return Inertia::render('Pengeluaran/Edit')
            ->with('readonly', true)
            ->with('initial_data', $pengeluaran);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Pengeluaran  $pengeluaran
     * @return \Illuminate\Http\Response
     */
    public function edit(Pengeluaran $pengeluaran)
    {
        return Inertia::render('Pengeluaran/Edit')->with('initial_data', $pengeluaran);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  CashForm  $request
     * @param  \App\Models\Pengeluaran  $pengeluaran
     * @return \Illuminate\Http\Response
     */
    public function update(CashForm $request, Pengeluaran $pengeluaran)
    {
        try {
            $validated = $request->validated();

            $user = auth()->user();
            User::findOrFail($user->id)
            ->fill(['saldo' => $user->saldo+$pengeluaran->nominal->ammount-$validated['nominal']])
            ->saveOrFail();

            $pengeluaran->fill($validated)->saveOrFail();

            return Redirect::back()
                ->with('alert_data', [
                    'type' => 'success',
                    'message' => "Berhasil mengubah data pengeluaran."
                ]);
        } catch (\Throwable $th) {
            return Redirect::back()
                ->with('alert_data', [
                    'type' => 'danger',
                    'message' => 'Gagal Mengubah data pengeluaran.'
                ])->with('initial_data', $validated);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pengeluaran  $pengeluaran
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pengeluaran $pengeluaran)
    {
        try {
            $pengeluaran->delete();
            return Redirect::back(303)
                ->with('alert_data', [
                    'type' => 'success',
                    'message' => "Berhasil menghapus data pengeluaran."
                ]);
        } catch (\Throwable $th) {
            return Redirect::back(303)
                ->with('alert_data', [
                    'type' => 'danger',
                    'message' => 'Gagal menghapus data pengeluaran.'
                ]);
        }
    }
}
