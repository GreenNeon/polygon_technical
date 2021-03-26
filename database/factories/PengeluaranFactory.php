<?php

namespace Database\Factories;

use App\Models\Pengeluaran;
use Illuminate\Database\Eloquent\Factories\Factory;

class PengeluaranFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Pengeluaran::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'nominal' => $this->faker->numberBetween(0, 5000000),
            'tanggal' => $this->faker->date(),
            'kategori' => $this->faker->numberBetween(0, 4),
            'keterangan' => $this->faker->text(),
            'status' => $this->faker->randomElement(array('BLM', 'SDH'))
        ];
    }
}
