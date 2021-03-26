<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // Tambah default user
        DB::table('users')->insert([[
            'name' => 'Bapak Budi',
            'role' => 'OR',
            'saldo' => '0',
            'email' => 'bapakbudi@gmail.com',
            'email_verified_at' => now(),
            'password' => Hash::make('budi'), // password
            'remember_token' => Str::random(10),
        ], [
            'name' => 'Anak Budi',
            'role' => 'AN',
            'saldo' => '0',
            'email' => 'anakbudi@gmail.com',
            'email_verified_at' => now(),
            'password' => Hash::make('budi'), // password
            'remember_token' => Str::random(10),
        ]]);

        // Lainnya
        $this->call([
            PemasukanSeeder::class,
            PengeluaranSeeder::class
        ]);
    }
}
