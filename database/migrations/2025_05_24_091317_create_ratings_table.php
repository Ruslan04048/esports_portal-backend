<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('ratings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('post_id')
                  ->constrained()
                  ->cascadeOnDelete();
            $table->foreignId('user_id')
                  ->constrained()
                  ->cascadeOnDelete();
            // Сам рейтинг (1–5)
            $table->unsignedTinyInteger('rating');
            $table->timestamps();

            $table->unique(['post_id', 'user_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('ratings');
    }
};
