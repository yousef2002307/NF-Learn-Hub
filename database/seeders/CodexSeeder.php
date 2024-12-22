<?php

namespace Database\Seeders;

use App\Models\Codex;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CodexSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Codex::factory()->count(10)->create();
    }
}
