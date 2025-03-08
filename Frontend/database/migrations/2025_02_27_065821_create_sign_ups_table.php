<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('signup', function (Blueprint $table) {
            $table->id();
            $table->int('nip');
            $table->varchar('nama_lengkap');
            $table->varchar('tahun_masuk');
            $table->varchar('email');
            $table->varchar('username');
            $table->varchar('pass');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('signup');
    }
};
