<?php
$query = mysqli_query($koneksi, "SELECT * FROM tess_siswa ORDER BY id DESC");

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    $delete = mysqli_query($koneksi, "DELETE FROM tess_siswa WHERE id='$id'");
    header("location:?pg=tess_siswa&hapus=berhasil");
}

?>
<div class="mb-3" align="right">
    <a href="?pg=tambah-tess_siswa" class="btn btn-primary btn sm">Tambah Tess Siswa</a>
    <table class=" table table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Email</th>
                <th>Alamat</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php $no = 1;
            while ($row = mysqli_fetch_assoc($query)): ?>
                <tr>
                    <td><?php echo $no++ ?></td>
                    <td><?php echo $row['nama_lengkap'] ?></td>
                    <td><?php echo $row['email'] ?></td>
                    <td><?php echo $row['alamat'] ?></td>
                    <td>
                        <a href="?pg=tambah-tess_siswa&edit=<?php echo $row['id'] ?>" class="btn btn-sm btn-success">
                            Edit</a>
                        <a onclick="return confirm('Apakah Anda Yakin Akan Menghapus Data Ini??')"
                            href="?pg=tess_siswa&delete=<?php echo $row['id'] ?>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            <?php endwhile ?>
        </tbody>