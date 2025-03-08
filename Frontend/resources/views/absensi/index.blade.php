@extends('layout')
@section('title','Daftar Hadir')
@section('judul','Daftar Hadir')
@section('isi')
@if (Session::has('create'))
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Data Berhasil Di Tambah!</strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
@endif
@if (Session::has('delete'))
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Data Berhasil Di Hapus!</strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
@endif
@if (Session::has('update'))
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>Data Berhasil Di Edit!</strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
@endif
<div class="container">
    <a href="{{ route('absensi.create')}}">
        <button class="btn btn-icon btn-3 btn-danger" type="button">
            <span class="btn-inner--icon"><i class="ni ni-button-play"></i></span>
            <span class="btn-inner--text">Isi Daftar Hadir</span>
        </button>
    </a>
    <table class="table table-striped table-sm">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">ID Kehadiran</th>
                <th scope="col">NPM</th>
                <th scope="col">ID Dosen</th>
                <th scope="col">Pertemuan 1</th>
                <th scope="col">Pertemuan 2</th>
                <th scope="col">Pertemuan 3</th>
                <th scope="col">Pertemuan 4</th>
                <th scope="col">Pertemuan 5</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($absensi as $data)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $data->id_kehadiran }}</td>
                <td>{{ $data->npm }}</td>
                <td>{{ $data->id_dosen }}</td>
                <td>{{ $data->pertemuan }}</td>
                <td>{{ $data->keterangan }}</td>
                <td>
                      <a href="{{ url('absensi/edit/'.$data->id) }}">
                          <button class="btn btn-primary">EDIT</button>
                      </a>
                      <a href="{{ url('absensi/destroy/'.$data->id)}}">
                        <button class="btn btn-danger">HAPUS</button>
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection