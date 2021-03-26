<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TambahDbPemasukan extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('pemasukan', function (Blueprint $table) {
			$table->bigIncrements('id');
			$table->string('nominal');
			$table->date('tanggal');
			$table->string('kategori', 4);
			$table->longText('keterangan')->nullable();
			$table->string('status', 3)->default('BLM');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('pemasukan');
	}
}
