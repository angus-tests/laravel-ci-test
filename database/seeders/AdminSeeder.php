<?php

namespace Database\Seeders;
use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;


class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

      $superAdminRole=Role::where('name', '=', 'Super Admin')->firstOrFail();
      if(config('admin.admin_name')) {
        User::create([
          'name' => config('admin.admin_name'),
          'email' => config('admin.admin_email'),
          'role_id' => $superAdminRole->id,
          'password' => Hash::make(config('admin.admin_password')),
        ]);
      }

    }
}
