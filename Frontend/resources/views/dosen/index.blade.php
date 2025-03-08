@extends('layout')
@section('title','Dosen')
@section('judul','Dosen')
@section('isi')
@if (Session::has('create'))
@csrf
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Data Berhasil Di Tambah</strong> You should check in on some of those fields below.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
@endif
@if (Session::has('delete'))
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Data Berhasil Di Hapus!</strong> You should check in on some of those fields below.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
@endif

@if (Session::has('update'))
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong>Data Berhasil Di Edit!</strong> You should check in on some of those fields below.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
@endif
<a href="{{ route('dosen.create')}}">
  <button class="btn btn-icon btn-3 btn-danger" type="button">
      <span class="btn-inner--icon"><i class="ni ni-button-play"></i></span>
    <span class="btn-inner--text">Tambah Dosen</span>
  </button>
</a>
  <div class="table-responsive">
      <table class="table table-striped table-bordered table-layout-fixed">
          <thead>
              <tr>
                <th scope="col" class="text-center w-auto">No.</th>
                <th scope="col" class="text-center w-auto">ID Dosen</th>
                <th scope="col" class="text-center w-auto">Nama Dosen </th>
                <th scope="col" class="text-center w-auto">Aksi</th>
              </tr>
          </thead>
          <tbody>
              @foreach ($dosen as $data)
              <tr>
                  <td class="text-center w-auto">{{ $loop->iteration }}</td>
                  <td class="text-center w-auto">{{ $data['id_dosen'] }}</td>
                  <td class="text-center w-auto">{{ $data['nama_dosen'] }}</td>
                  
                  <td class="text-center ">
                      <a href="{{ route('dosen.edit', $data['id_dosen']) }}">
                          <button class="btn btn-primary text">EDIT</button>
                      </a>
                      <form action="{{ route('dosen.destroy', $data['id_dosen']) }}" method="POST" style="display: inline;">
                          @csrf
                          @method('DELETE')
                          <button type="submit" class="btn btn-danger" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?');">HAPUS</button>
                      </form>
                  </td>
              </tr>   
              @endforeach
          </tbody>
      </table>
  </div>
@endsection