<?php
$query = mysqli_query($koneksi, "SELECT * FROM barang ORDER BY id DESC");

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    $foto = mysqli_query($koneksi, "SELECT * FROM barang WHERE id='$id'");
    $rowFoto = mysqli_fetch_assoc($foto);

    unlink("upload/" . $rowFoto['foto']);//unlink berfungsi untuk menghapus data
    $delete = mysqli_query($koneksi, "DELETE FROM barang WHERE id='$id'");
    header("location:?pg=produk&hapus=berhasil");
}
?>
<div class="mb-3" align="right">
    <a href="?pg=tambah-produk" class="btn btn-primary">Tambah Produk</a>
</div>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Harga</th>
            <th>Foto</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php $no = 1;
        while ($row = mysqli_fetch_assoc($query)): ?>
            <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $row['nama_barang'] ?></td>
                <td><?php echo $row['harga'] ?></td>
                <td><img class="img-thumbnail" width="60px" src="upload/<?php echo $row['foto'] ?>" alt="" </td>
                <td>
                    <a href="?pg=tambah-produk&edit=<?php echo $row['id'] ?>" class="btn btn-sm btn-success">Edit</a>
                    <a onclick="return confirm('Apakah Anda Yakin Akan Menghapus Produk Ini??')"
                        href="?pg=produk&delete=<?php echo $row['id'] ?>" class="btn btn-sm btn-danger"> Delete</a>
                </td>
            </tr>
        <?php endwhile ?>
    </tbody>
</table>