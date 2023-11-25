<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminAuthSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'dixita',
            'email' => 'dixitagondaliya98@gmail.com',
            'mobile' => '1234567890',
            'role' => 'admin',
            'password' => Hash::make('12345678'),
            'text_password' => '12345678',
        ]);
    }
}
