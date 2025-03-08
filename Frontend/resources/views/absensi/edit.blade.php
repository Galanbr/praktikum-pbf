@extends('layout')
@section('title','Edit Daftar Hadir')
@section('judul','Form Edit Daftar Hadir')
@section('isi')
<form action="{{ route('absensi.update', $abseni->id_kehadiran) }}" method="post">
    @csrf
    <div class="form-group mb-2">
        <label>NPM</label>
        <input value="{{ $abseni->npm }}" type="text" name="npm" class="form-control">
    </div>
    <div class="form-group mb-2">
        <label>ID Dosen</label>
        <input value="{{ $abseni->id_dosen }}" type="text" name="id_dosen" class="form-control">
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
                            <option value="H" {{ $abseni->keterangan == 'H' ? 'selected' : '' }}>H</option>
                            <option value="I" {{ $abseni->keterangan == 'I' ? 'selected' : '' }}>I</option>
                            <option value="S" {{ $abseni->keterangan == 'S' ? 'selected' : '' }}>S</option>
                            <option value="A" {{ $abseni->keterangan == 'A' ? 'selected' : '' }}>A</option>
                        </select>
                    </td>
                    <td>
                         <select name="pertemuan" class="form-control">
                            <option value="H" {{ $abseni->keterangan == 'H' ? 'selected' : '' }}>H</option>
                            <option value="I" {{ $abseni->keterangan == 'I' ? 'selected' : '' }}>I</option>
                            <option value="S" {{ $abseni->keterangan == 'S' ? 'selected' : '' }}>S</option>
                            <option value="A" {{ $abseni->keterangan == 'A' ? 'selected' : '' }}>A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="H" {{ $abseni->keterangan == 'H' ? 'selected' : '' }}>H</option>
                            <option value="I" {{ $abseni->keterangan == 'I' ? 'selected' : '' }}>I</option>
                            <option value="S" {{ $abseni->keterangan == 'S' ? 'selected' : '' }}>S</option>
                            <option value="A" {{ $abseni->keterangan == 'A' ? 'selected' : '' }}>A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="H" {{ $abseni->keterangan == 'H' ? 'selected' : '' }}>H</option>
                            <option value="I" {{ $abseni->keterangan == 'I' ? 'selected' : '' }}>I</option>
                            <option value="S" {{ $abseni->keterangan == 'S' ? 'selected' : '' }}>S</option>
                            <option value="A" {{ $abseni->keterangan == 'A' ? 'selected' : '' }}>A</option>
                        </select>
                    </td>
                    <td>
                        <select name="pertemuan" class="form-control">
                            <option value="H" {{ $abseni->keterangan == 'H' ? 'selected' : '' }}>H</option>
                            <option value="I" {{ $abseni->keterangan == 'I' ? 'selected' : '' }}>I</option>
                            <option value="S" {{ $abseni->keterangan == 'S' ? 'selected' : '' }}>S</option>
                            <option value="A" {{ $abseni->keterangan == 'A' ? 'selected' : '' }}>A</option>
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
