<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use App\Models\Absensi;
use App\Models\Mahasiswa;
use App\Models\Matkul;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AbsensiController extends Controller
{
    /**
     * Menampilkan daftar absensi
     */
    public function index()
    {
        
        $response = Http::get('http://localhost:8080/Absensi');
        $absensi = $response->json();
        return view ('absensi.index', compact('absensi'));
    }

    /**
     * Menampilkan daftar mahasiswa untuk absensi berdasarkan mata kuliah
     */
    public function show($id)
    {
        
    }

    /**
     * Form untuk mengisi absensi
     */
    public function create()
    {
        $absensi = Absensi::all();
        return view('absensi.create', ['absensi' => $absensi]);
    }

    /**
     * Simpan data absensi yang diisi dosen
     */
    public function store(Request $request)
    {
        $request->merge([
            'keterangan' => json_encode($request->keterangan),
        ]);

        $request->validate([
            'pertemuan' => 'required|integer',
            'keterangan' => 'required|array',
            
        ]);

        foreach ($request->keterangan as $npm => $keterangan) {
            Absensi::create([
                'npm' => $npm,
                'id_dosen' => $request->id_dosen,
                'id_matkul' => $request->id_matkul,
                'pertemuan' => $request->pertemuan,
                'keterangan' => $keterangan,
            ]);
            
        
            return redirect()->route('absensi.index')->with('success', 'Absensi berhasil disimpan.');
    }
    
}
}
