<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasColumn('employees', 'position')) {
            Schema::table('employees', function (Blueprint $table) {
                $table->string('position')->nullable();
            });
        }
    }

    public function down(): void
    {
        
    }
};
