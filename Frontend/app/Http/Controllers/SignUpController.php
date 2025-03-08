<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SignUp;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class SignUpController extends Controller
{
    /**
     * Menampilkan halaman pendaftaran (Sign Up).
     */
    public function showSignUpForm()
    {
        return view('auth.signup'); 
    }

    /**
     * Memproses pendaftaran pengguna baru.
     */
    public function signup(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'nip' => 'required',
            'nama_lengkap' => 'required',
            'tahun_masuk' => 'required',
            'email' => 'required|email',
            'username' => 'required',
            'pass' => 'required|confirmed', // Harus dikonfirmasi dengan password_confirmation
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Membuat pengguna baru
        $signup = SignUp::create([
            'nip' => $request->nip,
            'nama_lengkap' => $request->nama_lengkap,
            'tahun_masuk' => $request->tahun_masuk,
            'email' => $request->email,
            'username' => $request->username,
            'pass' => Hash::make($request->pass),
        ]);

        // Login otomatis setelah registrasi
        Auth::login($signup);

        return redirect()->route('dashboard')->with('success', 'Sign Up berhasil!');
    }
}
