<?php
$query = mysqli_query($koneksi, "SELECT * FROM testimoni ORDER BY id DESC");

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    $delete = mysqli_query($koneksi, "DELETE FROM testimoni WHERE id='$id'");
    header("location:?pg=testimoni&hapus=berhasil");
}

?>
<div class="mb-3" align="right">
    <a href="?pg=tambah-testimoni" class="btn btn-primary btn sm">Tambah Testimoni</a>
    <table class=" table table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Jabatan</th>
                <th>Deskripsi</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php $no = 1;
            while ($row = mysqli_fetch_assoc($query)): ?>
                <tr>
                    <td><?php echo $no++ ?></td>
                    <td><?php echo $row['nama'] ?></td>
                    <td><?php echo $row['jabatan'] ?></td>
                    <td><?php echo $row['deskripsi'] ?></td>
                    <td>
                        <a href="?pg=tambah-testimoni&edit=<?php echo $row['id'] ?>" class="btn btn-sm btn-success">
                            Edit</a>
                        <a onclick="return confirm('Apakah Anda Yakin Akan Menghapus Data Ini??')"
                            href="?pg=testimoni&delete=<?php echo $row['id'] ?>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            <?php endwhile ?>
        </tbody>