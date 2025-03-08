@extends('layout')
@section('title','Input Daftar Hadir')
@section('judul','Daftar Hadir')
@section('isi')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{ route('absensi.store')}}" method="post">
    @csrf
    <div class="form-group mb-2">
        <label>ID Kehadiran</label>
        <input type="text" name="id_kehadiran" class="form-control">
    </div>
    <div class="form-group mb-2">
        <label>NPM</label>
        <input type="text" name="npm" class="form-control">
    </div>
    <div class="form-group mb-2">
        <label>ID Dosen</label>
        <input type="text" name="id_dosen" class="form-control">
    </div>
    <div class="form-group mb-2">
        <label>ID Mata Kuliah</label>
        <input type="text" name="id_matkul" class="form-control">
    </div>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Pertemuan</th>
                    <th>Pertemuan 1</th>
                    <th>Pertemuan 2</th>
                    <th>Pertemuan 3</th>
                    <th>Pertemuan 4</th>
                    <th>Pertemuan 5</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Keterangan</td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="">--Pilih--</option>
                            <option value="H">H</option>
                            <option value="I">I</option>
                            <option value="S">S</option>
                            <option value="A">A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="">--Pilih--</option>
                            <option value="H">H</option>
                            <option value="I">I</option>
                            <option value="S">S</option>
                            <option value="A">A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="">--Pilih--</option>
                            <option value="H">H</option>
                            <option value="I">I</option>
                            <option value="S">S</option>
                            <option value="A">A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="">--Pilih--</option>
                            <option value="H">H</option>
                            <option value="I">I</option>
                            <option value="S">S</option>
                            <option value="A">A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="">--Pilih--</option>
                            <option value="H">H</option>
                            <option value="I">I</option>
                            <option value="S">S</option>
                            <option value="A">A</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="form-group">
        <button class="btn btn-primary" type="submit">Save</button>
        <a href="{{ route('absensi.index') }}" class="btn btn-secondary">Kembali</a>
    </div>
</form>
@endsection
