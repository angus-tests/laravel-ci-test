<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Create the roles table
        Schema::create('roles', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text("name");
            $table->text("code");
            $table->text("description");
            $table->boolean("changeable")->default(1);
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('roles');
    }
};


